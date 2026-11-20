{-------------------------------------------------------------------------------
Custom SynEdit highlighter for email token highlighting.

Highlights the keywords:
  Room, StudentName, TeacherName, ChildcareLevel, ClassLevel

The keywords are recognized only when wrapped in braces.
Plain keywords without braces are treated as ordinary identifiers.

This unit is based on the TurboPack SynEdit source code
(https://github.com/TurboPack/SynEdit), in particular:
  * Source/Highlighters/SynHighlighterAWK.pas   (reference highlighter pattern)
  * Source/SynEditHighlighter.pas               (TSynCustomHighlighter base class)
  * Source/SynEditStrConst.pas                  (SYNS_* / SYN_ATTR_ constants)
  * SynGen/Highlighters-HowTo.htm               (grammar / creation guide)

Base-class members and constants used below were verified against those source
files so that no assumptions are made about properties or events.
-------------------------------------------------------------------------------}

{$POINTERMATH ON}

unit SynHighlighterEmailTokens;

interface

uses
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  SynEditTypes,
  SynEditHighlighter,
  SynUnicode,
  SynFunc;

type
  { Token kinds mirroring the AWK reference highlighter. Prefix 'tk' per the
    SynGen HowTo convention. }
  TtkTokenKind = (
    tkComment,
    tkIdentifier,
    tkKey,
    tkNull,
    tkSpace,
    tkString,
    tkSymbol,
    tkUnknown);

  TSynHighlighterEmailTokens = class(TSynCustomHighLighter)
  private
    fTokenID: TtkTokenKind;
    fCommentAttri: TSynHighlighterAttributes;
    fIdentifierAttri: TSynHighlighterAttributes;
    fKeyAttri: TSynHighlighterAttributes;
    fNullAttri: TSynHighlighterAttributes;
    fSpaceAttri: TSynHighlighterAttributes;
    fStringAttri: TSynHighlighterAttributes;
    fSymbolAttri: TSynHighlighterAttributes;
    procedure BraceKeywordProc;
    procedure CommentProc;
    procedure CRProc;
    procedure IdentProc;
    procedure LFProc;
    procedure NullProc;
    procedure SpaceProc;
    procedure StringProc;
    procedure SymbolProc;
    function IsKeyword(AStart: TSynNativeInt; ALen: TSynNativeInt;
      const AKey: string): Boolean;
    procedure OnThemeChange;
    procedure UpdateThemeColors;
  protected
    function IsFilterStored: Boolean; override;
  public
    class function GetLanguageName: string; override;
    class function GetFriendlyLanguageName: string; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function GetDefaultAttribute(Index: Integer): TSynHighlighterAttributes; override;
    function GetEol: Boolean; override;
    function GetTokenID: TtkTokenKind;
    function GetTokenAttribute: TSynHighlighterAttributes; override;
    function GetTokenKind: TSynNativeInt; override;
    procedure Next; override;
  published
    property CommentAttri: TSynHighlighterAttributes read fCommentAttri write fCommentAttri;
    property IdentifierAttri: TSynHighlighterAttributes read fIdentifierAttri write fIdentifierAttri;
    property KeyAttri: TSynHighlighterAttributes read fKeyAttri write fKeyAttri;
    property NullAttri: TSynHighlighterAttributes read fNullAttri write fNullAttri;
    property SpaceAttri: TSynHighlighterAttributes read fSpaceAttri write fSpaceAttri;
    property StringAttri: TSynHighlighterAttributes read fStringAttri write fStringAttri;
    property SymbolAttri: TSynHighlighterAttributes read fSymbolAttri write fSymbolAttri;
  end;

implementation

uses
  CWSFluentColorsMulti,
  SynEditStrConst;

{---------------------------------------------------------------------------
  Language / filter metadata
---------------------------------------------------------------------------}

const
  SYNS_LangEmailTokens = 'EmailTokens';
  SYNS_FriendlyLangEmailTokens = 'Email Tokens';

  SYNS_FilterEmailTokens =
    'Email token files (*.txt;*.etok)|*.txt;*.etok|All files (*.*)|*.*';

{---------------------------------------------------------------------------
  Create / Destroy
---------------------------------------------------------------------------}

constructor TSynHighlighterEmailTokens.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  { Case-sensitive keyword matching (matches the AWK reference highlighter). }
  fCaseSensitive := True;

  fCommentAttri := TSynHighlighterAttributes.Create(SYNS_AttrComment, SYNS_FriendlyAttrComment);
  fCommentAttri.Foreground := flNeutralForeground2;
  AddAttribute(fCommentAttri);

  fIdentifierAttri := TSynHighlighterAttributes.Create(SYNS_AttrIdentifier, SYNS_FriendlyAttrIdentifier);
  fIdentifierAttri.Foreground := flNeutralForeground1;
  AddAttribute(fIdentifierAttri);

  fKeyAttri := TSynHighlighterAttributes.Create(SYNS_AttrReservedWord, SYNS_FriendlyAttrReservedWord);
  fKeyAttri.Foreground := flNeutralForeground1;   { dark blue for the highlighted keywords }
  fKeyAttri.Style := [fsBold];
  AddAttribute(fKeyAttri);

  fNullAttri := TSynHighlighterAttributes.Create(SYNS_AttrNull, SYNS_FriendlyAttrNull);
  AddAttribute(fNullAttri);

  fSpaceAttri := TSynHighlighterAttributes.Create(SYNS_AttrSpace, SYNS_FriendlyAttrSpace);
  AddAttribute(fSpaceAttri);

  fStringAttri := TSynHighlighterAttributes.Create(SYNS_AttrString, SYNS_FriendlyAttrString);
  fStringAttri.Foreground := flBrandForeground2;
  AddAttribute(fStringAttri);

  fSymbolAttri := TSynHighlighterAttributes.Create(SYNS_AttrSymbol, SYNS_FriendlyAttrSymbol);
  AddAttribute(fSymbolAttri);

  SetAttributesOnChange(DefHighlightChange);
  fDefaultFilter := SYNS_FilterEmailTokens;

  RegisterThemeChange(Self.OnThemeChange);
end;

destructor TSynHighlighterEmailTokens.Destroy;
begin
  UnregisterThemeChange(Self.OnThemeChange);
  inherited Destroy;
end;

{---------------------------------------------------------------------------
  Next  -  token dispatcher
---------------------------------------------------------------------------}

procedure TSynHighlighterEmailTokens.Next;
begin
  fTokenPos := Run;
  case fLine[Run] of
    #0: NullProc;
    #10: LFProc;
    #13: CRProc;
    #1..#9, #11, #12, #14..#32: SpaceProc;
    '"': StringProc;             { "..." }
    '{': BraceKeywordProc;       { Keyword or comment }
    'a'..'z', 'A'..'Z', '_': IdentProc;
    '0'..'9': SymbolProc;        { treat digits as a symbol token }
    else SymbolProc;
  end;
  inherited;
end;

{---------------------------------------------------------------------------
  Individual token procedures
---------------------------------------------------------------------------}

procedure TSynHighlighterEmailTokens.CommentProc;
begin
  fTokenID := tkComment;
  while not IsLineEnd(Run) do
    Inc(Run);
end;

procedure TSynHighlighterEmailTokens.BraceKeywordProc;
var
  i: TSynNativeInt;
  L: TSynNativeInt;
begin
  i := Run + 1; { position just after the opening '{' }
  // scan forward to the closing '}' or end of line
  while (i <= fLineLen) and (fLine[i] <> '}') and not IsLineEnd(i) do
    Inc(i);
  { a closing brace was found on this line }
  if (i <= fLineLen) and (fLine[i] = '}') then
  begin
    L := i - (Run + 1); { length of text between the braces }
    if IsKeyword(Run + 1, L, 'Room') then
      fTokenID := tkKey
    else if IsKeyword(Run + 1, L, 'StudentName') then
      fTokenID := tkKey
    else if IsKeyword(Run + 1, L, 'TeacherName') then
      fTokenID := tkKey
    else if IsKeyword(Run + 1, L, 'ChildcareLevel') then
      fTokenID := tkKey
    else if IsKeyword(Run + 1, L, 'ClassLevel') then
      fTokenID := tkKey
    else
    begin
      { not a keyword: treat the whole brace group as a comment }
      fTokenID := tkComment;
      while not IsLineEnd(Run) do
        Inc(Run);
      Exit;
    end;
    // consume the entire {Keyword} including both braces
    Run := i + 1;
    Exit;
  end;
  { no closing brace on this line: treat as a comment to end of line }
  fTokenID := tkComment;
  while not IsLineEnd(Run) do
    Inc(Run);
end;

procedure TSynHighlighterEmailTokens.CRProc;
begin
  fTokenID := tkSpace;
  Inc(Run);
  if fLine[Run] = #10 then Inc(Run);
end;

function TSynHighlighterEmailTokens.IsKeyword(AStart: TSynNativeInt; ALen: TSynNativeInt;
  const AKey: string): Boolean;
var
  k: Integer;
begin
  Result := Length(AKey) = ALen;
  if Result then
  begin
    for k := 1 to Length(AKey) do
    begin
      if fLine[AStart + k - 1] <> AKey[k] then
      begin
        Result := False;
        Break;
      end;
    end;
  end;
end;

procedure TSynHighlighterEmailTokens.IdentProc;
var
  i: TSynNativeInt;
begin
  i := Run;
  while CharInSet(fLine[i], ['_', '0'..'9', 'a'..'z', 'A'..'Z']) do
    Inc(i);
  Run := i;
  fTokenID := tkIdentifier;
end;

procedure TSynHighlighterEmailTokens.LFProc;
begin
  fTokenID := tkSpace;
  Inc(Run);
end;

procedure TSynHighlighterEmailTokens.NullProc;
begin
  fTokenID := tkNull;
  Inc(Run);
end;

procedure TSynHighlighterEmailTokens.OnThemeChange;
begin
  UpdateThemeColors;
end;

procedure TSynHighlighterEmailTokens.SpaceProc;
begin
  Inc(Run);
  fTokenID := tkSpace;
  while (fLine[Run] <= #32) and not IsLineEnd(Run) do Inc(Run);
end;

procedure TSynHighlighterEmailTokens.StringProc;
begin
  repeat
    Inc(Run);
    if (fLine[Run] = '"') then
    begin
      fTokenID := tkString;
      Inc(Run);
      Exit;
    end;
  until CharInSet(fLine[Run], [#0..#31]);
  fTokenID := tkIdentifier;
end;

procedure TSynHighlighterEmailTokens.SymbolProc;
begin
  fTokenID := tkSymbol;
  Inc(Run);
end;

procedure TSynHighlighterEmailTokens.UpdateThemeColors;
begin
  fCommentAttri.Foreground := flNeutralForeground2;
  fIdentifierAttri.Foreground := flNeutralForeground1;
  fKeyAttri.Foreground := flBrandForeground1;
  fStringAttri.Foreground := flBrandForeground2;
end;

{---------------------------------------------------------------------------
  Attribute / token queries
---------------------------------------------------------------------------}

function TSynHighlighterEmailTokens.GetDefaultAttribute(Index: Integer): TSynHighlighterAttributes;
begin
  case Index of
    SYN_ATTR_COMMENT:    Result := fCommentAttri;
    SYN_ATTR_IDENTIFIER: Result := fIdentifierAttri;
    SYN_ATTR_KEYWORD:    Result := fKeyAttri;
    SYN_ATTR_STRING:     Result := fStringAttri;
    SYN_ATTR_SYMBOL:     Result := fSymbolAttri;
    SYN_ATTR_WHITESPACE: Result := fSpaceAttri;
  else
    Result := nil;
  end;
end;

function TSynHighlighterEmailTokens.GetEol: Boolean;
begin
  Result := Run = fLineLen + 1;
end;

function TSynHighlighterEmailTokens.GetTokenID: TtkTokenKind;
begin
  Result := fTokenID;
end;

function TSynHighlighterEmailTokens.GetTokenAttribute: TSynHighlighterAttributes;
begin
  case fTokenID of
    tkComment:    Result := fCommentAttri;
    tkIdentifier: Result := fIdentifierAttri;
    tkKey:        Result := fKeyAttri;
    tkNull:       Result := fNullAttri;
    tkSpace:      Result := fSpaceAttri;
    tkString:     Result := fStringAttri;
    tkSymbol:     Result := fSymbolAttri;
  else
    Result := nil;
  end;
end;

function TSynHighlighterEmailTokens.GetTokenKind: TSynNativeInt;
begin
  Result := Ord(fTokenID);
end;

function TSynHighlighterEmailTokens.IsFilterStored: Boolean;
begin
  Result := fDefaultFilter <> SYNS_FilterEmailTokens;
end;

class function TSynHighlighterEmailTokens.GetLanguageName: string;
begin
  Result := SYNS_LangEmailTokens;
end;

class function TSynHighlighterEmailTokens.GetFriendlyLanguageName: string;
begin
  Result := SYNS_FriendlyLangEmailTokens;
end;

initialization
  RegisterPlaceableHighlighter(TSynHighlighterEmailTokens);
end.
