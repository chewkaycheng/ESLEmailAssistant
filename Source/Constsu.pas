unit Constsu;

interface

uses
  Daisy.Theme;

type
  TImageSteps = (stWelcome=0, stRecipients=1, stCompose=2, stPreview=3,
    tsAuthorize=4, tsSend=5);
  TRecipientType = (rtAllStudents=0, rtStudentsByCountries=1, rtStudentsByClassLevels=2);

const
  DefaultThemeKind: TDaisyThemeKind        = TDaisyThemeKind.dtCorporate;
  DarkThemeKind: TDaisyThemeKind           = TDaisyThemeKind.dtDark;
  DefaultThemeButtonVariant: TDaisyVariant = TDaisyVariant.dvPrimary;
  DarkThemeButtonVariant: TDaisyVariant    = TDaisyVariant.dvNeutral;

  FormWidth: Integer = 900;
  FormHeight: Integer = 700;

  InputFontSize = 10;

  CheckpointFile = 'esl_pending.csv';
  SourceFilesDir = 'source_files';
  BackupFilesDir = 'backup_files';

  AppLogFile     = 'app.log';
  AppIniFile     = 'app.ini';
  SessionIniFile = 'session.ini';
  SubjectFile    = 'esl_subject.txt';
  Subject        = 'Subject';

  CountriesTable             = 'countriesTable';
  ClassLevelsTable           = 'classlevelsTable';
  RecipientsByCountriesCsv   = 'recipientsbycountries.csv';
  RecipientsByClassLevelsCsv = 'recipientsbyclasslevels.csv';

  Settings           = 'Settings';
  SendEmailInitiated = 'SendEmailInitiated';
  SelectedStudent    = 'SelectedStudent';
  RecipientType      = 'RecipientType';

  ESLAdmin = 'ESLAdmin';

  IniSettingsSection = 'Settings';
  IniDarkMode        = 'DarkMode';

  IniConvenience = 'Convenience';

  IniDatabaseSection = 'Database';
  IniServer          = 'Server';
  IniDatabase        = 'Database';
  IniParam1          = 'Param1';
  IniParam2          = 'Param2';
  IniPooled          = 'Pooled';
  IniPoolMax         = 'POOL_MaximumItems';
  IniConDef          = 'ConnectionDef';
  IniConDefName      = 'ConnectionDefinitionName';
  IniDriverFB        = 'FB';
  IniServerDefault   = '127.0.0.1';

  IniImportSection        = 'Import';
  IniNATag                = 'NATag';
  IniNATagDefault         = 'NA';
  IniDateFormat           = 'DateFormat';
  IniTimeFormat           = 'TimeFormat';
  IniDateFormatDefault    = 'mm/dd/yyyy';
  IniTimeFormatDefault    = 'hh:mm:ss';

  IniEmailSection          = 'Email';
  IniIOHandler             = 'IOHandler';
  IniHost                  = 'Host';
  IniPort                  = 'Port';
  IniUsername              = 'Username';
  IniUser_name             = 'User_Name';
  IniClientId              = 'GC';
  IniClientSecret          = 'GS';
  IniServerAuthUrl         = 'https://accounts.google.com/o/oauth2/auth';
  IniServerTokenUrl        = 'https://accounts.google.com/o/oauth2/token';
  IniAuthorizationScope    = 'https://mail.google.com/';
  IniGoogleMailServer      = 'smtp.gmail.com';
  IniPassword              = 'Password';
  IniUseTLS                = 'UseTLS';
  IniConv                  = 'Conv';

implementation

end.
