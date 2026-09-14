# Update résumé from supplied PDF

- User explicitly requested publishing the attached résumé content to their existing GitHub résumé.
- Base: gh-pages 0b957940319f945a4425cd7b04cc29e31ff509ae.
- Branch/worktree: feat/resume-pdf-content-20260914 / site-resume-pdf; one active writer.
- Source: user-supplied 简历web2-2.pdf, three content pages and a blank trailing page; source remains outside the repository.
- Scope: static Chinese professional résumé before existing dynamic GitHub data; 7 skills, 5 roles, 8 projects, education. Preserve source dates/metrics, normalize typography and obsolete GitHub username only.
- Printing: professional résumé only. No employment, degree or contact details invented.
- Verified: independent review confirmed all 7 skills, 5 roles, 8 projects, education and source metrics. Local browser renders static professional content; original GitHub target updated to current account. git diff --check passes.
- Pending: Pages deployment and live HTTP/browser verification.
- No build commands or test files.
