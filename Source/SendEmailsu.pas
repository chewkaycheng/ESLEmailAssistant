unit SendEmailsu;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.ImageList,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.ImgList,

  CWSButton,
  CWSSettingsPanel,
  CWSProgressCircle,

  SVGIconImageListBase,
  SVGIconImageList,

  RzStatus,
  RzPanel,
  RzLabel,

  Constsu,
  BaseFormu,
  EmailProcessoru;


type
  TfrmSendEmails = class(TfrmBase)
    pnlButtons: TCWSSettingsPanel;
    btnSendEmails: TCWSButton;
    sbMain: TRzStatusBar;
    stpLeft: TRzStatusPane;
    stpRight: TRzStatusPane;
    SVGIconImageList1: TSVGIconImageList;
    btnBack: TCWSButton;
    CWSSettingsPanel1: TCWSSettingsPanel;
    CWSSettingsPanel3: TCWSSettingsPanel;
    CWSSettingsPanel2: TCWSSettingsPanel;
    circProgress: TCWSProgressCircle;
    pnlChildcare: TCWSSettingsPanel;
    CWSSettingsPanel4: TCWSSettingsPanel;
    lblChildcareRight: TRzLabel;
    lblChildcareLeft: TRzLabel;
    pnlStudent: TCWSSettingsPanel;
    lblNameRight: TRzLabel;
    lblNameLeft: TRzLabel;
    pnlTeacher: TCWSSettingsPanel;
    lblTeacherRight: TRzLabel;
    lblTeacherLeft: TRzLabel;
    pnlRoom: TCWSSettingsPanel;
    lblRoomRight: TRzLabel;
    lblRoomLeft: TRzLabel;
    pnlClassLevel: TCWSSettingsPanel;
    lblClassLevelRight: TRzLabel;
    lblClassLevelLeft: TRzLabel;
    lblSending: TRzLabel;
    CWSSettingsPanel10: TCWSSettingsPanel;
    RzLabel1: TRzLabel;
    pnlSummary: TCWSSettingsPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure btnSendEmailsClick(Sender: TObject);
  private
    FCurrentInfo: TCurrentInfo;
    FEmailException: TEmailException;
    FEmailProcessThread: TEmailProcessThread;
    FEmailProcessor: TEmailProcessor;
    procedure OnReadCurrentInfo(var Msg: TMessage);
       message WM_READ_CURRENT_INFO;
    procedure OnShowErrorMsg(var Msg: TMessage);
       message WM_SHOW_SEND_ERROR;
    procedure OnSendEmailsCompleted(var Msg: TMessage);
      message WM_SEND_EMAILS_COMPLETED;
    procedure OnShowProgress(var Msg: TMessage);
      message WM_SHOW_PROGRESS;
  public
  protected
    procedure ApplyTheme; override;
  end;

var
  frmSendEmails: TfrmSendEmails;

implementation

uses
  System.IOUtils,
  CWSFluentColorsMulti,
  RzCommon,

  Utilsu;

{$R *.dfm}

{ TfrmSendEmails }

procedure TfrmSendEmails.FormCreate(Sender: TObject);
begin
  inherited FormCreate(Sender);
  FCurrentInfo := TCurrentInfo.Create;
  FEmailException := TEmailException.Create;
  FEmailProcessor := TEmailProcessor.Create;

  TUtils.AdjustButtonsPanel(pnlButtons);
end;

procedure TfrmSendEmails.FormDestroy(Sender: TObject);
begin
  if Assigned(FCurrentInfo) then begin
    FreeAndNil(FCurrentInfo);
  end;
  if Assigned(FEmailException) then begin
    FreeAndNil(FEmailException);
  end;
  if Assigned(FEmailProcessor) then begin
    FreeAndNil(FEmailProcessor);
  end;

  inherited FormDestroy(Sender);
end;

procedure TfrmSendEmails.FormShow(Sender: TObject);
begin
  FParentForm.SVGimgSteps.ImageIndex := 5;
  if Not(FParentForm.SendEmailInitated) then begin
    lblSending.Caption := 'Click on the Send Emails button';
    pnlSummary.Visible := False;
  end else begin
    lblSending.Caption := 'Sending Email to:';
    pnlSummary.Visible := True;
  end;
