# Winner brief — Respira

**Hackathon:** Congressional App Challenge 2025 (US House district-level competition for middle and high school students; not a Devpost event), California's 50th District (Rep. Scott Peters) · **Prize won:** District winner, stated as "Respira wins Rep. Scott Peters' 2025 Congressional App Challenge in California's 50th District". Built by Kayley Xu (The Bishop's School, La Jolla); invited to present in Washington, D.C.; app displayed at the U.S. Capitol.
**Submission URL:** https://www.congressionalappchallenge.us/25-ca50/ (plus Rep. Peters' coverage: https://scottpeters.house.gov/2026/2/bishop-s-school-student-s-award-winning-app-aims-to-breathe-fresh-life-into-respiratory-diagnostics) · **Repo:** none found (a GitHub search for "Respira crackle wheeze" turned up nothing by this author) · **Demo video:** unknown (not surfaced by the search index; direct load blocked)
**Verified:** page loaded ☐ · prize stated on page ☑ · video played ☐
Method: both congressionalappchallenge.us and house.gov are blocked by the egress proxy (curl returns 000), so the official CAC winner page and Rep. Peters' press pages were read through the WebSearch index only. The prize wording above is the CAC page's own title. No code was inspected, so the implementation claims below are the organiser's and press descriptions, not verified builds.

## Pitch, verbatim
> "Respira is a comprehensive respiratory health platform that combines respiratory sound diagnostic analysis with therapeutic breathing exercises to make respiratory care more accurate, engaging, and accessible."

(Text returned repeatedly by the search index for the CAC page and the press release; very likely verbatim, but not confirmed by a direct page load.)

## The wow moment
Upload a breathing recording and get one of four labels (normal / crackle / wheeze / crackle + wheeze), framed against a real clinical pain point: clinicians *disagree* when listening with a stethoscope. The press coverage says the WHO does not even recommend auscultation for frontline pneumonia diagnosis because of inter-observer variability. The second beat is a breathing-exercise *game* for children. (From the descriptions; the video was not viewed.)

## Demo teardown
- Length: unknown
- First 15 seconds show: unknown
- Narrated? Captioned? Live or recorded? Recorded submission video presumed (CAC is judged remotely by district panels). Not verified.
- Real data or hardcoded? Unknown from what could be read. The four-class label set (normal / crackle / wheeze / both) matches the public ICBHI 2017 respiratory sound benchmark's labels, which suggests a model trained on public auscultation data. **This is an inference; no dataset or accuracy figure was found in any source.**

## Scope reality
- Features described: AI classification of uploaded breathing recordings into 4 classes; a therapeutic breathing-exercise game aimed at children, born from her own pneumonia recovery exercises.
- Features only described vs. working: cannot be separated without the video or code.
- Repo commit window: no public repo found.
- Context that matters: the same student had earlier won awards for a wearable stethoscope (1st place, Computational Systems: Medical, California Science & Engineering Fair; Second Grand Award at Regeneron ISEF, per local press via the index). Respira sits on months of prior domain work, not a weekend.

## Stack
Not stated in the sources retrieved.

## Submission page shape
- Images: unknown
- Sections present (per index): app description, inspiration story, the four-class output, the breathing game, the Latin root of the name ("respirare", to breathe again).
- Led with: **a personal origin story.** She had severe pneumonia at 13, was hospitalised for a week on oxygen, and different clinicians listening to her lungs reached different conclusions. That story sets up the *clinical* problem (subjective auscultation) and not just a tech demo.

## Why this won (one sentence)
A first-person patient story that exposes a specific, citable clinical weakness (inter-observer variability in lung auscultation), answered by a narrow, well-defined classifier plus a "living with it" companion (a rehab breathing game for kids).

## Transferable to us
- **Copy:** anchor the problem in a *documented clinical gap* with a citation (here, WHO guidance and inter-observer variability), not in "AI is cool". That is exactly what UnivaBio's "Health Impact & Rigor" rewards.
- **Copy:** pair *detect* with *live with it*. Respira covers two of UnivaBio's three verbs (detect earlier, live with it more easily) in one coherent product.
- **Copy:** a small closed label set (4 classes) is easier to validate, explain and present honestly than an open-ended "AI diagnosis".
- **Adapt, don't fake:** Rishik must not invent an origin story. If there's no genuine personal connection, lead with the clinical gap and a real public dataset instead.
- **Unknown, so don't assume:** we couldn't see her metrics or disclaimers. Our own entry should publish a confusion matrix on a held-out public dataset and a plain "screening aid, not a diagnosis" line.
