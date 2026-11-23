program ESLEmailAssistant;

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  Vcl.Forms,
  Mainu in '..\Source\Mainu.pas' {frmMain},
  Utilsu in '..\Source\Utilsu.pas',
  Constsu in '..\Source\Constsu.pas',
  IniFileHandleru in '..\Source\IniFileHandleru.pas',
  Welcomeu in '..\Source\Welcomeu.pas' {frmWelcome},
  Recipientsu in '..\Source\Recipientsu.pas' {frmRecipients},
  Composeu in '..\Source\Composeu.pas' {frmCompose},
  FileUtilsu in '..\Source\FileUtilsu.pas',
  DMMainu in '..\Source\DMMainu.pas' {dmMain: TDataModule},
  SimpleLoggeru in '..\Source\SimpleLoggeru.pas',
  SynHighlighterEmailTokens in '..\Source\SynHighlighterEmailTokens.pas',
  EmailProcessoru in '..\Source\EmailProcessoru.pas',
  FileSystemMonitor in '..\Source\FileSystemMonitor.pas',
  EditMessageTemplateu in '..\Source\EditMessageTemplateu.pas' {frmEditMessageTemplate},
  dlg_info in '..\Source\dlg_info.pas' {dlgInfo},
  BaseFormu in '..\Source\BaseFormu.pas' {frmBase},
  Authorizeu in '..\Source\Authorizeu.pas' {frmAuthorize},
  SendEmailsu in '..\Source\SendEmailsu.pas' {frmSendEmails},
  GridTestu in '..\Source\GridTestu.pas' {frmGridTest},
  Previewu in '..\Source\Previewu.pas' {frmPreview};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmWelcome, frmWelcome);
  Application.CreateForm(TfrmRecipients, frmRecipients);
  Application.CreateForm(TfrmCompose, frmCompose);
  Application.CreateForm(TdmMain, dmMain);
  Application.CreateForm(TdlgInfo, dlgInfo);
  Application.CreateForm(TfrmEditMessageTemplate, frmEditMessageTemplate);
  Application.CreateForm(TfrmAuthorize, frmAuthorize);
  Application.CreateForm(TfrmSendEmails, frmSendEmails);
  Application.CreateForm(TfrmGridTest, frmGridTest);
  Application.CreateForm(TfrmPreview, frmPreview);
  Application.Run;
end.
