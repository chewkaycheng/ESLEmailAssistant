unit BaseFormu;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,

  CWSSettingsPanel,
  CWSButton,
  CWSRadioButton,
  CWSDBGrid,
  CWSCheckDBGrid,

  RzStatus,
  RzPanel,
  RzLabel,

  Mainu,
  Constsu;


type
  TfrmBase = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  protected
    { Private declarations }
    FParentForm: TfrmMain;
    procedure ApplyTheme; virtual; abstract;
  public
    { Public declarations }
    property ParentForm: TfrmMain
      read FParentForm
      write FParentForm;
  end;

var
  frmBase: TfrmBase;

implementation

uses
  System.IOUtils,

  CWSFluentColorsMulti,
  RzCommon,

  Utilsu,
  IniFileHandleru;

{$R *.dfm}

procedure TfrmBase.FormCreate(Sender: TObject);
begin
  ScaleForPPI(CurrentPPI);
  RegisterThemeChange(Self.ApplyTheme);
  FluentApplySystemTheme;

  Self.Scaled := False;
  Self.Scaled := True;
end;

procedure TfrmBase.FormDestroy(Sender: TObject);
begin
  UnregisterThemeChange(Self.ApplyTheme);
end;

end.
