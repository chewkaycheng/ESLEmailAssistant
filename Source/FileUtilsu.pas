unit FileUtilsu;

interface

uses
  System.Classes,
  DMMainu;

type
  TFileUtils = class
  public
    class procedure MoveSourceFilesToBackupDir(
      ABackupFilesDir: String;
      ASourceFilesDir: String);
    class function RefreshList(
      AList: TStrings;
      ASourceFilesDir: String;
      AExcludeList: TStringList;
      ALanguageList: TStringList): Boolean;
    class function LanguageContentCreated(
      ALanguage: String;
      ASourceFilesDir: String): Boolean;
  end;

implementation

uses
  System.IOUtils,
  System.SysUtils;

{ TFileUtils }

class function TFileUtils.LanguageContentCreated(
  ALanguage: String;
  ASourceFilesDir: String): Boolean;
var
  LFiles: TArray<String>;
  I: Integer;
  LFileName: String;
  LLanguageFileName: String;
begin
  Result := False;
  LLanguageFileName := Lowercase(ALanguage + '.txt');
  // Only show .txt files (email templates), excluding internal files
  LFiles := TDirectory.GetFiles(
    ASourceFilesDir,
    '*.txt',
    TSearchOption.soTopDirectoryOnly);
  for I := 0 to High(LFiles) do begin
    LFileName := LowerCase(ExtractFileName(LFiles[i]));
    if SameText(LLanguageFileName, LFileName) then begin
      Result := True;
    end;
  end;
end;

class procedure TFileUtils.MoveSourceFilesToBackupDir(
  ABackupFilesDir,
  ASourceFilesDir: String);
var
  LBackupDirFullPath: String;
  LBackupDir: String;
  LFiles: TArray<String>;
  LFile: String;
  LDestFile: String;
begin
  LBackupDir := 'Bak_' + FormatDateTime('yyyy_nn_dd_hh_nn_ss', Now);
  LBackupDirFullPath :=
    IncludeTrailingPathDelimiter(ABackupFilesDir) + LBackupDir;

  if Not(TDirectory.Exists(LBackupDirFullPath)) then
    TDirectory.CreateDirectory(LBackupDirFullPath);

  LFiles := TDirectory.GetFiles(ASourceFilesDir);
  for LFile in LFiles do begin
    LDestFile := ExtractFileName(LFile);
    LDestFile :=
      IncludeTrailingPathDelimiter(LBackupDirFullPath) + LDestFile;
    TFile.Move(LFile, LDestFile);
  end;
end;

class function TFileUtils.RefreshList(
  AList: TStrings;
  ASourceFilesDir: String;
  AExcludeList: TStringList;
  ALanguageList: TStringList): Boolean;
var
  LFiles: TArray<String>;
  I: Integer;
  LFileName: String;
  LLanguage: String;
begin
  Result := False;
  AList.Clear;
  // Only show .txt files (email templates), excluding internal files
  LFiles := TDirectory.GetFiles(
    ASourceFilesDir,
    '*.txt',
    TSearchOption.soTopDirectoryOnly);

  for I := 0 to High(LFiles) do begin
    LFileName := LowerCase(ExtractFileName(LFiles[i]));
    LLanguage := ExtractFileName(LFiles[i]);
    ExtractFileExt(LLanguage);
    // Skip internal/system files
    if (AExcludeList.IndexOf(LFileName) <> -1) then begin
      Continue;
    end;
    if (ALanguageList.IndexOf(LFileName) = -1) then begin
      Continue;
    end;

    // If there is an 'english.txt' file then set the result
    // to true to enable the next button in the compose tabsheet.
    if SameText(LFileName, 'english.txt') then begin
      Result := True;
    end;
    AList.Add(
      ExtractFileName(LFiles[i]));
  end;
end;

end.
