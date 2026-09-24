# Research brief: UnivaBio 2026

*Compiled Sep 23 2026, 23:00–23:10 EDT, about 313 h before the deadline.*

**How this was verified.** This session's egress proxy blocks devpost.com, univadev.com, YouTube, PubMed and web.archive.org, so no Devpost page was loaded directly. Facts come from three places:
- the organizer's own public website source, `github.com/univadev/univadev.com` (cloned and read; `src/app/univabio/page.tsx` was last changed 2026-09-08);
- WebSearch's index of each Devpost page;
- each winner's cloned GitHub repo.

Every brief in `research/winners/` states its verification method, and no demo video was watched. Anything that rests on a single unverified source is marked ⚠.

## 1. The event, verified

| Fact | Value | Source |
|---|---|---|
| Deadline | **Tue Oct 6 2026, 11:45 PM EDT** (`2026-10-07T03:45:00Z`) | organizer source `DEADLINE_ISO`, and the WebSearch index of univabio.devpost.com |
| Hosts | BioCataalysis + Univa Dev (a nonprofit; its CEO, Eldiiar Bekbolotov, judged Raven Hacks himself) | organizer source, index |
| Eligibility | students, 13+, solo or team | index; aule notes ⚠ |
| Theme | "Artificial Intelligence for Human Health": help people **detect illness earlier, understand it better, or live with it more easily** | organizer source |
| Required | (1) a project with user interaction; (2) a demo video "explaining the purpose, showcasing the features" and user interaction; (3) **a one-page PDF** project description; (4) a GitHub repo or a code PDF | organizer source, lines ~496–501 |
| Judging | "Judges score five things: idea and innovation, implementation, health impact and rigor, design and usability, and presentation." **No weights are published.** | organizer FAQ |
| Criterion detail | *Idea & Innovation*: a real problem in the theme, innovative, meaningfully different from what exists. *Implementation*: does it work, goals achieved, technical challenge. *Health Impact & Rigor*: who it is for, would it actually help them, potential. *Design & Usability*: UX thought, interface quality. *Presentation*: problem clearly defined, **the demo shows it actually working, honest about what's finished vs planned**. | index, and aule notes ⚠ (copied from Devpost) |
| AI tools | "encouraged… Be prepared to walk judges through your own code." | organizer FAQ |
| Judges | **Sudheer Pratap** (Lead Software Engineer), **Aditya Shrivastava** (Barclays); others ⚠ reportedly from Barclays, Fidelity, SAP Labs, AWS, Qen Labs, Altera Digital Health | organizer source line 425; aule ⚠ |
| Prizes | "$35K+". The top three get cash-value placements (⚠ 1st $3,890 / 2nd $1,355 / 3rd $1,100 in cash plus credits). Momen Best No-Code AI App: $2,000. Tin Computer credits: 100 × $299. | organizer source; aule ⚠ |
| Video length | not stated for UnivaBio. The same organizer's Raven Hacks required **2–3 min**, so we target 2:00–3:00, which satisfies both. | Raven Hacks source |

**What the judge panel implies.** The named judges are software engineers, not clinicians. They will reward:
- a demo they can reproduce;
- code they can follow;
- a real model, not a wrapper.

Clinical rigor still has its own criterion, so it can't be faked with vibes. It has to show up as numbers, citations and stated limits.

## 2. Winners studied (7), in `research/winners/`