end;

procedure TfrmSendEmails.OnReadCurrentInfo(var Msg: TMessage);
var
  LStudentName,
  LTeacherName,
  LRoomNumber,
  LClassLevel,
  LChildcareLevel: String;
begin
  FCurrentInfo.GetInfo(
    LStudentName,
    LTeacherName,
    LRoomNumber,
    LClassLevel,
    LChildcareLevel);
  lblNameRight.Caption := LStudentName;
  lblTeacherRight.Caption := LTeacherName;
  lblRoomRight.Caption := LRoomNumber;
  lblClassLevelRight.Caption := LClassLevel;
  lblChildcareRight.Caption := LChildcareLevel;
end;

procedure TfrmSendEmails.OnSendEmailsCompleted(var Msg: TMessage);
begin
  FParentForm.SVGimgSteps.ImageIndex := 6;
  if Assigned(FEmailProcessThread) then begin
    stpLeft.Caption := FEmailProcessThread.SendResult.GetSummary;
    FEmailProcessThread.KillThreadEvent.SetEvent;
    FEmailProcessThread.ThreadEndedEvent.WaitFor(2000);
    FreeAndNil(FEmailProcessThread);
  end;
end;

procedure TfrmSendEmails.OnShowErrorMsg(var Msg: TMessage);
var
  LException: String;
begin
  FEmailException.GetErrorMsg(LException);
  ShowMessage(LException);
  if Assigned(FEmailProcessThread) then begin
    FEmailProcessThread.KillThreadEvent.SetEvent;
    FEmailProcessThread.ThreadEndedEvent.WaitFor(2000);
    FreeAndNil(FEmailProcessThread);
  end;
end;

procedure TfrmSendEmails.OnShowProgress(var Msg: TMessage);
var
  LPercentComplete: Integer;
begin
  LPercentComplete := Msg.WParam;
  circProgress.Value := LPercentComplete;
end;

procedure TfrmSendEmails.ApplyTheme;
var
  I: Integer;
  LComp: TComponent;
begin
  Self.Color := flNeutralBackground1;

  TUtils.SetStatusBarColor(sbMain);
  TUtils.SetTPanelsColor(Self);
  TUtils.SetPanelColor(pnlButtons);

  circProgress.TextColor := flNeutralForeground1;

  for I := 0 to ComponentCount - 1 do  begin
    LComp := Components[I];

    if LComp is TCWSSettingsPanel then begin
      TUtils.SetPanelColor(TCWSSettingsPanel(LComp));
    end;

    if LComp is TRzLabel then begin
      TUtils.SetLabelColor(LComp as TRzLabel)
    end;
  end;
end;

procedure TfrmSendEmails.btnBackClick(Sender: TObject);
begin
  if Not(FParentForm.SendEmailInitated) then begin
    if FParentForm.IsAuthorized then begin
      FParentForm.ShowPreviewForm;
    end else begin
      FParentForm.ShowAuthorizeForm;
    end;
  end;
end;

procedure TfrmSendEmails.btnSendEmailsClick(Sender: TObject);
begin
  lblSending.Caption := 'Sending Email to:';
  pnlSummary.Visible := True;
  if btnSendEmails.Caption = 'Send Emails' then begin
    btnSendEmails.Caption := 'Stop';
    btnSendEmails.ImageIndex := 2;
    FEmailProcessThread := TEmailProcessThread.Create(
      True,
      Self.Handle,
      FParentForm.FullCheckpointCSVFileName,
      FParentForm.FullSendErrorFileName,
      FEmailProcessor,
      FCurrentInfo,
      FEmailException,
      FParentForm.SessionIniValues.Subject,
      FParentForm.ismtpMain);
    FEmailProcessThread.Start;
    FParentForm.SendEmailInitated := True;
  end else begin
    btnSendEmails.Caption := 'Send Emails';
    btnSendEmails.ImageIndex := 0;
    if Assigned(FEmailProcessThread) then begin
      FEmailProcessThread.KillThreadEvent.SetEvent;
      FEmailProcessThread.ThreadEndedEvent.WaitFor(2000);
      FreeAndNil(FEmailProcessThread);
    end;
  end;
end;

end.
