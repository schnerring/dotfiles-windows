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
