# Restore personal site

- Request: restore the original personal blog at https://wyf027.github.io/ and locate the original resume repository for /resume.
- Writer: current Codex task; branch fix/restore-personal-blog-20260910; isolated site-restore worktree.
- Baseline: gh-pages 8cf29d926612644c5189cb07219276f7fa75ade7; root returned install-only HTML, /resume returned 404.
- Source: wyf027/leno23.github.io at d4cff01a5eadc4f9c7007d19d2aca7e0f50dd20d (clean fetched main).
- Change: import original blog; enable native Jekyll processing; update canonical URL and account references; retain install endpoint.
- Constraints: no new tests or local builds; preserve existing theme; do not invent resume content.
- Verification: all 1,369 original tracked files present; only README.md and _config.yml differ from source. Installer byte-identical to gh-pages baseline. Independent read-only review found no blockers. No local build or new tests.
- Pending: Pages deployment and public HTTP/browser checks.
- Resume: authenticated repository search (owned/collaborator visibility), resume/cv name queries, README/code reference queries found no personal resume source. Candidate-data repositories excluded. /resume remains unresolved.
- Next action: review restoration diff, then publish gh-pages and verify public deployment.
