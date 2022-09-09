#requires -RunAsAdministrator

# See also:
#   https://stackoverflow.com/questions/50332885/how-do-i-install-and-use-gpg-agent-on-windows
#   https://docs.microsoft.com/en-us/powershell/module/scheduledtasks/new-scheduledtask

$username = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
$gpgconfPath = Join-Path -Path ${env:ProgramFiles(x86)} -ChildPath "GnuPG\bin\gpgconf.exe"
$action = New-ScheduledTaskAction -Execute $gpgconfPath -Argument "--launch gpg-agent"
$trigger = New-ScheduledTaskTrigger -AtLogon -User $username
$principal = New-ScheduledTaskPrincipal -UserId "NT AUTHORITY\SYSTEM"
$settings = New-ScheduledTaskSettingsSet
$task = New-ScheduledTask -Action $action -Principal $principal -Trigger $trigger -Settings $settings
Register-ScheduledTask "gpg-agent" -InputObject $task
