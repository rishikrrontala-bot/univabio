# PROGRESS — UnivaBio entry (Rishik Rontala)

**Deadline:** Tue Oct 6, 2026 · 11:45 PM EDT (`2026-10-06T23:45:00-04:00`)
**Internal "all deliverables done" target:** Mon Oct 5, 2026 · 11:45 PM EDT (≥24 h buffer, CLAUDE.md lesson 2)

## Countdown log
| Phase start (ET) | Hours left | Phase |
|---|---|---|
| Wed Sep 23 2026 22:40 EDT | 313.1 | 0 · Setup + plan |

## Phase plan (budgeted backwards, hackathon-win Phase 4 table)
Working window = 313 h − 24 h reserve = ~289 h. This run is a single unattended cloud session, so the plan is
"do it all now, in order", but each slice has a latest-finish time so a resumed session knows if it is behind.

| # | Phase | Share | Latest finish (ET) | Status |
|---|---|---|---|---|
| 0 | Setup, PROGRESS.md, tool check | — | Sep 24 | in progress |
| 1 | Research: verify event facts, 5–8 winner briefs, RESEARCH-BRIEF | ~5% | Sep 25 | todo |
| 2 | Concepts: 3 scored, pick, CONCEPT.md pushed | ~2% | Sep 25 | todo |
| 3 | Design direction: PRODUCT.md + DESIGN.md | ~3% | Sep 26 | todo |
| 4 | Core build (wow moment → demo path → rest), tests, CI, deploy | ~50% | Oct 1 | todo |
| 5 | Quality passes (critique → audit → polish), live headless pass | incl. above | Oct 2 | todo |
| 6 | Demo video (2:00–3:00, captioned) | ~20% | Oct 3 | todo |
| 7 | Submission kit (DEVPOST, one-pager PDF, gallery, checklist, docs) | ~15% | Oct 4 | todo |
| 8 | Ship to main, HANDOFF.md | — | Oct 5 | todo |
| — | Buffer for the thing that breaks | ~15% | Oct 5 23:45 | — |

## Log
- **Phase 0** (Sep 23 22:40 EDT, 313.1 h left): read CLAUDE.md, HACKATHON.md, PROMPT.md, hackathon-win skill + refs + templates.
- **Tool check** (Sep 23 22:50 EDT, ~313 h left):
  - Node v22.22.2, npm 10.9.7, Python 3.11. Playwright Chromium present at `/opt/pw-browsers` (chromium-1194).
  - ffmpeg: not on PATH; `apt-get install ffmpeg` failed (404s). Installed `imageio-ffmpeg` (ffmpeg 7.0.2 with libx264 + aac, **no** libass/drawtext) and symlinked to `/usr/local/bin/ffmpeg`. Captions will be rendered as an in-page overlay / PNG overlays, not the `subtitles` filter.
  - n8n: `N8N_BASE_URL` is **unset** → no API access this run. Any workflow ships as importable `n8n/*.json` + a HANDOFF step.
  - Skills: `ui-demo` (anthropic-skills:ui-demo), `dataviz`, `make-interfaces-feel-better`, `accessibility` are loaded. `impeccable`, `emil-design-skills:animate`, `taste-skill`, `hypersite` are **not** loaded → cloned fallbacks to `/tmp/skills/{impeccable,emil-skills,taste-skill}` per CLAUDE.md. `hypersite` has no public fallback; `web-design-cheatcode` covers the landing surface.
  - **Network policy is restricted.** Blocked (curl + WebFetch): devpost.com, huggingface.co, pubmed/ncbi, physionet, UCI, kaggle, arxiv, jsdelivr, unpkg, youtube, web.archive.org. Open: github.com / api.github.com / raw.githubusercontent.com, npm, PyPI, fonts.googleapis.com, storage.googleapis.com. **WebSearch works** (server-side). Consequences: event facts + winners verified via WebSearch index snippets and GitHub repos, not by loading Devpost directly (flagged per brief); no Hugging Face model downloads, so AI must be trained/computed locally or come from npm/PyPI/GitHub/googleapis.
- **Research, in progress** (Sep 23 22:57 EDT, ~312.8 h left): 7 winner briefs in `research/winners/`, from two research agents.
  - **Organizer network:** all three Raven Hacks VTL 2026 placings (Univa Dev), confirmed in the organizer's public site source, `github.com/univadev/univadev.com`.
  - **Same domain:** EyeTune (HopHacks 2025), LifeLink (MediHacks 2024), Respira and MeloCognia (Congressional App Challenge 2025).
  - **Rubric:** the organizer's source for the UnivaBio page lists five criteria with **no weights**. The Raven Hacks weights were Innov 25 / Impact 25 / Tech 20 / Pres 10 / Design 10 / Feas 10.
  - **Judges:** software engineers (Sudheer Pratap; Aditya Shrivastava of Barclays).
  - **Competitor lanes already crowded:** medication AI, lab-report explainers, triage chat, care navigation.
  - **User instruction (Sep 23 22:5x):** save (commit + push) everything by 11:20 PM ET, and keep saving often in case credits run low.
  - **RESUME HERE:** write RESEARCH-BRIEF.md, then CONCEPTS.md. Leading concept is an on-device night cough monitor, validated on public Coswara + ESC-50 data from GitHub. Alternatives: a digits-in-noise hearing screen, and a digital Mini-Cog clock drawing test.
