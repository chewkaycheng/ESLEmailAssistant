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
    FEmailProcessThread: TEmailProcessThread;
    FEmailProcessor: TEmailProcessor;
    procedure OnReadCurrentInfo(var Msg: TMessage);
       message WM_READ_CURRENT_INFO;
    procedure OnSendEmailsCompleted(var Msg: TMessage);
      message WM_SEND_EMAILS_COMPLETED;
    procedure OnShowProgress(var Msg: TMessage);
      message WM_SHOW_PROGRESS;
    procedure BeforeShowMessage; override;
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
  try
    FCurrentInfo := TCurrentInfo.Create;
    FEmailProcessor := TEmailProcessor.Create(
      Self,
      FThreadException);

    TUtils.AdjustButtonsPanel(pnlButtons);
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      FParentForm.ShowErrorMessage(
        'Error',
        'TfrmSendEmails.FormCreate',
        E.Message,
        E.StackTrace
        );
    end;
    {$ENDIF}
  end;

end;

procedure TfrmSendEmails.FormDestroy(Sender: TObject);
begin
  try
    if Assigned(FCurrentInfo) then begin
      FreeAndNil(FCurrentInfo);
    end;
    if Assigned(FEmailProcessor) then begin
      FreeAndNil(FEmailProcessor);
    end;
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      FParentForm.ShowErrorMessage(
        'Error',
        'TfrmSendEmails.FormDestroy',
        E.Message,
        E.StackTrace
        );
    end;
    {$ENDIF}
  end;

  inherited FormDestroy(Sender);
end;

procedure TfrmSendEmails.FormShow(Sender: TObject);
begin
  try
    FParentForm.SVGimgSteps.ImageIndex := 5;
    if Not(FParentForm.SendEmailInitated) then begin
      lblSending.Caption := 'Click on the Send Emails button';
      pnlSummary.Visible := False;
    end else begin
      lblSending.Caption := 'Sending Email to:';
      pnlSummary.Visible := True;
    end;
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      FParentForm.ShowErrorMessage(
        'Error',
        'TfrmSendEmails.FormShow',
        E.Message,
        E.StackTrace
        );
    end;
    {$ENDIF}
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
  try
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
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      FParentForm.ShowErrorMessage(
        'Error',
        'TfrmSendEmails.OnReadCurrentInfo',
        E.Message,
        E.StackTrace
        );
    end;
    {$ENDIF}
  end;
end;

procedure TfrmSendEmails.OnSendEmailsCompleted(var Msg: TMessage);
begin
  try
    FParentForm.SVGimgSteps.ImageIndex := 6;
    if Assigned(FEmailProcessThread) then begin
      stpLeft.Caption := FEmailProcessThread.SendResult.GetSummary;
      FEmailProcessThread.KillThreadEvent.SetEvent;
      FEmailProcessThread.ThreadEndedEvent.WaitFor(2000);
      FreeAndNil(FEmailProcessThread);
    end;
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      FParentForm.ShowErrorMessage(
        'Error',
        'TfrmSendEmails.OnSendEmailsCompleted',
        E.Message,
        E.StackTrace
        );
    end;
    {$ENDIF}
  end;
end;

procedure TfrmSendEmails.BeforeShowMessage;
begin
  inherited;
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
  try
    LPercentComplete := Msg.WParam;
    circProgress.Value := LPercentComplete;
  
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      FParentForm.ShowErrorMessage(
        'Error',
        'TfrmSendEmails.OnShowProgress',
        E.Message,
        E.StackTrace
        );
    end;
    {$ENDIF}
  end;
end;

procedure TfrmSendEmails.ApplyTheme;
var
  I: Integer;
  LComp: TComponent;
begin
  try
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
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      FParentForm.ShowErrorMessage(
        'Error',
        'TfrmSendEmails.ApplyTheme',
        E.Message,
        E.StackTrace
        );
    end;
    {$ENDIF}
  end;

end;

procedure TfrmSendEmails.btnBackClick(Sender: TObject);
begin
  try
    if Not(FParentForm.SendEmailInitated) then begin
      if FParentForm.IsAuthorized then begin
        FParentForm.ShowPreviewForm;
      end else begin
        FParentForm.ShowAuthorizeForm;
      end;
    end;
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      FParentForm.ShowErrorMessage(
        'Error',
        'TfrmSendEmails.btnBackClick',
        E.Message,
        E.StackTrace
        );
    end;
    {$ENDIF}
  end;
end;

procedure TfrmSendEmails.btnSendEmailsClick(Sender: TObject);
begin
  try
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
        FThreadException,
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
  except
    {$IFDEF MadExceptOn}
    raise;
    {$ELSE}
    On E: Exception do begin
      FParentForm.ShowErrorMessage(
        'Error',
        'TfrmSendEmails.btnSendEmailsClick',
        E.Message,
        E.StackTrace
        );
    end;
    {$ENDIF}
  end;
end;

end.
