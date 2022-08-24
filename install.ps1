Set-ExecutionPolicy AllSigned
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

# TODO: upgrade "App Installer" to access winget

# Install Chocolatey
Invoke-WebRequest -UseBasicParsing "https://community.chocolatey.org/install.ps1" | Invoke-Expression

# Install Scoop (Admin not necessary)
Invoke-WebRequest -UseBasicParsing get.scoop.sh | Invoke-Expression

$packages = @(
    # Browsers
    "Mozilla.Firefox", # moniker: firefox
    "Google.Chrome",   # moniker: chrome

    # Common
    "7zip.7zip",
    "KeePassXCTeam.KeePassXC",
    "VideoLAN.VLC",    # moniker: vlc

    # Development
    "Notepad++.Notepad++",
    "Postman.Postman",

    # Gaming
    "Valve.Steam",
    "TeamSpeakSystems.TeamSpeakClient", # moniker: teamspeak

    # Misc
    "REALiX.HWiNFO",

    # Graphics Editors
    "JGraph.Draw",
    "Inkscape.Inkscape",

    # YubiKey
    "Yubico.YubikeyManager",
    "Yubico.Authenticator"
)

foreach ($package in $packages) {
    winget install --silent --source winget --accept-source-agreements --accept-package-agreements "$package"
}

winget install --silent --source winget --accept-source-agreements --accept-package-agreements "Python.Python.3"
winget install --silent --source winget --accept-source-agreements --accept-package-agreements "Microsoft.PowerShell" --override "ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=1 ADD_FILE_CONTEXT_MENU_RUNPOWERSHELL=1"
winget install --silent --source winget --accept-source-agreements --accept-package-agreements "TeamViewer.TeamViewer"
winget install --silent --source winget --accept-source-agreements --accept-package-agreements "SumatraPDF.SumatraPDF"
winget install --silent --source winget --accept-source-agreements --accept-package-agreements "Microsoft.Office"
winget install --silent --source winget --accept-source-agreements --accept-package-agreements "Microsoft.VisualStudio.2022.Professional" --override "--add Microsoft.VisualStudio.Workload.Azure;includeRecommended --add Microsoft.VisualStudio.Workload.ManagedDesktop;includeRecommended --add Microsoft.VisualStudio.Workload.NetCrossPlat;includeRecommended --add Microsoft.VisualStudio.Workload.NetWeb;includeRecommended --add Microsoft.VisualStudio.Workload.Office;includeRecommended"
winget install --silent --source winget --accept-source-agreements --accept-package-agreements "Microsoft.AzureStorageExplorer"
winget install --silent --source winget --accept-source-agreements --accept-package-agreements "Microsoft.SQLServerManagementStudio"
winget install --silent --source winget --accept-source-agreements --accept-package-agreements "Mozilla.Thunderbird"
winget install --silent --source winget --accept-source-agreements --accept-package-agreements "OpenWhisperSystems.Signal"
winget install --silent --source winget --accept-source-agreements --accept-package-agreements "Element.Element"
winget install --silent --source winget --accept-source-agreements --accept-package-agreements "ProtonTechnologies.ProtonMailBridge"
winget install --silent --source winget --accept-source-agreements --accept-package-agreements "MullvadVPN.MullvadVPN"
winget install --silent --source winget --accept-source-agreements --accept-package-agreements "WireGuard.WireGuard"
winget install --silent --source winget --accept-source-agreements --accept-package-agreements "GnuPG.Gpg4win"
winget install --silent --source winget --accept-source-agreements --accept-package-agreements "Microsoft.RemoteDesktopClient"
winget install --silent --source winget --accept-source-agreements --accept-package-agreements "PuTTY.PuTTY"
winget install --silent --source winget --accept-source-agreements --accept-package-agreements "OpenJS.NodeJS.LTS"
winget install --silent --source winget --accept-source-agreements --accept-package-agreements "OpenVPNTechnologies.OpenVPN"
winget install --silent --source winget --accept-source-agreements --accept-package-agreements "PDFsam.PDFsam"
winget install --silent --source winget --accept-source-agreements --accept-package-agreements "DownloadHelper.VdhCoApp"
winget install --silent --source winget --accept-source-agreements --accept-package-agreements "Microsoft.AzureCLI"
winget install --silent --source winget --accept-source-agreements --accept-package-agreements "OBSProject.OBSStudio"
winget install --silent --source winget --accept-source-agreements --accept-package-agreements "HexChat.HexChat"
winget install --silent --source winget --accept-source-agreements --accept-package-agreements "Microsoft.VisualStudioCode" --override '/SILENT /mergetasks="!runcode,addcontextmenufiles,addcontextmenufolders"'

