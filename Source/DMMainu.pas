unit DMMainu;

interface

uses
  System.SysUtils,
  System.Classes,

  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.VCLUI.Wait,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Phys.FBDef,
  FireDAC.Phys.IBBase,
  FireDAC.Phys.FB,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.UI,
  FireDAC.Comp.DataSet,

  SimpleLoggeru,
  Constsu,
  IniFileHandleru;

const
  ConDefName = 'ESLAdmin';

  StudentsGetSql =
    'SELECT '                                                              +
    '  sp.FIRSTNAME           AS StudentFirstName, '                       +
    '  sp.LASTNAME            AS StudentLastName, '                        +
    '  sp.EMAIL               As StudentEmail, '                           +
    '  c.COUNTRYNAME          As StudentCountry, '                         +
    '  c.LANGUAGENAME         As StudentLanguage, '                        +
    '  tp.FIRSTNAME           AS TeacherFirstName, '                       +
    '  tp.LASTNAME            AS TeacherLastName, '                        +
    '  r.ROOMNAME             AS RoomName, '                               +
    '  cl.CLASSLEVELNAME      AS ClassLevelName, '                         +
    '  s.NEEDSCHILDCARE       AS NeedsChildcare, '                         +
    '  ccl.CHILDCARELEVELNAME AS ChildcareLevelName '                      +
    'FROM STUDENTS s '                                                     +
    'JOIN PEOPLE sp        ON s.PERSONID         = sp.PERSONID '           +
    'JOIN USERS  tu        ON s.TEACHER_USERID    = tu.USERID '            +
    'JOIN COUNTRIES c      ON sp.COUNTRYID        = c.COUNTRYID '          +
    'JOIN PEOPLE tp        ON tu.PERSONID         = tp.PERSONID '          +
    'JOIN TEACHERDETAILS t ON t.USERID            = tu.USERID '            +
    'JOIN CLASSLEVELS cl   ON t.CLASSLEVELID      = cl.CLASSLEVELID '      +
    'JOIN SEMESTERS sem    ON s.SEMESTERID        = sem.SEMESTERID '       +
    '                     AND sem.ACTIVESEMESTER  = 1 '                    +
    'JOIN ROOMASSIGNMENTS ra '                                             +
    '                     ON ra.TEACHER_USERID    = s.TEACHER_USERID '     +
    '                    AND ra.SEMESTERID        = s.SEMESTERID '         +
    'JOIN ROOMS r          ON ra.ROOMID           = r.ROOMID '             +
    'LEFT JOIN CHILDCARELEVELS ccl '                                       +
    '                     ON s.CHILDCARELEVELID   = ccl.CHILDCARELEVELID ' +
    'WHERE s.ACTIVEFLAG = 1 ';

  // Student count SQL - replaces SELECT columns with COUNT(*)
  StudentCountGetSql =
    'SELECT COUNT(*) AS StudentCount '                                     +
    'FROM STUDENTS s '                                                     +
    'JOIN PEOPLE sp        ON s.PERSONID         = sp.PERSONID '           +
    'JOIN USERS  tu        ON s.TEACHER_USERID    = tu.USERID '            +
    'JOIN COUNTRIES c      ON sp.COUNTRYID        = c.COUNTRYID '          +
    'JOIN PEOPLE tp        ON tu.PERSONID         = tp.PERSONID '          +
    'JOIN TEACHERDETAILS t ON t.USERID            = tu.USERID '            +
    'JOIN CLASSLEVELS cl   ON t.CLASSLEVELID      = cl.CLASSLEVELID '      +
    'JOIN SEMESTERS sem    ON s.SEMESTERID        = sem.SEMESTERID '       +
    '                     AND sem.ACTIVESEMESTER  = 1 '                    +
    'JOIN ROOMASSIGNMENTS ra '                                             +
    '                     ON ra.TEACHER_USERID    = s.TEACHER_USERID '     +
    '                    AND ra.SEMESTERID        = s.SEMESTERID '         +
    'JOIN ROOMS r          ON ra.ROOMID           = r.ROOMID '             +
    'LEFT JOIN CHILDCARELEVELS ccl '                                       +
    '                     ON s.CHILDCARELEVELID   = ccl.CHILDCARELEVELID ' +
    'WHERE s.ACTIVEFLAG = 1 ';


  CountriesOrderBySql = 'ORDER BY c.COUNTRYNAME, sp.LASTNAME, sp.FIRSTNAME';
  ClassLevelsOrderBySql = 'ORDER BY cl.CLASSLEVELNAME, sp.LASTNAME, sp.FIRSTNAME';

  CountriesGetSql =
    'SELECT DISTINCT ' +
    '  countryid, '    +
    '  countryname, '  +
    '  languagename '  +
    'FROM '            +
    '  countries '     +
    'ORDER BY '        +
    '  countryname';

  ClassLevelsGetSql =
    'SELECT DISTINCT '                                       +
    '  c.classlevelname '                                    +
    'FROM teacherdetails t '                                 +
    'JOIN classlevels c ON t.classlevelid = c.classlevelid ' +
    'JOIN users u ON t.userid = u.userid '                   +
    'WHERE u.activeflag = 1 '                                +
    'AND UPPER(c.classlevelname) <> ' + '''UNASSIGNED'''     +
    'ORDER BY c.classlevelname ';

