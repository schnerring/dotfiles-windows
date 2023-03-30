#requires -RunAsAdministrator

function Assert-WingetPackage {
    param (
        [string] $PackageId
    )

    $wingetList = winget list --id "$PackageId"

    # Iterate over `winget list` output lines
    foreach ($line in $wingetList) {
        if ($line.Contains($PackageId)) {
            return $true
        }
    }

    return $false
}

function Install-WingetPackage {
    param (
        [Parameter(Position = 0)]
        [string] $PackageId,

        [Parameter(Position = 1)]
        [string] $PackageOverride
    )

    if (Assert-WingetPackage $PackageId) {
        Write-Output "Skipping $($PackageId) because it is already installed..."
        return
    }

    Write-Output "Installing $($PackageId)..."

    if ($PackageOverride) {
        winget install --silent --source winget --accept-source-agreements --accept-package-agreements $PackageId --override $PackageOverride
    } else {
        winget install --silent --source winget --accept-source-agreements --accept-package-agreements $PackageId
    }
}

# Browsers
Install-WingetPackage "Mozilla.Firefox"
Install-WingetPackage "Google.Chrome"

# Common
Install-WingetPackage "7zip.7zip"
Install-WingetPackage "DownloadHelper.VdhCoApp"
Install-WingetPackage "KeePassXCTeam.KeePassXC"
Install-WingetPackage "Microsoft.Office"
Install-WingetPackage "OBSProject.OBSStudio"
Install-WingetPackage "PDFsam.PDFsam"
Install-WingetPackage "REALiX.HWiNFO"
Install-WingetPackage "SatoshiLabs.trezor-suite"
#Install-WingetPackage "Spotify.Spotify" TODO: run in non-admin shell
Install-WingetPackage "SumatraPDF.SumatraPDF"
Install-WingetPackage "Valve.Steam"
Install-WingetPackage "VideoLAN.VLC"

# Development
Install-WingetPackage "Docker.DockerDesktop"
Install-WingetPackage "Git.Git"
Install-WingetPackage "GoLang.Go.1.20"
Install-WingetPackage "GnuPG.Gpg4win"
Install-WingetPackage "Graphviz.Graphviz" # required by `terraform graph`
Install-WingetPackage "Hashicorp.Terraform"
Install-WingetPackage "Microsoft.AzureCLI"
Install-WingetPackage "Microsoft.AzureStorageExplorer"
Install-WingetPackage "Microsoft.PowerShell" "ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=1 ADD_FILE_CONTEXT_MENU_RUNPOWERSHELL=1"
Install-WingetPackage "Microsoft.RemoteDesktopClient"
Install-WingetPackage "Microsoft.SQLServerManagementStudio"
Install-WingetPackage "Microsoft.VisualStudio.2022.Professional" "--add Microsoft.VisualStudio.Workload.Azure;includeRecommended --add Microsoft.VisualStudio.Workload.ManagedDesktop;includeRecommended --add Microsoft.VisualStudio.Workload.NetCrossPlat;includeRecommended --add Microsoft.VisualStudio.Workload.NetWeb;includeRecommended --add Microsoft.VisualStudio.Workload.Office;includeRecommended"
Install-WingetPackage "Microsoft.VisualStudioCode" '/SILENT /mergetasks="!runcode,addcontextmenufiles,addcontextmenufolders"'
Install-WingetPackage "nektos.act"
Install-WingetPackage "Notepad++.Notepad++"
Install-WingetPackage "OpenJS.NodeJS.LTS"
Install-WingetPackage "Postman.Postman"
Install-WingetPackage "PuTTY.PuTTY"
Install-WingetPackage "Python.Python.3.10"
Install-WingetPackage "stedolan.jq"
Install-WingetPackage "WinSCP.WinSCP"

# Communications
Install-WingetPackage "Discord.Discord"
Install-WingetPackage "Element.Element"
Install-WingetPackage "HexChat.HexChat"
Install-WingetPackage "Mozilla.Thunderbird"
Install-WingetPackage "OpenWhisperSystems.Signal"
Install-WingetPackage "ProtonTechnologies.ProtonMailBridge"
Install-WingetPackage "TeamSpeakSystems.TeamSpeakClient"
Install-WingetPackage "TeamViewer.TeamViewer"

# VPN
Install-WingetPackage "MullvadVPN.MullvadVPN"
Install-WingetPackage "OpenVPNTechnologies.OpenVPN"
Install-WingetPackage "WireGuard.WireGuard"

# Jellyfin
Install-WingetPackage "Jellyfin.JellyfinMediaPlayer"
Install-WingetPackage "IanWalton.JellyfinMPVShim"
Install-WingetPackage "jeffvli.Sonixd"

# Graphics Editors
Install-WingetPackage "JGraph.Draw"
Install-WingetPackage "Inkscape.Inkscape"

# YubiKey
Install-WingetPackage "Yubico.YubikeyManager"
Install-WingetPackage "Yubico.Authenticator"

# Audio
Install-WingetPackage "Audacity.Audacity"
Install-WingetPackage "AlexanderKojevnikov.Spek"
Install-WingetPackage "AndreWiethoff.ExactAudioCopy"
Install-WingetPackage "MediaArea.MediaInfo.GUI"
Install-WingetPackage "ChrisBagwell.SoX"
Install-WingetPackage "PeterPawlowski.foobar2000"
