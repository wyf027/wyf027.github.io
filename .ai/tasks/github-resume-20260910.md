# GitHub Résumé at /resume

- Request: use resume/resume.github.com for the owner GitHub résumé at /resume.
- Source: upstream f5990756495bfd6d86495733bfb238c96771cbbf.
- Baseline: Pages gh-pages eb69ae07ec6b0489f53846af2d953da549396c6b.
- Writer: current task, feat/github-resume-20260910, isolated site-resume worktree.
- Scope: self-host upstream static app, fixed owner wyf027, preserve theme, use Tailwind utilities for navigation, add blog Resume navigation.
- Adaptations: remove upstream analytics and opt-in scan (owner explicitly requested publishing); start details after template insertion; label recent PR counts accurately; escape repository descriptions; vendor runtime assets.
- Public data only; no credentials in site; no invented employment or education.
- No tests or build commands requested; use syntax, HTTP and browser verification.
- Verified: node --check passes; local browser renders owner, repositories, languages, recent PRs and theme; independent read-only review found no blockers. Runtime assets served locally.
- Pending: publish, verify Pages and /resume online.
