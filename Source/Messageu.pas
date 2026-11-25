unit Messageu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.TitleBarCtrls, scControls,
  scGPControls, scGPFontControls, CWSButton, Vcl.StdCtrls, RzLabel,
  CWSLabelColumn, CWSSettingsPanel, CWSMemo, RzStatus, Vcl.ExtCtrls, RzPanel,
  System.ImageList, Vcl.ImgList, SVGIconImageListBase, SVGIconImageList;

type
  TfrmMessage = class(TForm)
    brTitle: TTitleBarPanel;
    MessageImage: TscGPCharImage;
    pnlButtons: TCWSSettingsPanel;
    btnCancel: TCWSButton;
    btnOk: TCWSButton;
    lblMessage: TRzLabel;
    pnlTitle: TCWSSettingsPanel;
    lblCaption: TCWSLabelColumn;
    memError: TCWSMemo;
    sbMain: TRzStatusBar;
    stpLeft: TRzStatusPane;
    stpRight: TRzStatusPane;
    btnCopy: TCWSButton;
    SVGIconImageList1: TSVGIconImageList;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
  private
    procedure ApplyTheme;
  public
  end;

implementation

uses
  System.IOUtils,
  CWSFluentColorsMulti,

  Constsu,
  Utilsu,
  Winapi.ShellAPI, System.Generics.Collections;

{$R *.dfm}

procedure TfrmMessage.FormCreate(Sender: TObject);
begin
  ScaleForPPI(CurrentPPI);
  RegisterThemeChange(Self.ApplyTheme);
  FluentApplySystemTheme;
  TUtils.AdjustButtonsPanel(pnlButtons);

  Constraints.MinHeight := MulDiv(350, Screen.PixelsPerInch, 96);
  Constraints.MinWidth := MulDiv(540, Screen.PixelsPerInch, 96);
  Width := MulDiv(540, Screen.PixelsPerInch, 96);
  Height := MulDiv(350, Screen.PixelsPerInch, 96);
end;

procedure TfrmMessage.FormDestroy(Sender: TObject);
begin
  UnregisterThemeChange(Self.ApplyTheme);
end;

procedure TfrmMessage.ApplyTheme;
var
  LComp: TComponent;
  I: Integer;
begin
  Self.Color := flNeutralBackground1;
  TCWSMemo(memError).BackgroundColor := flNeutralBackground2;
  TCWSMemo(memError).BackgroundFocusColor := flNeutralBackground2;
  TCWSMemo(memError).BackgroundHoverColor := flNeutralBackground1Hover;
  TCWSMemo(memError).BorderColor := flNeutralStroke1;
  TCWSMemo(memError).DisabledColor := flNeutralBackgroundDisabled;
  TCWSMemo(memError).DisabledBorderColor := flNeutralStrokeDisabled;
  TCWSMemo(memError).LabelColor := flNeutralForeground2;
  TCWSMemo(memError).AccentColor := flNeutralForeground2BrandPressed;
  TCWSMemo(memError).Font.Color := flNeutralForeground1;

  TUtils.SetStatusBarColor(sbMain);
  TUtils.SetPanelColor(pnlTitle);
  TUtils.SetPanelColor(pnlButtons);
  lblCaption.LeftFont.Color := flNeutralForeground1;
  for I := 0 to ComponentCount - 1 do  begin
    LComp := Components[I];
    if LComp is TRzLabel then begin
      TUtils.SetLabelColor(LComp as TRzLabel)
    end;
  end;
end;

function EnumNotepadWindowsProc(AWnd: HWND; ALParam: LPARAM): BOOL; stdcall;
var
  LClass: array[0..63] of Char;
begin
  Result := True;
  if GetClassName(AWnd, LClass, Length(LClass)) > 0 then
    if SameText(string(LClass), 'Notepad') then
      TList<HWND>(ALParam).Add(AWnd);
end;

procedure CollectNotepadWindows(AList: TList<HWND>);
begin
  EnumWindows(@EnumNotepadWindowsProc, LPARAM(AList));
end;

procedure ForceForeground(AWnd: HWND);
var
  LTargetThread: DWORD;
begin
  if AWnd = 0 then
    Exit;
  LTargetThread := GetWindowThreadProcessId(AWnd, nil);
  if LTargetThread = GetCurrentThreadId then
  begin
    SetForegroundWindow(AWnd);
    Exit;
  end;
  AttachThreadInput(GetCurrentThreadId, LTargetThread, True);
  try
    BringWindowToTop(AWnd);
    SetForegroundWindow(AWnd);
  finally
    AttachThreadInput(GetCurrentThreadId, LTargetThread, False);
  end;
end;

procedure SendCtrlKey(AVk: Byte);
begin
  keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), 0, 0);
  keybd_event(AVk, MapVirtualKey(AVk, 0), 0, 0);
  Sleep(30);
  keybd_event(AVk, MapVirtualKey(AVk, 0), KEYEVENTF_KEYUP, 0);
  keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), KEYEVENTF_KEYUP, 0);
end;

procedure TfrmMessage.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmMessage.btnCopyClick(Sender: TObject);
var
  LBefore, LNow: TList<HWND>;
  LTarget: HWND;
  LIsNewWindow: Boolean;
  I, J: Integer;
begin
  LBefore := TList<HWND>.Create;
  LNow := TList<HWND>.Create;
  try
    // 1. Snapshot the Notepad windows that already exist
    CollectNotepadWindows(LBefore);

    // 2. Put the text on the clipboard
    memError.SelectAll;
    memError.CopyToClipboard;

    // 3. Start Notepad
    ShellExecute(0, 'open', 'notepad.exe', nil, nil, SW_SHOWNORMAL);

    // 4. Wait for a Notepad window that was NOT there before
    LTarget := 0;
    LIsNewWindow := False;
    for I := 1 to 50 do
    begin
      Sleep(100);
      LNow.Clear;
      CollectNotepadWindows(LNow);
      for J := 0 to LNow.Count - 1 do
        if LBefore.IndexOf(LNow[J]) < 0 then
        begin
          LTarget := LNow[J];
          LIsNewWindow := True;
          Break;
        end;
      if LTarget <> 0 then
        Break;
    end;

    // 5. No new window (single-instance / tabbed Notepad): use the one it focused
    if LTarget = 0 then
      LTarget := GetForegroundWindow;

    if LTarget = 0 then
      Exit;                      // nothing usable, clipboard still holds the text

    ForceForeground(LTarget);
    Sleep(300);

    // 6. Ensure we are in a brand new, empty document
    if not LIsNewWindow then
    begin
      SendCtrlKey(Ord('N'));     // Ctrl+N -> new tab / new document
      Sleep(500);
    end;

    // 7. Paste
    SendCtrlKey(Ord('V'));
  finally
    LNow.Free;
    LBefore.Free;
  end;
end;

procedure TfrmMessage.btnOkClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

end.
