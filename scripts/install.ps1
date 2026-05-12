# Minimal PowerShell installer for Windows
Param()

$RepoRoot = Split-Path -Parent $MyInvocation.MyCommand.Definition

Function Link-File($src, $dst) {
  if (Test-Path $dst) {
    Write-Host "Skipping existing $dst"
  } else {
    New-Item -ItemType SymbolicLink -Path $dst -Target $src -Force
    Write-Host "Linked $dst -> $src"
  }
}

# Example: link PowerShell profile
# $src = Join-Path $RepoRoot 'windows\Profile.ps1'
# $dst = "$HOME\Documents\WindowsPowerShell\Profile.ps1"
# Link-File $src $dst

Write-Host "Windows installer scaffold finished. Review and enable desired links."
