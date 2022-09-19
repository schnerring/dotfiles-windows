Set-ExecutionPolicy AllSigned
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

# TODO: upgrade "App Installer" to access winget

# Install Chocolatey
Invoke-WebRequest -UseBasicParsing "https://community.chocolatey.org/install.ps1" | Invoke-Expression

# Install Scoop (Admin not necessary)
Invoke-WebRequest -UseBasicParsing get.scoop.sh | Invoke-Expression

# TODO: don't run as admin
npm install --global npm-check-updates

scoop install intermodal

# TODO: Missing Apps

# gitversion-portable
# sourcetree
# syncthing
# IPMI View

# EqualizerAPO doesn't exist in winget
