# Winner brief — EyeTune

**Hackathon:** HopHacks Fall 2025 (Johns Hopkins, Sep 12–14 2025, 36 h, in person, college students; ~300 participants, 102 projects per JHU CS news) · **Prize won:** Healthcare Track: Best Healthcare Hack by Commure (1st place)
**Submission URL:** https://devpost.com/software/eyetune · **Repo:** https://github.com/SunethRamawickrama/EyeTune · **Demo video:** unknown (not surfaced by the search index; page could not be loaded directly)
**Verified:** page loaded ☐ · prize stated on page ☑ · video played ☐
Method: devpost.com is blocked by the egress proxy, so the Devpost page was read only through the WebSearch index, which returned the prize line "Healthcare Track: Best Healthcare Hack by Commure" for this page. The team's README independently states "HopHacks 2025 - Healthcare Track: Best Healthcare Hack by Commure, 1st place" and links the Devpost page. The repo was cloned and its code and commit history read. The event's own prize listing (via index) gives the Healthcare track 1st place as 4× Apple Watch SE.

## Pitch, verbatim
> Not retrievable verbatim (page load blocked). **Paraphrase of their Inspiration section, as returned by the search index:** students and professionals spend hours in front of screens, so Computer Vision Syndrome (eye strain, dryness, blurred vision, headaches) is increasingly common. They wanted something that *actively* protects the eyes in real time by controlling display settings from the webcam and the room's lighting.

Repo README opening line (verbatim): "EyeTune is a computer vision application that monitors eye health and screen usage patterns using real-time facial landmark detection."

## The wow moment
The screen responds to your body without you touching anything: squint and the display zooms in; lean too close and you get a distance warning; the room goes dark and the colour temperature shifts. It is a closed loop from the webcam to the OS display settings, so a judge sees cause → effect in seconds. (Inferred from the feature list and code; video not viewed, so no timestamp.)

## Demo teardown
- Length: unknown
- First 15 seconds show: unknown (video not located)
- Narrated? Captioned? Live or recorded? unknown. At an in-person 36 h event the judging was almost certainly a live table demo on a laptop webcam (an inference from the format, not verified).
- Real data or hardcoded? Real. Live webcam frames go through MediaPipe Face Landmarker (478 landmarks incl. iris). Everything else is deterministic signal processing: Eye Aspect Ratio (6 landmarks per eye; blink below 0.20, zoom-in below 0.23, zoom-out above 0.28), blink debounce with a 0.27 s refractory period, blinks-per-minute from a rolling history, distance from iris width (`1.17 cm × 600 px focal / iris_px`, with a "TODO: calibrate" on the focal length), ambient light from Rec.709 luminance with hysteresis. No trained model of their own and no cloud call.

## Scope reality
- Features shown working (per Devpost via index + code present): blink detection and rate, squint → auto zoom, iris-based distance estimate (close / medium / far), gaze direction (left / right / centre) and look-away timer, ambient-light → colour-temperature change, desktop notifications, all cross-platform (Windows / macOS / Linux screen control).
- Features only described: the Devpost "time of day" tint and "screen break alerts" are thin wrappers over the same trackers. There is no validation of any threshold against clinical data, and the focal length is uncalibrated (a hardcoded 600 px).
- Repo commit window: 22 commits. First commit 2025-09-13 22:41 ET (inside the event), core features 09-14 03:40–08:15 ET, then a post-event refactor on 09-18/19 and a "link to devpost" commit on 2026-02-17. About 711 lines of Python in `src/`. The winning build was roughly one night of work.

## Stack
Python, OpenCV, MediaPipe Face Landmarker (`.task` model, on-device), OS-level screen and colour control, desktop notifier. The stack is not the story; the *on-device, no-upload* webcam loop is implicit rather than marketed.

## Submission page shape
- Images: unknown count (not retrievable)
- Sections present (per index): Inspiration, What it does (a bulleted feature list: Automated Screen Scaling, Dynamic Color & Brightness Adjustment, Blink & Eye Tracking, Distance Monitoring, Look-Away Reminders / Screen Break Alerts), How we built it, Challenges (lighting and camera variance, cross-OS display APIs, real-time performance without draining the machine, solved with concurrent I/O), Accomplishments, What's next.
- Led with: a named, recognisable condition (Computer Vision Syndrome) that every judge has personally felt.

## Why this won (one sentence)
A universally relatable symptom (screen eye strain) and a live, physical cause → effect demo on hardware every judge already has, built with cheap deterministic landmark math instead of an unproven model.

## Transferable to us
- **Copy:** name the condition in plain clinical language up front (CVS), and make the camera → feedback loop visible within seconds. Webcam + MediaPipe landmarks + explainable formulas (EAR, iris-width distance) is a credible "Implementation" story for a solo builder, and it runs entirely on-device, which we can *say out loud* as a privacy feature (EyeTune did not market this).
- **Copy:** their Challenges section is concrete (lighting variance, cross-OS APIs). Judges read that as rigour.
- **Do better:** EyeTune shipped hardcoded thresholds and an uncalibrated focal length, with no validation or limits section. UnivaBio scores "Health Impact & Rigor", so we should calibrate (e.g. a credit-card-width calibration step), cite where each threshold comes from, report measured error on our own recordings, and state plainly that it is a wellness aid, not a diagnostic.
- **Do better:** it is a desktop Python app that judges cannot run from a link. We ship a static web app that runs in a cold browser.
- **Don't copy:** the vague "time of day" and "break alert" feature padding. One sharp loop beats five thin ones.
