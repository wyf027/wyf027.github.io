# le-e installers

These hosted scripts install the reviewed `le-e` revision
`6d5366fe5a39ef684146238d023746c68f837c41` from
[`wyf027/leetcode-solu`](https://github.com/wyf027/leetcode-solu/tree/main/project/le-e).

## macOS and Linux

```bash
curl -fsSL https://wyf027.github.io/le-e/install | bash
```

Missing dependencies are installed automatically on macOS and Ubuntu/Debian:

The Unix download command itself requires `curl`. On a minimal Ubuntu/Debian system without it, first run `sudo apt-get update && sudo apt-get install -y curl ca-certificates`, then rerun the command above. The Windows entry handles this bootstrap inside WSL automatically.

- macOS: install Homebrew if absent, then missing Git, Micro, Python and native build dependencies. If Command Line Tools are missing, complete the macOS installation dialog and rerun.
- Ubuntu/Debian: request sudo authorization and install missing apt packages (Git, curl, CA certificates, build-essential, Python, pkg-config, OpenSSL headers, Micro and xz).
- Reuse compatible Node.js; otherwise download official Node.js 24 into the le-e user directory and verify its SHA-256 manifest before extraction. Corepack is installed with a user-local npm prefix; Rust uses the official rustup installer; the LeetCode CLI is installed via Cargo when absent.
- Other Linux distributions get an explicit manual-action message; they are not silently treated as supported.

System package installation can request your system password through sudo; no passwords or Cookies are recorded. Do not run the whole script as root. No automatic reboot occurs.
The app is built from source in `~/.local/share/le-e/releases/`; managed tools live in `~/.local/share/le-e/tools/`. The launcher includes managed tool paths, so a new terminal can still find them. Native downloads and compilation can take several minutes.

If the CLI is already initialized, the installer configures the reversible editor bridge. Otherwise it prints the follow-up command after CLI initialization. Existing unmanaged launchers and modified release directories are not overwritten; a completed managed installation is reported without reinstalling.

`le-e` starts the app only when that launcher name is unused; otherwise the installer prints
the versioned launcher path. The editor setup records a reversible backup in the local le-e
configuration and refuses to replace an existing backup. Restore it with:

```bash
cd ~/.local/share/le-e/releases/6d5366fe5a39/project/le-e
corepack pnpm setup:editor --restore
```

Source downloads use a temporary directory that is removed on normal exit or failure. Only a complete checkout is moved into the release directory, so a failed download does not block the next attempt. Temporary Node archives are also removed on exit.

## Windows

Native Windows is **not currently supported**: the current LeetCode editor bridge is a Unix
executable and the project only ships a macOS Ghostty shortcut. The PowerShell installer runs
the macOS/Linux installer inside a WSL distribution instead:

```powershell
powershell -c "irm https://wyf027.github.io/le-e/install.ps1 | iex"
```

The PowerShell entry checks WSL, requests UAC authorization for missing WSL features, and installs Ubuntu for the current user when no distribution exists. It never automatically restarts Windows. When a restart or Ubuntu username/password initialization is necessary, it prints **[ACTION REQUIRED]** and the exact retry command; rerun the same installer after those steps. Ubuntu is not registered under a different elevated administrator account.

Within a ready default WSL distribution, it bootstraps curl if absent, then runs the Bash dependency installer. Root as the default Linux user, denied UAC/sudo, download failures and unsupported distributions stop with actionable messages.

Logs use numbered stages, `[INSTALL]`, `[OK]`, `[PERMISSION]`, `[ACTION REQUIRED]` and `[ERROR]`; PowerShell uses cyan/yellow/red/green headings. They show real command output, not invented progress percentages. Windows messages use ASCII for Windows PowerShell 5.1 encoding compatibility.

References: [Microsoft WSL install](https://learn.microsoft.com/windows/wsl/install), [WSL commands](https://learn.microsoft.com/windows/wsl/basic-commands), [Homebrew installation](https://docs.brew.sh/Installation).

Static review and Bash syntax validation passed. An isolated Ubuntu 24.04 run on server20 completed system dependencies and Node setup, then was stopped during a slow official Rustup download. That run exposed and verified the fix for piped script input being consumed during apt installation. Full installation, app startup and Windows UAC/reboot flows remain unverified. Publish the scripts before landing-page claims about automatic dependency installation.
