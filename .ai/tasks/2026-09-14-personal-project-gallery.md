# Personal Project Gallery

- Status: published and verified.
- Branch: `feat/personal-project-gallery-20260914`.
- Base: `origin/gh-pages`.
- Deployment manifest commit: `a134df1b`, merged to leetcode-solu as `29415212`.
- Eligible projects: 12, including WYF Screenshot Studio.
- Excluded:
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

## 2026-09-15 correction

- The old `classic-atlas` homepage card was replaced with the independent `daodejing-atlas` sketchbook at the user's request.
- Sketchbook PR #1756 merged as `0a5ca13c`; its 81 local illustrated spreads and attribution files are now in `leetcode-solu/main`.
- Vercel production deployment `dpl_FUknDzYRhnMDqverZHS86j3oTwMz` is Ready at `https://wyf-daodejing-atlas.vercel.app/`.
- Production HTML and sampled chapter 1, 8, and 81 images match their merged source hashes.
- The production browser turned chapter 7 to chapter 8.
- This gallery update is pending GitHub Pages publication.
