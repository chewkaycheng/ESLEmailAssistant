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

  EmailProcessoru,
  Mainu,
  Constsu;


type
  TfrmBase = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  protected
    { Private declarations }
    FParentForm: TfrmMain;
    FEmailException: TEmailException;
    procedure ApplyTheme; virtual; abstract;
  public
    { Public declarations }
    property ParentForm: TfrmMain
      read FParentForm
      write FParentForm;
    procedure BeforeShowMessage; virtual;
    procedure OnShowErrorMsg(var Msg: TMessage);
       message WM_SHOW_SEND_ERROR;
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

procedure TfrmBase.BeforeShowMessage;
begin
  //
end;

procedure TfrmBase.FormCreate(Sender: TObject);
begin
  ScaleForPPI(CurrentPPI);
  RegisterThemeChange(Self.ApplyTheme);
  FluentApplySystemTheme;

  FEmailException := TEmailException.Create;
  Self.Scaled := False;
  Self.Scaled := True;
end;

procedure TfrmBase.FormDestroy(Sender: TObject);
begin
  if Assigned(FEmailException) then begin
    FreeAndNil(FEmailException);
  end;
  UnregisterThemeChange(Self.ApplyTheme);
end;

procedure TfrmBase.OnShowErrorMsg(var Msg: TMessage);
var
  LProcName: String;
  LErrorMsg: String;
  LStackTrace: String;
begin
  BeforeShowMessage;
  FEmailException.GetErrorInfo(
    LProcName,
    LErrorMsg,
    LStackTrace);
  ParentForm.ShowErrorMessage(
    'Error',
    LProcName,
    LErrorMsg,
    LStackTrace);
end;

end.
