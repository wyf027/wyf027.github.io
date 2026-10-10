# le-e hosted installer

## Goal

Publish install entrypoints for the `le-e` terminal application on the `gh-pages` branch.

## Scope

- `le-e/install`: macOS/Linux Bash installer pinned to source revision
  `6d5366fe5a39ef684146238d023746c68f837c41`.
- `le-e/install.ps1`: PowerShell entrypoint that invokes the Bash installer in WSL.
- `le-e/README.md`: platform contract and recovery instructions.

## Safety contract

- Do not auto-install packages, request credentials, or overwrite an existing release/launcher.
- Sparse checkout only `project/le-e`; keep the fixed revision in versioned user-local storage.
- Build the app and its account helper after prerequisites exist. Apply the editor bridge only
  when an existing clearloop CLI configuration can be safely backed up; otherwise print the
  precise follow-up command.
- Native Windows is not advertised: the current editor bridge is Unix-only; PowerShell requires
  an existing WSL distribution.

## Verification

- Final: Bash syntax and whitespace checks pass. PowerShell parser unavailable; no Windows runtime validation. Main review restored CLI dependency preflight and corrected disclosure of reversible CLI editor configuration changes.
- Implemented only; no commit, push or deployment. Next action: publish scripts and verify raw HTTP bodies before releasing landing commands.

- Planned: shell syntax parsing only. No installer execution, application build, or tests in this task.