type
  //TRadioChecked = (rcAllStudents=0, rcStudentsByCountries=1, rcStudentsByClassLevels=2);
  TLanguageType = (ltLanguage, ltFile);

  TdmMain = class(TDataModule)
    conMain: TFDConnection;
    lnkMain: TFDPhysFBDriverLink;
    txMain: TFDTransaction;
    qryStudents: TFDQuery;
    curMain: TFDGUIxWaitCursor;
    qryCountries: TFDQuery;
    mtCountries: TFDMemTable;
    mtCountriesCountryName: TStringField;
    mtCountriesSelected: TBooleanField;
    mtCountriesCountryId: TLargeintField;
    mtCountriesLanguageName: TStringField;
    dsCountries: TDataSource;
    mtClassLevels: TFDMemTable;
    mtClassLevelsCLASSLEVELNAME: TStringField;
    mtClassLevelsSELECTED: TBooleanField;
    qryClassLevels: TFDQuery;
    dsClassLevels: TDataSource;
    qryStudentCount: TFDQuery;
  private
    FLogger: TSimpleLogger;
    FHasErrors: Boolean;
    FErrorMsg: String;
    FSQL: String;
    FCountSQL: String;
    FESLAdminIniFileHandler: TESLAdminIniFileHandler;
    procedure SetHasErrors(const Value: Boolean);
    procedure SetErrorMsg(const Value: String);
  public
    constructor Create(
      AOwner: TComponent;
      ALogger: TSimpleLogger;
      AIniFileHandler: TESLAdminIniFileHandler); reintroduce;
    procedure LoadCountriesTable(ACSVFileFullPath: String);
    procedure LoadClassLevelsTable(ACSVFileFullPath: String);
    procedure ChangeAllRecords(
      ASelected: Boolean;
      ATableName: String
    );
    procedure Setup;
    function GenerateSQL(ARadioChecked: TRecipientType): Boolean;
    function GetStudentCount: Integer;
    function GetStudentCount_Bak: Integer;
    procedure WriteRecipientsByCountryCsv(ACSVFileFullPath: String);
    procedure WriteRecipientsByClassLevelsCsv(ACSVFileFullPath: String);
    procedure InternalLoadLanguagesorFiles(
      ALanguageType: TLanguageType;
      AList: TStrings);
    procedure LoadLanguages(AList: TStrings);
    procedure LoadLanguageFiles(AList: TStrings);
    property HasErrors: Boolean
      read FHasErrors
      write SetHasErrors;
    property ErrorMsg: String
      read FErrorMsg
      write SetErrorMsg;
    procedure GenerateCheckpointFile(AFullCheckpointFileName: String);
  end;
var
  dmMain: TdmMain;

implementation

uses
  Vcl.Dialogs,
  System.IOUtils,
  EmailProcessoru;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmMain }

constructor TdmMain.Create(
  AOwner: TComponent;
  ALogger: TSimpleLogger;
  AIniFileHandler: TESLAdminIniFileHandler);
begin
  inherited Create(AOwner);
  FESLAdminIniFileHandler := AIniFileHandler;
  FLogger := ALogger;
  FHasErrors := False;
  FErrorMsg := '';
  qryStudents.SQL.Text := StudentsGetSql;
end;

procedure TdmMain.ChangeAllRecords(
  ASelected: Boolean;
  ATableName: String);
var
  FMemTable: TFDMemTable;
begin
  if ATableName = CountriesTable then
    FMemTable := mtCountries
  else
    FMemTable := mtClassLevels;

  try
    if FMemTable.State = dsEdit then FMemTable.Post;
    FMemTable.First;
    while Not FMemTable.EOF do begin
      FMemTable.Edit;
      FMemTable.FieldByName('selected').AsBoolean := ASelected;
      FMemTable.Post;
      FMemTable.Next;
    end;
    FMemTable.Edit;
  except
    On E:Exception do begin
      FLogger.WriteLog(TLogLevel.llError, 'DMMainu.ChangeAllRecords: ' + E.Message);
      raise;
    end;
  end;
