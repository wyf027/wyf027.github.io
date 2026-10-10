# le-e installers

These hosted scripts install the reviewed `le-e` revision
`6d5366fe5a39ef684146238d023746c68f837c41` from
[`wyf027/leetcode-solu`](https://github.com/wyf027/leetcode-solu/tree/main/project/le-e).

## macOS and Linux

```bash
curl -fsSL https://wyf027.github.io/le-e/install | bash
```

The installer only proceeds after finding Git, Node.js 22.12+ (or 24+),
Corepack, Rust/Cargo, Micro, and `clearloop/leetcode-cli`. If the CLI is already initialized,
it also configures the reversible `le-e` editor bridge. Otherwise it installs the app and
prints the one follow-up command required after the CLI has been initialized.
It does not install system packages, request credentials, collect Cookies, or overwrite an
existing release or launcher. It uses a sparse checkout under
`~/.local/share/le-e/releases/` and creates a versioned launcher in `~/.local/bin/`.

`le-e` starts the app only when that launcher name is unused; otherwise the installer prints
the versioned launcher path. The editor setup records a reversible backup in the local le-e
configuration and refuses to replace an existing backup. Restore it with:

```bash
cd ~/.local/share/le-e/releases/6d5366fe5a39/project/le-e
corepack pnpm setup:editor --restore
```

## Windows

Native Windows is **not currently supported**: the current LeetCode editor bridge is a Unix
executable and the project only ships a macOS Ghostty shortcut. The PowerShell installer runs
the macOS/Linux installer inside an existing WSL distribution instead:

```powershell
powershell -c "irm https://wyf027.github.io/le-e/install.ps1 | iex"
```

It never installs WSL or Windows packages automatically. Install the prerequisite tools inside
WSL, then use `le-e` from that WSL terminal.
