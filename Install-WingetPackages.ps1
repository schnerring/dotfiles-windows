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

# PowerShell 7
Install-WingetPackage "Microsoft.PowerShell"

# Browsers
Install-WingetPackage "Mozilla.Firefox"
Install-WingetPackage "Google.Chrome"

# VPN
Install-WingetPackage "OpenVPNTechnologies.OpenVPN"
Install-WingetPackage "WireGuard.WireGuard"

# Media
Install-WingetPackage "Audacity.Audacity"
Install-WingetPackage "AndreWiethoff.ExactAudioCopy"
Install-WingetPackage "ChrisBagwell.SoX"
Install-WingetPackage "IanWalton.JellyfinMPVShim"
Install-WingetPackage "jeffvli.Feishin"
Install-WingetPackage "Jellyfin.JellyfinMediaPlayer"
Install-WingetPackage "LAME.LAME"
Install-WingetPackage "MediaArea.MediaInfo.GUI"
Install-WingetPackage "Mixxx.Mixxx"
Install-WingetPackage "OBSProject.OBSStudio"
Install-WingetPackage "VideoLAN.VLC"

# Common
Install-WingetPackage "7zip.7zip"
Install-WingetPackage "KeePassXCTeam.KeePassXC"
Install-WingetPackage "PDFsam.PDFsam"
Install-WingetPackage "REALiX.HWiNFO"
Install-WingetPackage "SumatraPDF.SumatraPDF"
Install-WingetPackage "Syncthing.Syncthing"
Install-WingetPackage "Yubico.Authenticator"

# Communications
Install-WingetPackage "Discord.Discord"
Install-WingetPackage "HexChat.HexChat"
Install-WingetPackage "Mozilla.Thunderbird"
Install-WingetPackage "OpenWhisperSystems.Signal"
Install-WingetPackage "ProtonTechnologies.ProtonMailBridge"
Install-WingetPackage "TeamSpeakSystems.TeamSpeakClient"

# Graphics Editors
Install-WingetPackage "dotPDN.PaintDotNet"
Install-WingetPackage "Inkscape.Inkscape"

# Gaming
Install-WingetPackage "Valve.Steam"

# Development
Install-WingetPackage "Docker.DockerDesktop"
Install-WingetPackage "Git.Git"
Install-WingetPackage "GoLang.Go"
Install-WingetPackage "GnuPG.Gpg4win"
Install-WingetPackage "Graphviz.Graphviz" # required by `terraform graph`
Install-WingetPackage "Hashicorp.Packer"
Install-WingetPackage "Hashicorp.Terraform"
Install-WingetPackage "Hugo.Hugo.Extended"
Install-WingetPackage "Kubernetes.kubectl"
Install-WingetPackage "Microsoft.AzureCLI"
Install-WingetPackage "Microsoft.AzureStorageExplorer"
Install-WingetPackage "Microsoft.RemoteDesktopClient"
Install-WingetPackage "Microsoft.SQLServerManagementStudio"
Install-WingetPackage "Microsoft.VisualStudioCode" '/SILENT /mergetasks="!runcode,addcontextmenufiles,addcontextmenufolders,addtopath"'
Install-WingetPackage "Notepad++.Notepad++"
Install-WingetPackage "OpenJS.NodeJS.LTS"
Install-WingetPackage "PuTTY.PuTTY"
Install-WingetPackage "stedolan.jq"
Install-WingetPackage "Supermicro.IPMIView"
Install-WingetPackage "WinSCP.WinSCP"