| Project | Event, prize | Shape | Real model? | Validation shown? |
|---|---|---|---|---|
| [Project SignBridge](winners/project-signbridge.md) | Raven Hacks VTL 2026 (**same organizer**), 1st | webcam ASL → English, in the browser | yes, trained on public WLASL; honest 41% test accuracy published | partial, in the repo |
| [echoOS](winners/echoos.md) | Raven Hacks VTL 2026, 2nd | voice agent for the visually impaired (ElevenLabs) | scripted demo runtime | no |
| [VoiceForge](winners/voiceforge.md) | Raven Hacks VTL 2026, 3rd + Best Use of ElevenLabs | AI speaking coach, solo builder | APIs with mock fallbacks | no |
| [EyeTune](winners/eyetune-hophacks-2025.md) | HopHacks 2025, Best Healthcare Hack (1st) | webcam eye-strain monitor, MediaPipe | thresholds only | no ("TODO: calibrate") |
| [LifeLink](winners/lifelink-medihacks-2024.md) | MediHacks 2024 (largest high-school-led health hackathon), 1st | hardware → local LLM → first responders | local LLM | no |
| [Respira](winners/respira-cac-2025.md) | Congressional App Challenge 2025 CA-50, winner | lung-sound classifier + kids' breathing game | claimed | not public |
| [MeloCognia](winners/melocognia-cac-2025.md) | Congressional App Challenge 2025 IL-16, winner | voice-based early Parkinson's screen | claimed | not public |

Non-placing health entries at Raven Hacks (from the organizer's certificate list): *MediReach* (a triage chatbot) and *Clearpath* (a mental-health resource chatbot) got participation certificates only.

## 3. The pattern

**Problem shape that wins here.** A named condition or a documented clinical gap, felt by a specific person, answered by one sensing loop on hardware everyone already owns (webcam, microphone). SignBridge (1st at this organizer) is the clearest template: an accessibility problem, a real trained model on a public dataset, running in the browser on a plain webcam, with honest metrics in the repo. Generic health chatbots did **not** place.

**Demo shape that wins.** One visible cause → effect in seconds: sign and the words appear; squint and the screen zooms; record a breath and a label comes back. The judge needs to see the thing work, not hear about it.

**Scope ceiling.** Small. EyeTune was about 700 lines and thresholds; echoOS ran six scripted intents; SignBridge was one model plus a UI. In a 2-month online window a solo builder can go further than any of them. The differentiator is doing the one loop *properly*, not adding features.

**What winners consistently skipped, and where we beat them.**
- None published held-out validation with a baseline.
- None had a limitations page.
- Several demos can't be reproduced by a judge (desktop Python, hardware in someone's house).

UnivaBio explicitly scores **Rigor** and "**honesty about finished vs planned**". A cold-link web app with a published, reproducible confusion matrix and a plain LIMITATIONS page is the gap no studied winner filled.

**Visible judge bias.** Software engineers, plus a nonprofit CEO who has personally judged. Expect them to reward:
- a working live demo;
- code they can walk through;
- no API key needed.

A browser tool that works on first load, with its model trained and inferred by our own code, fits them.

**Crowded lanes at *this* event** (11 public competitor repos found):
- medication/label AI (×3)
- lab-report explainers
- symptom triage / care navigation (×3)
- clinical-trial eligibility
- post-discharge tracking (Looplight)
- supply chain
- a generic "second opinion" classifier

**Under-contested:** person-facing, on-device *sensing* with a real model and published validation. No public entrant does audio.

## 4. Rubric we will score against

No weights are published, so the official scoring is **equal weights (20% each)**. As a sensitivity check we also score with this organizer's last published weights (Raven Hacks) mapped onto the UnivaBio criteria:

| Criterion | Official (equal) | Raven-Hacks-mapped |
|---|---|---|
| Idea & Innovation | 20% | 25% (Innovation) |
| Implementation | 20% | 30% (Technical 20 + Feasibility 10) |
| Health Impact & Rigor | 20% | 25% (Real-world impact) |
| Design & Usability | 20% | 10% |
| Presentation | 20% | 10% |

## 5. Implications for the concept

1. Sense something real with the device the judge is holding, and answer in seconds (the wow in the first 15 s).
2. Train our own model on **public** data reachable from this environment (GitHub-hosted datasets). Validate it with a **participant-disjoint** held-out set and **a baseline comparison**, then publish the confusion matrix.
3. Frame the output as a measurement and a nudge ("bring this to your doctor"), never a diagnosis.
4. Pair *detect earlier* with *live with it*: a trend over nights, not a one-off test.
5. Make it private by construction (on-device, nothing uploaded), because the input is intimate.
6. Avoid the crowded lanes above and every sibling / past project in HACKATHON.md.
