# Blog visual refresh

- Status: publication authorized by user; releasing theme and portfolio names.
- User direction: refined blog style, dark by default with a light-theme switch.
- Base: gh-pages at 83541bdd0916c5df6ea7cfd16685bb3b7b81ed48.
- Branch: feat/blog-dark-theme-20261009; root is sole writer in work/github-portfolio.
- Scope: shared shell, homepage, 20 portfolio entries, archive and article presentation. Preserve content, URLs, category filtering, pagination and legacy attribution. Standalone resume/install are outside the shared layout.
- Design: charcoal surfaces, warm off-white text, muted sage accents, editorial typography and fine borders. Warm paper light mode. New HTML uses Tailwind utilities; shared CSS adapts existing Markdown/Bootstrap content.
- Theme: default dark independent of OS; persist explicit choice in localStorage, apply before paint, accessible labels, graceful storage failure.
- Verification: source/diff review, JavaScript syntax, template/data consistency, independent review. No tests, build commands or browser automation.
- Verification: node --check assets/js/theme.js and git diff --check pass. All 20 project data entries are byte-for-byte unchanged. Tailwind loads once in the shared head; theme restoration runs before styles. Category filter and ToC contracts remain intact. Independent review's mixed-case Bookmark navigation finding is fixed by normalizing both values; footer top anchor now targets html#top.
- Review artifact: outputs/blog-theme-preview.html, a standalone homepage presentation preview generated from the edited templates with all 20 projects and the real theme switch. Article teasers in this preview are placeholders for layout review; canonical posts are unchanged. Preview is not a Jekyll build or browser acceptance test.
- Limits: no tests, project build, or browser execution was performed; browser theme persistence and responsive rendering remain unverified. Third-party comment widgets control their own appearance. Standalone resume/install pages keep their existing designs.
- Next action: user reviews the preview and authorizes publication; only then commit/push and verify GitHub Pages publication.

## Portfolio naming refinement

- User requested Chinese project names emphasizing real technical highlights.
- Updated all 20 names using the existing descriptions/tags and earlier verified source information: browser sandbox, streaming document updates, algorithm visualization, retrieval-augmented generation, wallet connections and low-code editing.
- Existing descriptions, tags, preview/source URLs and project ordering are unchanged. YAML parses, all 20 names are unique, and comparison confirms only name fields changed. git diff --check passes.
- Refreshed outputs/blog-theme-preview.html with all 20 Chinese names. This supersedes the earlier statement that project data is entirely unchanged; all non-name fields remain unchanged.
- Publication remains pending alongside the approved theme work.

## Preserve technology names

- User clarified that key technology names must remain in English, with Chinese describing the functionality.
- Refined 15 names to retain RAG, LowCode, React, Vue, Next.js, JavaScript, FLIP, File API, Web3, DEX, LeetCode and Nodepod as appropriate.
- The browser runtime entry remains Nodepod, matching its existing verified data; do not substitute WebContainer without implementation evidence.
- Only name fields changed; 20 unique entries and all descriptions, tags, URLs and ordering remain intact. Refreshed the preview; YAML and git diff --check pass. No publication.

## Nodepod naming clarification

- User approved the name 类 WebContainer 浏览器沙箱 and a description attributing the runtime to Nodepod.
- Updated this entry's name and description only; tags and URLs remain unchanged. This supersedes the earlier name-only scope.
- Source inspection confirms @scelar/nodepod, Nodepod.boot, virtual filesystem operations, spawn and HTTP preview integration. Full WebContainer compatibility is not claimed.
- Verification: local preview refreshed with 20 entries and no unresolved Liquid; updated name and description appear in data and preview; git diff --check passed. No tests or builds run.
- Next action: await publication authorization for the accumulated theme and naming changes.

## Publication

- User explicitly requested online publication on 2026-10-09. Scope: portfolio names and accumulated blog theme changes; Nodepod runtime migration is a separate repository and is not included.
- Pre-publish checks: remote gh-pages unchanged from base; git diff --check and theme.js syntax pass. Existing independent review completed.
- Next action: commit, open and merge release PR to gh-pages, then verify Pages deployment and public HTTP content.
