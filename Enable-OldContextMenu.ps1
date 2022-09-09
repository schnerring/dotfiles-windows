$osInfo = Get-WmiObject Win32_OperatingSystem | Select-Object ProductType, Caption

if ($osInfo.ProductType -eq 1 -and $osInfo.Caption -notlike "*Windows 11*") {
    Write-Warning "Can only re-enable old context menu on Windows 11. Exiting..."
    exit
}

# Re-enable old Windows context menu
New-Item -Force -Value "" -Path "HKCU:\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32"
