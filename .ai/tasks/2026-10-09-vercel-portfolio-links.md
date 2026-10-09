# Reachable Vercel projects in the portfolio

- Status: published and verified.
- Request: add the user's reachable Vercel sites to the GitHub Pages portfolio.
- Repository: wyf027/wyf027.github.io; publishing branch: gh-pages, root.
- Base: 3005bbefe76ba1763ff029507b4fc4ac9ae9148e.
- Working branch: feat/portfolio-vercel-links-20261009.
- Writer: root agent in isolated work/github-portfolio checkout; source/link review is read-only.
- Scope: preserve the existing Tailwind gallery and 12 entries; append verified missing projects to _data/projects.yml. Include the user-provided wyf-low-code.vercel.app if reachable.
- Exclusions: five public 404 sites and two login-protected sites from the current Vercel inventory; a Vercel connector scope discrepancy prevents treating its entire inventory as currently manageable.
- Verification: public homepage and same-origin script HTTP probes, source-link verification, YAML validation, duplicate/coverage checks, independent review, published page inspection and Pages CI status. No new tests or local build commands.
- Checks completed: all 20 public homepages return HTTP 200; every same-origin script referenced by their HTML returns HTTP 200 with JavaScript content type. YAML parses successfully, all 20 entries contain required fields, preview hosts are unique, coverage has no missing/extra hosts, and the original 12 entries are unchanged. git diff --check passes.
- UI: existing Tailwind layout is preserved; source buttons render only when a source URL exists. The low-code preview opens its verified diy=true editor route.
- Independent review: both atlas source paths verified HTTP 200; renamed GitHub repositories use current wyf027 URLs. Web3 Connector source is w-wallet-sdk. The old vite-vue3 repository returns 404, so the mind-map entry has a preview only. All 20 entries have required display fields; source_url is optional (19 entries).
- Limits: HTTP/asset checks establish public reachability, not complete interactive behavior; protected and 404 sites remain excluded.
- Delivery: PR #7 merged as cf120df3fc4e6f774ab84817c8829b244fe6555d; GitHub Pages run 37876820740 completed successfully.
- Published evidence: https://wyf027.github.io/#projects returns HTTP 200. The rendered gallery has 20 cards, 20 preview links, 19 source links, zero missing preview links, and zero empty links.
- Next action: none; requested publication complete.
