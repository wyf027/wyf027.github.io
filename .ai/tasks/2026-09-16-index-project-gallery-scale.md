# Index project gallery scale

- Status: implementing.
- Branch: `fix/index-project-gallery-scale-20260916`.
- Base: `origin/gh-pages` at `e8860e3d`.
- Symptom: the online project gallery renders much smaller than the existing blog theme.
- Root cause: Bootstrap 3 sets the root font size to `10px`, so Tailwind rem-based sizes render at 62.5% of their intended scale.
- Fix: restore a `16px` root font size only on the home page with a prefixed Tailwind utility class.
- Verification: inspect the rendered online page after GitHub Pages deployment; expected project title `20px`, description `14px`, card padding `24px`, and no horizontal overflow.
