$ErrorActionPreference = 'Stop'
# ASCII messages stay readable in Windows PowerShell 5.1 and PowerShell 7.
$RetryCommand = 'powershell -c "irm https://wyf027.github.io/le-e/install.ps1 | iex"'

function Show-Step([string]$Message) {
    Write-Host "`n========== $Message ==========" -ForegroundColor Cyan
}
function Show-Action([string]$Message) {
    Write-Host "`n========== [ACTION REQUIRED] ==========" -ForegroundColor Yellow
    Write-Host $Message
    Write-Host "`nAfter completing these steps, rerun:`n$RetryCommand" -ForegroundColor Yellow
}
function Install-WslFeatures {
    Show-Step '[PERMISSION] Windows administrator authorization is required'
    Write-Host 'A Windows UAC dialog will open. Choose Yes to enable/install WSL.'
    Write-Host 'Only WSL features are installed as administrator; Ubuntu is installed later as your normal user.'
    try {
        $process = Start-Process -FilePath $script:WslPath -ArgumentList '--install', '--no-distribution' -Verb RunAs -Wait -PassThru
    } catch {
        Show-Action 'Administrator authorization was canceled or Windows could not start WSL setup. Rerun and approve UAC. If WSL is unavailable, update Windows and follow https://learn.microsoft.com/windows/wsl/install .'
        throw
    }
    if ($process.ExitCode -notin @(0, 3010)) {
        Show-Action "WSL setup failed (exit $($process.ExitCode)). Check Windows Update and virtualization support; do not keep reinstalling blindly."
        throw 'WSL feature installation did not succeed.'
    }
    Show-Action 'WSL features were installed. Save your work and restart Windows manually. This script will NOT restart your computer. After reboot, rerun as your normal Windows user.'
}

try {
    Show-Step '[1/4] Check Windows and WSL'
    if ([Environment]::OSVersion.Platform -ne [PlatformID]::Win32NT) {
        throw 'Use the Bash install command on macOS/Linux.'
    }
    $script:WslPath = Join-Path $env:WINDIR 'System32\wsl.exe'
    if (-not [Environment]::Is64BitProcess -and [Environment]::Is64BitOperatingSystem) {
        $script:WslPath = Join-Path $env:WINDIR 'Sysnative\wsl.exe'
    }
    if (-not (Test-Path -LiteralPath $script:WslPath)) {
        Show-Action 'wsl.exe is not available. Update to a supported Windows 10/11 version and follow https://learn.microsoft.com/windows/wsl/install . No system files were changed.'
        return
    }
    & $script:WslPath --status
    if ($LASTEXITCODE -ne 0) {
        # Modern WSL can exist without a default distribution yet.
        & $script:WslPath --version
        if ($LASTEXITCODE -ne 0) {
            Install-WslFeatures
            return
        }
    }

    Show-Step '[2/4] Check Linux distribution'
    $rawDistros = & $script:WslPath --list --quiet
    if ($LASTEXITCODE -ne 0) { throw 'Cannot list WSL distributions. Resolve the WSL error above, then rerun.' }
    $distros = @($rawDistros | ForEach-Object { ($_ -replace "`0", '').Trim() } | Where-Object { $_ })
    if ($distros.Count -eq 0) {
        Write-Host '[INSTALL] Installing Ubuntu for your current Windows user. Download may take several minutes.'
        & $script:WslPath --install -d Ubuntu --no-launch
        $installExit = $LASTEXITCODE
        if ($installExit -notin @(0, 3010)) { throw "Ubuntu installation failed (exit $installExit). Read the Windows output above." }
        Show-Action 'Ubuntu has been installed. If Windows requests a restart, save your work and restart first. Open Ubuntu from the Start menu and create your Linux username/password. Then rerun this command. The password is entered only into Ubuntu, not collected by this installer.'
        return
    }

    Show-Step '[3/4] Start your default WSL distribution'
    Write-Host 'If Ubuntu asks for first-time setup, create a Linux username/password now. Do not use root as your daily user.'
    $linuxUid = & $script:WslPath --exec id -u
    if ($LASTEXITCODE -ne 0) {
        Show-Action 'The default WSL distribution could not start. Open it from the Start menu to initialize it. If a restart is required, save your work and restart manually. Resolve virtualization/kernel errors before retrying.'
        throw 'WSL is not ready.'
    }
    if (($linuxUid -join '').Trim() -eq '0') {
        Show-Action 'Your default Linux user is root. Create a normal Linux user and set it as the default, then rerun. See https://learn.microsoft.com/windows/wsl/setup/environment .'
        return
    }

    Show-Step '[4/4] Install dependencies and le-e inside WSL'
    Write-Host 'Missing Ubuntu/Debian packages will be installed. sudo may request your Linux password.'
    Write-Host 'Existing CLI editor settings may be updated with a reversible backup. No credentials are collected.'
    $bootstrap = @'
set -euo pipefail
if ! command -v curl >/dev/null 2>&1; then
  echo '[INSTALL] curl and CA certificates are required to download the installer.'
  . /etc/os-release
  case "$ID" in ubuntu|debian) ;; *) echo '[ACTION REQUIRED] Install curl in this distribution, or use Ubuntu/Debian.' >&2; exit 1 ;; esac
  command -v sudo >/dev/null || { echo '[ACTION REQUIRED] sudo is missing; ask your administrator to enable package installation.' >&2; exit 1; }
  echo '[PERMISSION] Enter your Linux sudo password if requested. It is not recorded.'
  sudo -v </dev/tty
  sudo -n apt-get update
  sudo -n apt-get install -y curl ca-certificates
fi
installer=$(mktemp)
trap 'rm -f "$installer"' EXIT
curl --proto '=https' --tlsv1.2 -fsSL https://wyf027.github.io/le-e/install -o "$installer"
bash "$installer"
'@
    # Avoid PowerShell 5.1 native argument quoting corrupting embedded Bash quotes.
    $encoded = [Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes($bootstrap.Replace("`r", '')))
    & $script:WslPath --exec bash -o pipefail -lc "echo $encoded | base64 -d | bash"
    if ($LASTEXITCODE -ne 0) { throw "Linux installer failed (exit $LASTEXITCODE). Read the [ERROR] or [ACTION REQUIRED] message above and resolve it before retrying." }
    Show-Step '[OK] Installation finished inside WSL'
    Write-Host 'Open your WSL terminal and use the exact launcher path printed above. No Windows restart was triggered.' -ForegroundColor Green
} catch {
    Write-Host "`n========== [ERROR] Installation stopped ==========" -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
    Write-Host "Retry after resolving the error:`n$RetryCommand"
    throw
}