end;

procedure TdmMain.GenerateCheckpointFile(AFullCheckpointFileName: String);
var
  LLines: TStringList;
  LRow: String;
begin
  LLines := TStringList.Create;
  try
    try
      LLines.Add('StudentName,' +
                 'TeacherName,' +
                 'RoomName,' +
                 'ClassLevelName,' +
                 'ChildcareLevelName,' +
                 'Email,' +
                 'Country,' +
                'Language');

      qryStudents.Open;
      while Not(qryStudents.EOF) do begin
        LRow :=
          TCSVHelper.QuoteCSVField(
            qryStudents.FieldByName('StudentFirstName').AsString + ' ' +
            qryStudents.FieldByName('StudentLastName').AsString) + ',' +
          TCSVHelper.QuoteCSVField(
            qryStudents.FieldByName('TeacherFirstName').AsString + ' ' +
            qryStudents.FieldByName('TeacherLastName').AsString) + ',' +
          TCSVHelper.QuoteCSVField(
            qryStudents.FieldByName('RoomName').AsString) + ',' +
          TCSVHelper.QuoteCSVField(
            qryStudents.FieldByName('ClassLevelName').AsString) + ',';

        if qryStudents.FieldByName('NeedsChildcare').IsNull then
          LRow := LRow + TCSVHelper.QuoteCSVField('No childcare') + ','
        else
          LRow := LRow + TCSVHelper.QuoteCSVField(
            qryStudents.FieldByName('ChildcareLevelName').AsString) + ',';
        LRow := LRow +
          TCSVHelper.QuoteCSVField(
            qryStudents.FieldByName('StudentEmail').AsString) + ',' +
          TCSVHelper.QuoteCSVField(
            qryStudents.FieldByName('StudentCountry').AsString) + ',' +
          TCSVHelper.QuoteCSVField(
            qryStudents.FieldByName('StudentLanguage').AsString);

        LLines.Add(LRow);
        qryStudents.Next;
      end;
      LLines.SaveToFile(AFullCheckpointFileName, TEncoding.UTF8);
    except
      On E:Exception do begin
        FLogger.WriteLog(
          TLogLevel.llError,
          'DMMainu.GenerateCheckpointFile: ' +
          E.Message);
        raise;
      end;
    end;
  finally
    qryStudents.Close;
    LLines.Free;
  end;
end;

function TdmMain.GenerateSQL(ARadioChecked: TRecipientType): Boolean;
var
  LItems: TStringList;
  I: Integer;
  LCondition: String;
begin
  Result := True;

  LItems := TStringList.Create;
  try
    try
      // All Students
      if ARadioChecked = rtAllStudents then begin
        FSQL := StudentsGetSql + CountriesOrderBySql;
        FCountSQL := StudentCountGetSql;
        qryStudents.SQL.Text := FSQL;
      // Students by Countries
      end else if ARadioChecked = rtStudentsByCountries then begin
        if mtCountries.State = dsEdit then mtCountries.Post;
        mtCountries.First;
        while Not(mtCountries.Eof) do begin
          if (mtCountries.FieldByName('SELECTED').AsBoolean = True) then begin
            LItems.Add(mtCountries.FieldByName('COUNTRYNAME').AsString);
          end;
          mtCountries.Next;
        end;

        if LItems.Count = 0 then begin
          ShowMessage('You need to select at least one Country');
          Result := False;
          Exit;
        end;

        LCondition := ' AND c.CountryName in ( ';
        for I := 0 to LItems.Count - 1 do begin
          if I > 0 then
            LCondition := LCondition + ', ';
          LCondition := LCondition + '''' + LItems[I] + '''';
        end;
        LCondition := LCondition + ' ) ';
        FSQL := StudentsGetSql + LCondition + CountriesOrderBySql;
        FCountSQL := StudentCountGetSql + LCondition;
        qryStudents.SQL.Text := FSQL;
      // Students by Class Levels
      end else begin
        if mtClassLevels.State = dsEdit then mtClassLevels.Post;
        mtClassLevels.First;
        while Not(mtClassLevels.Eof) do begin
          if (mtClassLevels.FieldByName('SELECTED').AsBoolean = True) then begin
            LItems.Add(mtClassLevels.FieldByName('CLASSLEVELNAME').AsString);
          end;
          mtClassLevels.Next;
        end;

        if LItems.Count = 0 then begin
          ShowMessage('You need to select at least one Class Level');
          Result := False;
          Exit;
        end;

        LCondition := ' AND cl.classlevelname in ( ' ;
        for I := 0 to LItems.Count - 1 do begin
          if I > 0 then
            LCondition := LCondition + ', ';
          LCondition := LCondition + '''' + LItems[I] + '''';
        end;
        LCondition := LCondition + ' ) ';
        FSQL := StudentsGetSql + LCondition + ClassLevelsOrderBySql;
        FCountSQL := StudentCountGetSql + LCondition;
        qryStudents.SQL.Text := FSQL;
      end;
    except
      On E:Exception do begin
        FLogger.WriteLog(TLogLevel.llError, 'DMMainu.GenerateSQL: ' + E.Message);
        raise;
      end;
    end;
  finally
    LItems.Free;
  end;
