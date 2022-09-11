#requires -RunAsAdministrator

# VIS
Enable-WindowsOptionalFeature -All -NoRestart -Online -FeatureName "IIS-WebServer"
Enable-WindowsOptionalFeature -All -NoRestart -Online -FeatureName "IIS-WindowsAuthentication"
Enable-WindowsOptionalFeature -All -NoRestart -Online -FeatureName "IIS-ManagementConsole"
Enable-WindowsOptionalFeature -All -NoRestart -Online -FeatureName "IIS-ASPNET45"
Enable-WindowsOptionalFeature -All -NoRestart -Online -FeatureName "WCF-HTTP-Activation45"

# Required by Exact Audio Copy
Enable-WindowsOptionalFeature -All -NoRestart -Online -FeatureName "NetFx3"

# OpenSSH
Add-WindowsCapability -Online -Name "OpenSSH.Client"
