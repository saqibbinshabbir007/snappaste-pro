; ============================================================
;  SnapPaste Pro -- Inno Setup script
;  by Saqib Bin Shabbir (Full Stack Developer & Agentic AI Specialist)
;  Per-user install (no admin). Bundles AutoHotkey runtime.
; ============================================================

#define MyAppName "SnapPaste Pro"
#define MyAppVersion "1.1.0"
#define MyAppPublisher "Saqib Bin Shabbir - Full Stack Developer & Agentic AI Specialist"
#define MyAppExeName "AutoHotkey64.exe"
#define MyAhkScript "ClipboardImagePaste.ahk"

; Generate src\version.txt at COMPILE time from MyAppVersion (single source of truth).
; It ships via [Files], so `npx snappaste-pro status` can report the installed version,
; and the uninstaller removes it automatically.
#expr SaveStringToFile("src\version.txt", MyAppVersion, 0)

[Setup]
AppId={{B8E6F1A2-3C4D-4E5F-9A7B-7C2D9F0A1E55}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
DefaultDirName={userappdata}\{#MyAppName}
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
DisableDirPage=yes
PrivilegesRequired=lowest
ChangesEnvironment=yes
LicenseFile=src\LICENSE.txt
InfoAfterFile=src\About.txt
OutputDir=Output
OutputBaseFilename=SnapPaste-Pro-Setup
Compression=lzma2
SolidCompression=yes
WizardStyle=modern
UninstallDisplayName={#MyAppName}
VersionInfoCompany={#MyAppPublisher}
VersionInfoProductName={#MyAppName}
VersionInfoVersion={#MyAppVersion}

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Messages]
WelcomeLabel2=This will install [name/ver] on your computer.%n%nMac-style screenshot paste for Windows terminals.%n%nDeveloped by Saqib Bin Shabbir -- Full Stack Developer & Agentic AI Specialist.%n%nIt is recommended that you close all other applications before continuing.

[Files]
Source: "src\AutoHotkey64.exe";        DestDir: "{app}"; Flags: ignoreversion
Source: "src\ClipboardImagePaste.ahk";  DestDir: "{app}"; Flags: ignoreversion
Source: "src\Save-ClipboardImage.ps1";  DestDir: "{app}"; Flags: ignoreversion
Source: "src\pasteimg.cmd";             DestDir: "{app}"; Flags: ignoreversion
Source: "src\Setup-Integration.ps1";    DestDir: "{app}"; Flags: ignoreversion
Source: "src\About.txt";                DestDir: "{app}"; Flags: ignoreversion
Source: "src\LICENSE.txt";              DestDir: "{app}"; Flags: ignoreversion
; Version stamp (generated at compile time above) -- read by `npx snappaste-pro status`
Source: "src\version.txt";              DestDir: "{app}"; Flags: ignoreversion

[Icons]
; Auto-start on login
Name: "{userstartup}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Parameters: """{app}\{#MyAhkScript}"""; WorkingDir: "{app}"
; Start Menu shortcuts
Name: "{userprograms}\{#MyAppName}\About {#MyAppName}"; Filename: "{app}\About.txt"
Name: "{userprograms}\{#MyAppName}\Uninstall {#MyAppName}"; Filename: "{uninstallexe}"

[Run]
; 1) PATH + PowerShell profile integration
Filename: "powershell.exe"; \
  Parameters: "-NoProfile -ExecutionPolicy Bypass -File ""{app}\Setup-Integration.ps1"" -Action Install -AppDir ""{app}"""; \
  StatusMsg: "Configuring SnapPaste Pro..."; Flags: runhidden waituntilterminated
; 2) Start SnapPaste Pro now (no restart needed)
Filename: "{app}\{#MyAppExeName}"; Parameters: """{app}\{#MyAhkScript}"""; \
  WorkingDir: "{app}"; Description: "Start SnapPaste Pro now"; \
  Flags: nowait postinstall skipifsilent

[UninstallRun]
; 1) Stop the running SnapPaste Pro process so files can be removed
Filename: "{cmd}"; Parameters: "/c taskkill /im {#MyAppExeName} /f"; Flags: runhidden; RunOnceId: "KillAhk"
; 2) Remove PATH + profile integration
Filename: "powershell.exe"; \
  Parameters: "-NoProfile -ExecutionPolicy Bypass -File ""{app}\Setup-Integration.ps1"" -Action Uninstall -AppDir ""{app}"""; \
  Flags: runhidden waituntilterminated; RunOnceId: "RemoveIntegration"
