# Winner brief — MeloCognia

**Hackathon:** Congressional App Challenge 2025 (US House district-level competition for middle and high school students; not a Devpost event), Illinois' 16th District (Rep. Darin LaHood) · **Prize won:** District winner, stated as "Rep. Darin LaHood has named Kavi Praanesh of Dunlap High School as the winner of the 2025 Congressional App Challenge in Illinois's 16th District" (the runner-up was a separate app, FENIX)
**Submission URL:** https://lahood.house.gov/2025/12/lahood-announces-winner-and-runner-up-of-the-2025-congressional-app-challenge (press release; syndicated at https://977wmoi.com/2026/01/lahood-announces-winner-and-runner-up-of-the-2025-congressional-app-challenge/). The CAC winner page for IL-16 2025 was not surfaced by the index. · **Repo:** none found (a GitHub search for "MeloCognia" returns 0 results) · **Demo video:** unknown
**Verified:** page loaded ☐ · prize stated on page ☑ · video played ☐
Method: house.gov is blocked by the egress proxy (curl returns 000), so the congressman's press release and its radio-station syndication were read through the WebSearch index. Both state the win. No code or video was inspected; every implementation detail below is the press release's description only.

## Pitch, verbatim
> Not retrievable verbatim from the app's own page. **Press-release wording as returned by the index:** "MeloCognia is an AI powered health assistant designed to help detect Parkinson's in its early stages." It "uses voice analysis and symptom tracking to provide fast, accessible early screening, giving users a quick insight in minutes that encourages them to seek medical evaluation sooner."

## The wow moment
Speak into your phone or laptop and get a Parkinson's-risk signal within minutes, from a symptom (voice change) that appears early and that people don't connect to Parkinson's. (Inferred from the description; the video was not viewed.)

## Demo teardown
- Length: unknown
- First 15 seconds show: unknown
- Narrated? Captioned? Live or recorded? unknown (CAC is judged remotely)
- Real data or hardcoded? Unknown. The press release lists "Python and C/C++" as the languages. Voice-based Parkinson's screening at student level commonly uses public sustained-phonation datasets (e.g. UCI Oxford Parkinson's voice features), but **no dataset, model or accuracy was stated in any source found; do not cite one.**

## Scope reality
- Features described: voice analysis for early Parkinson's screening; symptom tracking; a result "in minutes" that nudges the user towards medical evaluation.
- Features only described vs. working: cannot be separated without the video or code.
- Repo commit window: no public repo found.

## Stack
Python and C/C++ (per the press release). Nothing else stated.

## Submission page shape
- Images: unknown
- Sections present (per press release): problem, what the app does, inspiration.
- Led with: **a family story.** Her grandfather wasn't diagnosed until Parkinson's had already heavily affected his daily life and his treatment options were limited, and that is what showed her how hard early detection is.

## Why this won (one sentence)
A clear "detect earlier" promise on a condition where a late diagnosis visibly costs quality of life, told through a family story, with the output framed carefully as a prompt to "seek medical evaluation sooner" rather than as a diagnosis.

## Transferable to us
- **Copy the framing, exactly:** the output is a *nudge to see a clinician sooner*, not a verdict. That wording scores well on responsibility and lines up with our rule never to claim a diagnosis.
- **Copy:** pair a passive or low-effort sensor (voice) with longitudinal *symptom tracking*. Change over time is more meaningful than a single score, and it covers both "detect earlier" and "live with it".
- **Note the pattern:** two of the four verified same-domain winners (MeloCognia, Respira) use **audio from a commodity microphone** to screen. It's a proven, judge-legible modality that needs no special hardware. It is also crowded, so a UnivaBio entry on audio needs a sharper angle (on-device, transparent features, a validated metric).
- **Don't assume:** we saw no evidence of validation here. Our edge over this class of winner is publishing a reproducible evaluation plus a LIMITATIONS page.
