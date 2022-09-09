Set-ExecutionPolicy AllSigned
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

# TODO: upgrade "App Installer" to access winget

# Install Chocolatey
Invoke-WebRequest -UseBasicParsing "https://community.chocolatey.org/install.ps1" | Invoke-Expression

# Install Scoop (Admin not necessary)
Invoke-WebRequest -UseBasicParsing get.scoop.sh | Invoke-Expression

choco install --yes lossless-audio-checker
choco install --yes lame

# TODO: don't run as admin
npm install --global npm-check-updates

scoop install intermodal

# TODO: Missing Apps

# gitversion-portable
# sourcetree
# syncthing
# IPMI View

choco install --yes kubernetes-cli
choco install --yes kubernetes-helm

choco install --yes paint.net

# Hugo
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
