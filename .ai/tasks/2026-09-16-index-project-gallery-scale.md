# Index project gallery scale

- Status: published and verified.
- Branch: `fix/index-project-gallery-scale-20260916`.
- Base: `origin/gh-pages` at `e8860e3d`.
- Symptom: the online project gallery renders much smaller than the existing blog theme.
- Root cause: Bootstrap 3 sets the root font size to `10px`, so Tailwind rem-based sizes render at 62.5% of their intended scale.
- Fix: restore a `16px` root font size only on the home page with a prefixed Tailwind utility class.
- Delivery: PR `#5`, squash merge `88b6e602`, GitHub Pages run `35063921145` succeeded.
- Desktop verification: 12 cards; project title `20px`, description `14px`, card padding `24px`, and root font size `16px`.
- Mobile verification: at `390px`, the grid is one column and `scrollWidth = clientWidth = 390px`.
