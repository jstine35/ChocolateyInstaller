; Chocolatey Web Installer
; By Jake Stine
;
; This is currently a one-way install.  No uninstaller is provided.
; Uninstalling Chocolatey normally consists of deleting the chocolatey dir and removing
; Chocolatey from the PATH.

!include "LogicLib.nsh"

name "Chocolatey Web Installer"
Outfile "ChocolateyWebInstall.exe"
RequestExecutionLevel admin
 
Section

DetailPrint "Chocolatey Web Installer"

SetDetailsView show
ExpandEnvStrings $0 "%SystemRoot%"

nsExec::ExecToLog '"$0\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString($\'https://chocolatey.org/install.ps1$\'))"'
Pop $0

${If} $0 == "error"
  ; try running powershell in path, just in case ...
  nsExec::ExecToLog '"powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString($\'https://chocolatey.org/install.ps1$\'))"'
  Pop $0

  ${If} $0 == "error"
    DetailPrint "ERROR: Powershell is not installed!"
    DetailPrint "Powershell is a Microsoft product that normally comes pre-installed"
    DetailPrint "on Windows Vista, 7,8, 10+. It's installer can be found somewhere on"
    DetailPrint "the web."
    Abort
  ${EndIf}
${EndIf}

${If} $0 = 1
  DetailPrint "Installation failed."
  Abort
${EndIf}

${If} $0 = 0
  ; Check if the path entry already exists and write result to $0
  nsExec::Exec 'echo %PATH% | find "%ALLUSERSPROFILE%\chocolatey\bin"'
  Pop $0   ; gets result code

  ${If} $0 <> 0
    DetailPrint "Adding Chocolatey to PATH..."
    nsExec::Exec 'set PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin'
    DetailPrint "IMPORTANT: You will need to restart any running cmd shells for the"
    DetailPrint "Chocolatey path to become effective!"
  ${EndIf}
${EndIf}

SectionEnd