end;

function TdmMain.GetStudentCount_Bak: Integer;
var
  LCount: Integer;
begin
  qryStudents.Active := False;
  qryStudents.SQL.Text := FSQL;

  // Count students (original method - enumerate through query)
  qryStudents.Active := True;
  LCount := 0;
  qryStudents.First;
  while Not(qryStudents.EOF) do begin
    Inc(LCount);
    qryStudents.Next;
  end;
  qryStudents.First;
  Result := LCount;
end;

function TdmMain.GetStudentCount: Integer;
begin
  qryStudentCount.Active := False;
  try
    qryStudentCount.SQL.Text := FCountSQL;

    // Count students using COUNT(*) SQL (more efficient)
    qryStudentCount.Active := True;
    try
      if Not(qryStudentCount.EOF) then
        Result := qryStudentCount.FieldByName('StudentCount').AsInteger
      else
        Result := 0;
    except
      On E:Exception do begin
        FLogger.WriteLog(TLogLevel.llError, 'DMMainu.GetStudentCount: ' + E.Message);
        raise;
      end;
    end;
  finally
    qryStudentCount.Active := False;
  end;
end;

procedure TdmMain.LoadClassLevelsTable(ACSVFileFullPath: String);
var
  LList: TStringList;
begin
  LList := TStringList.Create;
  try
    try
      if (ACSVFileFullPath <> '') and TFile.Exists(ACSVFileFullPath) then
        LList.LoadFromFile(ACSVFileFullPath);

      qryClassLevels.SQL.Text := ClassLevelsGetSql;
      qryClassLevels.Active := True;
      qryClassLevels.First;
      while not qryClassLevels.EOF do begin
        mtClassLevels.Active := True;
        mtClassLevels.Append;
        mtClassLevelsCLASSLEVELNAME.AsString
          := qryClassLevels.FieldByName('classlevelname').AsString;

        mtClassLevelsSELECTED.AsBoolean := LList.IndexOf(mtClassLevelsCLASSLEVELNAME.AsString) <> -1;

        mtClassLevels.Post;
        qryClassLevels.Next;
      end;
    except
      On E:Exception do begin
        FLogger.WriteLog(TLogLevel.llError, 'DMMainu.LoadClassLevelsTable: ' + E.Message);
        raise;
      end;
    end;
  finally
    qryClassLevels.Active := False;
    LList.Free;
  end;
end;

procedure TdmMain.LoadCountriesTable(ACSVFileFullPath: String);
var
  LList: TStringList;
begin
  LList := TStringList.Create;
  try
    try
      if (ACSVFileFullPath <> '') and TFile.Exists(ACSVFileFullPath) then
        LList.LoadFromFile(ACSVFileFullPath);

      qryCountries.SQL.Text := CountriesGetSql;
      qryCountries.Active := True;
      qryCountries.First;
      while not qryCountries.EOF do begin
        mtCountries.Active := True;
        mtCountries.Append;
        mtCountriesCountryId.AsLargeInt
          := qryCountries.FieldByName('countryid').AsLargeInt;
        mtCountriesLanguageName.AsString
          := qryCountries.FieldByName('languagename').AsString;
        mtCountriesCountryName.AsString
          := qryCountries.FieldByName('countryname').AsString;

        mtCountriesSelected.AsBoolean := LList.IndexOf(mtCountriesCountryName.AsString) <> -1;

        mtCountries.Post;
        qryCountries.Next;
      end;
    except
      On E:Exception do begin
        FLogger.WriteLog(TLogLevel.llError, 'DMMainu.LoadCountriesTable: ' + E.Message);
        raise;
      end;
    end;
  finally
    qryCountries.Active := False;
    LList.Free;
  end;
end;

procedure TdmMain.InternalLoadLanguagesorFiles(
  ALanguageType: TLanguageType;
  AList: TStrings);
var
  LListItem: String;