# Audio
winget install --silent --source winget --accept-source-agreements --accept-package-agreements "Audacity.Audacity"
winget install --silent --source winget --accept-source-agreements --accept-package-agreements "AlexanderKojevnikov.Spek"
winget install --silent --source winget --accept-source-agreements --accept-package-agreements "AndreWiethoff.ExactAudioCopy"
winget install --silent --source winget --accept-source-agreements --accept-package-agreements "MediaArea.MediaInfo.GUI"
winget install --silent --source winget --accept-source-agreements --accept-package-agreements "ChrisBagwell.SoX"
winget install --silent --source winget --accept-source-agreements --accept-package-agreements "PeterPawlowski.foobar2000"
choco install --yes lossless-audio-checker
choco install --yes lame

# Jellyfin
winget install --silent --source winget --accept-source-agreements --accept-package-agreements "Jellyfin.JellyfinMediaPlayer"
winget install --silent --source winget --accept-source-agreements --accept-package-agreements "IanWalton.JellyfinMPVShim"

# TODO: don't run as admin
winget install --silent --source winget --accept-source-agreements --accept-package-agreements "Spotify.Spotify"
winget install --silent --source winget --accept-source-agreements --accept-package-agreements "Discord.Discord"
npm install --global npm-check-updates

scoop install intermodal

# TODO: Missing Apps

# winget install "Graphviz.Graphviz"

# poshgit
# gitversion-portable
# sourcetree
# filezilla
# syncthing
# IPMI View

choco install --yes kubernetes-cli
choco install --yes kubernetes-helm

choco install --yes paint.net

# Git
winget install --silent --source winget --accept-source-agreements --accept-package-agreements "Git.Git"
# Enable Developer Mode
# Used by Git to create symlinks with mklink
Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" "AllowDevelopmentWithoutDevLicense" 1

# Hugo
winget install --silent --source winget --accept-source-agreements --accept-package-agreements "GoLang.Go"
choco install --yes hugo-extended

# gpg4win + win ssh + wsl
choco install wsl-ssh-pageant-gui --yes
[Environment]::SetEnvironmentVariable('SSH_AUTH_SOCK', '\\.\pipe\ssh-pageant', 'User')

choco install packer --yes
choco install terraform --yes

# EqualizerAPO doesn't exist in winget

Get-PackageProvider NuGet -Force

PowerShellGet\Install-Module posh-git -Scope CurrentUser -Force
# Run in PS5 and PS7
Add-PoshGitToProfile

Install-Module -Name Az -Scope CurrentUser -Repository PSGallery -Force -AllowClobber

Add-WindowsCapability -Online -Name "OpenSSH.Client"

git config --global user.name "Michael Schnerring"
git config --global user.email "3743342+schnerring@users.noreply.github.com"

# Configure GPG
git config --global gpg.program "C:\Program Files (x86)\GnuPG\bin\gpg.exe"
git config --global core.sshcommand "plink -agent"
# [S] GPG Key
git config --global user.signingkey "F5E5BE5C325BCB56"
# Sign each commit
git config --global commit.gpgsign true

# Re-enable old Windows context menu
New-Item -Force -Value "" -Path "HKCU:\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32"

# Windows Features (VIS)

Enable-WindowsOptionalFeature -All -NoRestart -Online -FeatureName "IIS-WebServer"
Enable-WindowsOptionalFeature -All -NoRestart -Online -FeatureName "IIS-WindowsAuthentication"
Enable-WindowsOptionalFeature -All -NoRestart -Online -FeatureName "IIS-ManagementConsole"
Enable-WindowsOptionalFeature -All -NoRestart -Online -FeatureName "IIS-ASPNET45"
Enable-WindowsOptionalFeature -All -NoRestart -Online -FeatureName "WCF-HTTP-Activation45"
Enable-WindowsOptionalFeature -All -NoRestart -Online -FeatureName "NetFx3" # required by EAC
