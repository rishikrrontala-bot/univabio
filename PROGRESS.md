# PROGRESS — UnivaBio entry (Rishik Rontala)

**Deadline:** Tue Oct 6, 2026 · 11:45 PM EDT (`2026-10-06T23:45:00-04:00`)
**Internal "all deliverables done" target:** Mon Oct 5, 2026 · 11:45 PM EDT (≥24 h buffer, CLAUDE.md lesson 2)

## Countdown log
| Phase start (ET) | Hours left | Phase |
|---|---|---|
| Wed Sep 23 2026 22:40 EDT | 313.1 | 0 · Setup + plan |
| Wed Sep 23 2026 22:52 EDT | 312.9 | 1 · Research |
| Wed Sep 23 2026 23:00 EDT | 312.7 | 2 · Concept picked |

## Phase plan (budgeted backwards, hackathon-win Phase 4 table)
Working window = 313 h − 24 h reserve = ~289 h. This run is a single unattended cloud session, so the plan is
"do it all now, in order", but each slice has a latest-finish time so a resumed session knows if it is behind.

| # | Phase | Share | Latest finish (ET) | Status |
|---|---|---|---|---|
| 0 | Setup, PROGRESS.md, tool check | — | Sep 24 | ✅ done |
| 1 | Research: verify event facts, 5–8 winner briefs, RESEARCH-BRIEF | ~5% | Sep 25 | ✅ done |
| 2 | Concepts: 3 scored, pick, CONCEPT.md pushed | ~2% | Sep 25 | ✅ done: **Hark** (night-cough counter) |
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
- **Phase 1–2 done** (Sep 23 23:00 EDT, ~312.7 h left):
  - `research/RESEARCH-BRIEF.md` is written, and HACKATHON.md now carries the verified facts (✔ marks).
  - `research/CONCEPTS.md` scores three concepts: A Hark 4.60/4.65, B Quiet Test 3.60/3.50, C Ten Past Eleven 3.80/3.75. **Picked A.**
  - `CONCEPT.md` is pushed.
- **RESUME HERE → Phase 3 (design direction)** + **ML data pipeline**:
  - `ml/`: download a Coswara subset (per-date `tar.gz.*` parts from github.com/iiscleap/Coswara-Data, ~13 GB total, so only take a subset) and ESC-50 (github.com/karolpiczak/ESC-50).
  - Train a log-mel CNN (PyTorch CPU), export weights for the TS inference, and write parity test vectors.
  - Get the YAMNet baseline via storage.googleapis.com/mediapipe-models/audio_classifier/yamnet.
  - Then run the impeccable shape step to write PRODUCT.md + DESIGN.md (fallback skills in /tmp/skills; re-clone if the VM was recycled).
- **Paused by user request** (Sep 23 ~23:06 EDT, ~312.6 h left): Rishik asked to push everything and stop.
  - **State at pause:**
    - Phase 3 (design direction) had just started. `impeccable context` ran and reported no PRODUCT.md, so init → new-work is required. Rishik said he is unavailable, so PRODUCT.md is inferred from the brief, with assumptions labelled.
    - The ML data pipeline was running outside the repo (`/home/user/data`, not committed): Coswara subset extraction (13 date folders, ~1,436 participants, resampled to 16 kHz), an ESC-50 clone, and `pip install torch==2.5.1 soundfile librosa scikit-learn onnx`.
  - **RESUME HERE:**
    1. Re-clone the fallback skills (`/tmp/skills`, see CLAUDE.md), re-install ffmpeg (`pip install imageio-ffmpeg` + symlink) and the Python deps.
    2. Re-fetch the data: clone Coswara with `git clone --filter=blob:none --no-checkout --depth 1 https://github.com/iiscleap/Coswara-Data.git` into `/tmp/intel/iiscleap_Coswara-Data`. Don't run `git ls-tree -l` on it (that pulls all 13 GB), and budget ~4 GB for the subset. Then run `ml/data/extract_coswara.sh` and clone ESC-50 into `/home/user/data/ESC-50`.
    3. Write PRODUCT.md (impeccable `reference/init.md` template), run `impeccable concept-seed --scope direction --mode operate`, and write DESIGN.md at finish.
    4. Build `ml/` (training + validation + YAMNet baseline), then the Vite app.
