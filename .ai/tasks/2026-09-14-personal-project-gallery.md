# Personal Project Gallery

- Status: published and verified.
- Branch: `feat/personal-project-gallery-20260914`.
- Base: `origin/gh-pages`.
- Deployment manifest commit: `a134df1b`, merged to leetcode-solu as `29415212`.
- Eligible projects: 12, including WYF Screenshot Studio.
- Excluded:
  - `daodejing-atlas`: 657 referenced images are absent from the repository.
  - `classic-sci-fi-atlas`: 2995 Git LFS images total 7.58 GiB and exceed the Vercel Hobby static-file limit.
- Live homepage: `https://wyf027.github.io/`.

## Delivery Evidence

- Gallery PR: `#1`.
- Merge commit: `ba1cc412e64ff2b8a457616bd1d2462a8c8b7b8a`.
- GitHub Pages run: `34835447541`, build and deploy succeeded.
- Live homepage: HTTP 200.
- Rendered project cards: 12.
- Rendered preview links: 12.
- Rendered source links: 12.
- `/resume/` and `/install/`: HTTP 200.
- Desktop viewport: three-column card grid rendered below the existing hero.
- Mobile viewport: one-column cards rendered without horizontal overflow.
- Console: only the known Tailwind browser-build production warning; no application error.
- Local Jekyll build was unavailable because the historical Bundler 1.17 dependency chain is incompatible with local Ruby 4 and still fetches one dependency through `git://`. The authoritative GitHub Pages build passed.
