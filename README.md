# ChocolateyInstaller

Downloadable Installer for Chocolatey so that you don't have to paste text into a CLI.

## How to Installer

Resolve prerequisites (see below), download the latest release, and run it.  Magic!

### What does the Installer Do?

1. downloads the _trusted (?)_ script https://chocolatey.org/install.ps1
2. runs the script via a powershell invocation
3. updates your `PATH` environment variable to make Chocolatey and any of its installed apps accessible
   from your favorite CLI

Due to the last part, you'll need to close any processes that have cached the PATH environment variable:
 * CMD Prompts
 * Git/Bash Shells
 * Explorer Windows and, probably `explorer.exe` outright

Rebooting also works, if you prefer broad-stroke solutions!
 
### How to Get Powershell

Powershell usually comes pre-installed with Windows 7, 8, and 10.  If you're running Windows Vista and know
the secret sauce to getting Powershell+Chocolatey to install and run, then please feel free to contribute that
wisdom to this README.

Powershell can actually be a tricky beast to install.  Microsoft packages some old versions of
it as downloadable installers -- versions 3 and 4 -- but if you want the _latest_ version then
you have to install either the [Windows 10 Platform SDK](https://developer.microsoft.com/en-US/windows/downloads/windows-10-sdk)
or [Windows Management Framework](https://docs.microsoft.com/en-us/powershell/wmf/readme#wmf-availability-across-windows-operating-systems).
There is no stand-alone installer.

I got my Win10 SDK and Powershell 5.1 automatically via the [Visual Studio 2017 installer](https://www.visualstudio.com/downloads/).