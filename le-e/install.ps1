$ErrorActionPreference = 'Stop'

# le-e currently has a Unix editor bridge. Use WSL instead of pretending that
# the incomplete native Windows path is supported.
$InstallUrl = 'https://wyf027.github.io/le-e/install'

if (-not (Get-Command wsl.exe -ErrorAction SilentlyContinue)) {
  throw 'WSL is required for le-e on Windows. Install a WSL distribution, then run this command again.'
}

$distributions = @(wsl.exe --list --quiet 2>$null | Where-Object { $_.Trim().Length -gt 0 })
if ($LASTEXITCODE -ne 0 -or $distributions.Count -eq 0) {
  throw 'No WSL distribution is available. Install and start a Linux distribution, then run this command again.'
}

Write-Host 'le-e uses its macOS/Linux installer inside your default WSL distribution.'
Write-Host 'No system packages are installed automatically and no credentials are collected.'
Write-Host 'Inside WSL, the installer may update the CLI editor setting with a reversible backup.'
wsl.exe -- bash -o pipefail -lc "curl -fsSL '$InstallUrl' | bash"
if ($LASTEXITCODE -ne 0) {
  throw 'The WSL installer did not complete. Resolve the dependency message inside WSL and rerun this command.'
}

Write-Host 'Installation complete in WSL. Start it from WSL with: le-e'
