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
  Utilsu,
  Constsu;


type
  TfrmBase = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  protected
    { Private declarations }
    FParentForm: TfrmMain;
    FThreadException: TThreadException;
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

  IniFileHandleru;

{$R *.dfm}

procedure TfrmBase.BeforeShowMessage;
begin
  //
end;

procedure TfrmBase.FormCreate(Sender: TObject);
begin
  try
    ScaleForPPI(CurrentPPI);
    RegisterThemeChange(Self.ApplyTheme);
    FluentApplySystemTheme;

    FThreadException := TThreadException.Create;
    Self.Scaled := False;
    Self.Scaled := True;
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      FParentForm.ShowErrorMessage(
        'Error',
        'TfrmBase.FormCreate',
        E.Message,
        E.StackTrace
        );
    end;
    {$ENDIF}
  end;
end;

procedure TfrmBase.FormDestroy(Sender: TObject);
begin
  try
    if Assigned(FThreadException) then begin
      FreeAndNil(FThreadException);
    end;
    UnregisterThemeChange(Self.ApplyTheme);
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      FParentForm.ShowErrorMessage(
        'Error',
        'TfrmBase.FormDestroy',
        E.Message,
        E.StackTrace
        );
    end;
    {$ENDIF}
  end;
end;

procedure TfrmBase.OnShowErrorMsg(var Msg: TMessage);
var
  LProcName: String;
  LErrorMsg: String;
  LStackTrace: String;
begin
  BeforeShowMessage;
  FThreadException.GetErrorInfo(
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
