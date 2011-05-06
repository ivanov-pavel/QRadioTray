; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "QRadioTray"
#define MyAppVersion "1.04"
#define MyAppExeName "QRadioTray_"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{8498E8B6-2A15-4A58-B000-9509EA8E02B7}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
LicenseFile=gnu_licence.txt
OutputBaseFilename=QRadioTraySetup_{#MyAppVersion}
Compression=lzma2/ultra64
SolidCompression=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"

[Tasks]
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked; OnlyBelowVersion: 0,6.1

[Files]
Source: ".\..\QRadioTray-build-desktop\release\QRadioTray_{#MyAppVersion}.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: ".\..\QRadioTray-build-desktop\config.ini"; DestDir: "{app}"; Flags: ignoreversion
Source: ".\..\QRadioTray-build-desktop\libs\libgcc_s_dw2-1.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: ".\..\QRadioTray-build-desktop\libs\mingwm10.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: ".\..\QRadioTray-build-desktop\libs\phonon4.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: ".\..\QRadioTray-build-desktop\libs\QtCore4.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: ".\..\QRadioTray-build-desktop\libs\QtGui4.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: ".\..\QRadioTray-build-desktop\libs\QxtCore.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: ".\..\QRadioTray-build-desktop\libs\QxtGui.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: ".\..\QRadioTray-build-desktop\libs\phonon_backend\*"; DestDir: "{app}\phonon_backend\"; Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}{#MyAppVersion}.exe"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: quicklaunchicon

[Run]
Filename: "{app}\{#MyAppExeName}{#MyAppVersion}.exe"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, "&", "&&")}}"; Flags: nowait postinstall skipifsilent

[UninstallDelete]
Type: files; Name: "{app}\debug.log"
Type: dirifempty; Name: "{app}"

