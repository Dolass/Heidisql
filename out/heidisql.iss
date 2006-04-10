; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

; Original HeidiSQL setup script for Innosetup

[Setup]
AppName=HeidiSQL
AppVerName=HeidiSQL 3.0
AppVersion=3.0
AppPublisher=Ansgar Becker
AppPublisherURL=http://www.heidisql.com/
AppSupportURL=http://www.heidisql.com/forum/
AppUpdatesURL=http://www.heidisql.com/download/
AppContact=heidisql@anse.de
DefaultDirName={pf}\HeidiSQL
DefaultGroupName=HeidiSQL
InfoAfterFile=readme.txt
LicenseFile=license.txt
ChangesAssociations=yes
WizardImageFile=.\..\res\installer-logo.bmp
WizardImageBackColor=$ffffff
WizardSmallImageFile=.\..\res\installer-small-logo.bmp
OutputDir=.
OutputBaseFilename=HeidiSQL_3.0_Setup
UninstallDisplayIcon={app}\heidisql.exe
SetupIconFile=.\..\res\mainicon.ico
; uncomment the following line if you want your installation to run on NT 3.51 too.
; MinVersion=4,3.51

[Tasks]
Name: "desktopicon"; Description: "Create a &desktop icon"; GroupDescription: "Additional icons:"; MinVersion: 4,4
Name: "quicklaunchicon"; Description: "Create a &Quick Launch icon"; GroupDescription: "Additional icons:"; MinVersion: 4,4; Flags: unchecked
Name: "associatesqlfiles"; Description: "Associate .&SQL-Files with HeidiSQL"; GroupDescription: "Options:";

[Files]
Source: "heidisql.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "readme.txt"; DestDir: "{app}"; Flags: ignoreversion
Source: "function.txt"; DestDir: "{app}"; Flags: onlyifdoesntexist
Source: "libmySQL.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "libmysql40.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "libmysql41.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "heidisql.exe.manifest"; DestDir: "{app}"; Flags: ignoreversion

[INI]
Filename: "{app}\heidisql.url"; Section: "InternetShortcut"; Key: "URL"; String: "http://www.heidisql.com/"
Filename: "{app}\heidisql_forum.url"; Section: "InternetShortcut"; Key: "URL"; String: "http://www.heidisql.com/forum/"
;Filename: "{app}\donate.url"; Section: "InternetShortcut"; Key: "URL"; String: "http://www.heidisql.com/donate/"

[Icons]
Name: "{group}\HeidiSQL"; Filename: "{app}\heidisql.exe"
Name: "{group}\HeidiSQL on the Web"; Filename: "{app}\heidisql.url"
Name: "{group}\HeidiSQL Forum"; Filename: "{app}\heidisql_forum.url"
;Name: "{group}\Donate"; Filename: "{app}\donate.url"
Name: "{group}\Uninstall HeidiSQL"; Filename: "{uninstallexe}"
Name: "{userdesktop}\HeidiSQL"; Filename: "{app}\heidisql.exe"; MinVersion: 4,4; Tasks: desktopicon
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\HeidiSQL"; Filename: "{app}\heidisql.exe"; MinVersion: 4,4; Tasks: quicklaunchicon

[Registry]
Root: HKCR; Subkey: ".sql"; ValueType: string; ValueName: ""; ValueData: "SQLScriptFile"; Flags: uninsdeletevalue; Tasks: associatesqlfiles
Root: HKCR; Subkey: "SQLScriptFile"; ValueType: string; ValueName: ""; ValueData: "SQL-Script"; Flags: uninsdeletekey; Tasks: associatesqlfiles
Root: HKCR; Subkey: "SQLScriptFile\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\heidisql.exe,0"; Tasks: associatesqlfiles
Root: HKCR; Subkey: "SQLScriptFile\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\heidisql.exe"" ""%1"""; Tasks: associatesqlfiles

[Run]
Filename: "{app}\heidisql.exe"; Description: "Launch HeidiSQL"; Flags: nowait postinstall skipifsilent

[UninstallDelete]
Type: files; Name: "{app}\heidisql.url"
;Type: files; Name: "{app}\donate.url"

