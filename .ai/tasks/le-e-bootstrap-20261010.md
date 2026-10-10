# Automatic dependencies and visible installer progress

- Branch: feat/le-e-bootstrap-20261010; base fcf7829; target gh-pages (actual GitHub Pages source).
- Scope: automatic dependency installation on macOS/Ubuntu/Debian, Windows WSL/UAC/restart guidance, numbered progress and actionable errors. No automatic reboot or credential collection.
- Implementation: managed Node/Corepack paths, official Node checksum validation, protected existing releases, temporary source downloads with cleanup, complete Bash compound block before execution to prevent piped source being consumed by apt.
- Review: independent read-only review completed; primary agent is the sole writer.
- Verification: bash -n and git diff --check passed. Server20 isolated Ubuntu 24.04 run completed system packages and Node setup after repairing the premature pipeline exit. Stopped during very slow official Rustup download; container confirmed exited. Full installation, app startup, repeated install and Windows interaction remain unverified.
- Runtime evidence retained on server20 under /home/yangfan/codex-workspace/work/le-e-verify-20261010; logs also saved in continuation chat outputs/server20-linux-validation. Host system packages and production services were not modified.
- Authorization: user requested PR creation and merge on 2026-10-10, with incomplete verification already disclosed.
- Release order: commit and merge installers into gh-pages, verify public raw scripts match local SHA256, then merge landing copy. PR and merge SHAs are recorded in Git/GitHub.
