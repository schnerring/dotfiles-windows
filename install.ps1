# TODO: upgrade "App Installer" to access winget

$packages = @(
    # Browsers
    "Mozilla.Firefox", # moniker: firefox
    "Google.Chrome",   # moniker: chrome

    # Common
    "7zip.7zip",
    "KeePassXCTeam.KeePassXC",
    "VideoLAN.VLC",    # moniker: vlc

    # Development
    "Git.Git",
    "Notepad++.Notepad++",
    "Microsoft.VisualStudioCode", # moniker: vscode
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


winget install --silent --source winget --accept-source-agreements --accept-package-agreements "Microsoft.PowerShell" --override "ADD_EXPLORER_CONTEXT_MENU_OPENPOWERSHELL=1 ADD_FILE_CONTEXT_MENU_RUNPOWERSHELL=1"
winget install --silent --source winget --accept-source-agreements --accept-package-agreements "TeamViewer.TeamViewer"
winget install --silent --source winget --accept-source-agreements --accept-package-agreements "SumatraPDF.SumatraPDF"

winget install --silent --source winget --accept-source-agreements --accept-package-agreements "Microsoft.Office"
winget install --silent --source winget --accept-source-agreements --accept-package-agreements "Microsoft.VisualStudio.2022.Professional" --override "--add Microsoft.VisualStudio.Workload.Azure;includeRecommended --add Microsoft.VisualStudio.Workload.ManagedDesktop;includeRecommended --add Microsoft.VisualStudio.Workload.NetCrossPlat;includeRecommended --add Microsoft.VisualStudio.Workload.NetWeb;includeRecommended --add Microsoft.VisualStudio.Workload.Office;includeRecommended"