begin
  AList.BeginUpdate;
  try
    qryCountries.Active := False;
    qryCountries.SQL.Text := CountriesGetSql;
    try
      qryCountries.Active := True;
      qryCountries.First;
      while Not(qryCountries.Eof) do begin
        LListItem := qryCountries.FieldByName('Languagename').AsString;
        if (ALanguageType = ltFile) then begin
          LListItem := LowerCase(LListItem) + '.txt';
        end;
        if AList.IndexOf(LListItem) = -1 then
          AList.Add(LListItem);
        qryCountries.Next;
      end;
    except
      On E:Exception do begin
        FLogger.WriteLog(TLogLevel.llError, 'DMMainu.InternalLoadLanguagesorFiles: ' + E.Message);
        raise;
      end;
    end;
  finally
    qryCountries.Active := False;
    AList.EndUpdate;
  end;
end;

procedure TdmMain.LoadLanguageFiles(AList: TStrings);
begin
  InternalLoadLanguagesorFiles(ltFile, AList);
end;

procedure TdmMain.LoadLanguages(AList: TStrings);
begin
  InternalLoadLanguagesorFiles(ltLanguage, AList);
end;

procedure TdmMain.SetErrorMsg(const Value: String);
begin
  FErrorMsg := Value;
end;

procedure TdmMain.SetHasErrors(const Value: Boolean);
begin
  FHasErrors := Value;
end;

procedure TdmMain.Setup;
var
  LParams: TStrings;
begin
  LParams := TStringList.Create;
  try
    try
      // Connection parameters
      LParams.Add('DriverID=FB');
      LParams.Add('Protocol=TCPIP');
      LParams.Add('Server=127.0.0.1');      // or hostname
      LParams.Add('Database='+FESLAdminIniFileHandler.IniValues.Database);
      LParams.Add('User_Name='+FESLAdminIniFileHandler.IniValues.Username);
      LParams.Add('Password='+FESLAdminIniFileHandler.IniValues.Userpass);
      LParams.Add('CharacterSet=UTF8');

      // Connection pooling parameters
      LParams.Add('Pooled=True');               // Enable pooling
      LParams.Add('PoolSize=10');               // Max connections in pool
      LParams.Add('PoolMaximumItems=50');       // Maximum pool size (optional)
      LParams.Add('PoolCleanupTimeout=60');     // Idle timeout in seconds
      LParams.Add('PoolExpiredAction=eaReset'); // Action on expired connection

      // Add the named connection definition
      FDManager.AddConnectionDef(ConDefName, 'FB', LParams);
      conMain.Params.Clear;
      conMain.ConnectionDefName := ConDefName;
      conMain.LoginPrompt := False;
      conMain.Connected := True;
    except
      On E:Exception do begin
        FLogger.WriteLog(TLogLevel.llError, 'DMMainu.Setup: ' + E.Message);
        raise;
      end;
    end;
  finally
    if Assigned(LParams) then
      FreeAndNil(LParams);
  end;
end;

procedure TdmMain.WriteRecipientsByClassLevelsCsv(ACSVFileFullPath: String);
var
  LList: TStringList;
begin
  LList := TStringList.Create;
  try
    try
    if mtClassLevels.State = dsEdit then mtClassLevels.Post;
      mtClassLevels.First;
      while not mtClassLevels.EOF do begin
        if mtClassLevels.FieldByName('SELECTED').AsBoolean then
          LList.Add(mtClassLevels.FieldByName('CLASSLEVELNAME').AsString);
        mtClassLevels.Next;
      end;
      LList.SaveToFile(ACSVFileFullPath);
    except
      On E:Exception do begin
        FLogger.WriteLog(TLogLevel.llError, 'DMMainu.WriteRecipientsByClassLevelsCsv: ' + E.Message);
        raise;
      end;
    end;
  finally
    LList.Free;
  end;
end;

procedure TdmMain.WriteRecipientsByCountryCsv(ACSVFileFullPath: String);
var
  LList: TStringList;
begin
  LList := TStringList.Create;
  try
    try
      if mtCountries.State = dsEdit then mtCountries.Post;
      mtCountries.First;
      while not mtCountries.EOF do begin
        if mtCountries.FieldByName('SELECTED').AsBoolean then
          LList.Add(mtCountries.FieldByName('COUNTRYNAME').AsString);
        mtCountries.Next;
      end;
      LList.SaveToFile(ACSVFileFullPath);
    except
      On E:Exception do begin
        FLogger.WriteLog(TLogLevel.llError, 'DMMainu.WriteRecipientsByCountryCsv: ' + E.Message);
        raise;
      end;
    end;
  finally
    LList.Free;
  end;
end;

end.
