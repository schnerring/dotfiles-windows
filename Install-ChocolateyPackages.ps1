#requires -RunAsAdministrator

# Chocolatey is only used for packages which are not yet available via winget

function Assert-ChocoPackage {
  param (
      [string] $PackageName
  )

  $chocoList = choco list --local-only --exact "$PackageName"

  # Iterate over `choco list` output lines
  foreach ($line in $chocoList) {
      if ($line.Contains($PackageName)) {
          return $true
      }
  }

  return $false
}

function Install-ChocoPackage {
  param (
      [string] $PackageName
  )

  if (Assert-ChocoPackage $PackageName) {
      Write-Output "Skipping $($PackageName) because it is already installed..."
      return
  }

  Write-Output "Installing $($PackageName)..."

  choco install --yes $PackageName
}

Install-ChocoPackage EqualizerAPO

