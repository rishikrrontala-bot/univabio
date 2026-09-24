# Winner brief — Project SignBridge

**Hackathon:** Raven Hacks VTL, 2026 (Univa Dev; Mar 14–22, 2026; ages 13–18, ~120 participants) · **Prize won:** 1st place ("First Place Winner")
**Submission URL:** https://devpost.com/software/project-signbridge · **Repo:** https://github.com/TheRollerBlader/SignBridge · **Demo video:** unknown (the Devpost page could not be loaded, so neither the URL nor the length is known. Raven Hacks required a 2–3 min YouTube/Vimeo walkthrough.)
**Verified:** page loaded ☐ · prize stated on page ☐ (Devpost page) / ☑ (organizer's own results page) · video played ☐
Method: the egress proxy blocks direct loads of devpost.com and univadev.com, and WebSearch never surfaced this Devpost page. The prize comes from Univa Dev's own website source, cloned from https://github.com/univadev/univadev.com. `src/app/ravenhacks/page.tsx` lists `{ place: "1st place", project: "Project SignBridge", href: "https://devpost.com/software/project-signbridge" }`, and `src/data/ravenhacksvtl-certificates.ts` issues certificate `RHVTL-1ST-SIGNBRIDGE-001`, "First Place Winner", to Krish Bharadiya and Kush Bharadiya. I cloned the repo and read its README, the training report and the frontend pages.

## Pitch, verbatim
> "An AI web app that turns any webcam into a real-time ASL-to-English translator, running in the browser without special hardware."

This is the organizer's one-line description, quoted verbatim from `ravenhacksvtl-certificates.ts`. The team's own Devpost "Inspiration" text could not be read verbatim. *Paraphrase, labelled:* a WebSearch summary with no clear source (it looks like a LinkedIn post, not the Devpost page) says the idea came from the builders' grandfather, who had a hearing impairment. It also says Krish was in 10th grade and Kush in 7th, and that they built it over spring break. Treat that backstory as unverified.

## The wow moment
You sign into an ordinary webcam and English letters or words appear live in the browser, with no app to install and no special hardware. The personal story (a grandfather who couldn't hear) frames the demo.

## Demo teardown
- Length: unknown (video not viewable). `Media/Project Signbridge.mp4` in the repo is only a 5-second, 2880×2880 logo animation, not the demo.
- First 15 seconds show: unknown.
- Narrated? Captioned? Live or recorded? Unknown.
- Real data or hardcoded? **Real models.** The repo ships a TFLite A–Z fingerspelling classifier over 21 MediaPipe hand landmarks (`Models/Fingerspelling`, 36 KB) and a PyTorch BiLSTM/Transformer word-level model trained on the public **WLASL** dataset (`Models/2000_common_word`, 6.5 MB). The repo publishes its own evaluation report. `Training/reports/latest/summary.txt` gives final train acc 76.74%, **best val acc 45.40%**, **checkpoint test acc 41.09%**, plus confusion matrices and per-class accuracy CSVs. The README labels word-level recognition *(experimental)*. MediaPipe runs in the browser, but classification is a `POST /predict` to a FastAPI backend, and speech features need a Gemini API key (the UI has a field for pasting one).

## Scope reality
- Features actually shown working: in-browser MediaPipe hand/pose landmarks; fingerspelling classification through the FastAPI backend; experimental WLASL word classification; Gemini live speech transcription over WebSocket; Gemini TTS narration of signed text. I can't say which of these the video shows.
- Features only described: cross-language interpretation (the README says the transcription pipeline "doubles as" an interpreter). The claim of <300 ms latency comes only from the unsourced WebSearch summary and could not be checked.
- Repo commit window: 14 commits, 2026-03-18 22:11 CDT → 2026-03-22 21:44 CDT, all inside the event window. The last commits are "netlify fixes" and "fixes" about 75 min before the deadline.

## Stack
React 19 + TypeScript + Vite + Tailwind 4 (Netlify) · FastAPI/Uvicorn · MediaPipe Hand/Holistic Landmarker · TFLite (`ai-edge-litert`) · PyTorch (BiLSTM with attention / Transformer) · WLASL dataset · Google Gemini (transcribe, Live, TTS).

## Submission page shape
- Images: unknown (page not loadable).
- Sections present: unknown on Devpost. The product site itself has six pages: Home, Demo, Transcription, **Technology**, **Methodology** (a 5-step engineering guide with hand-drawn SVG diagrams of the landmark-normalisation pipeline, model architecture and confidence thresholding) and **Team**.
- Led with: per the organizer's summary, the promise "any webcam → real-time ASL-to-English, in the browser".

## Why this won (one sentence)
A human, accessibility-first problem with a family story behind it, solved with a real trained model on a public dataset and shown working on a plain webcam. It scores at the top of Innovation (25%) and Real-World Impact (25%) while still carrying Technical weight (20%).

## Transferable to us
- **Univa Dev judges reward "real ML on a public dataset, running on a normal device".** Our health tool should run an actual on-device model or algorithm that a judge can try with their own webcam or mic. A chatbot won't do it.
- **Publish the honest metric.** SignBridge committed its 41% test accuracy and labelled the weak part "experimental". UnivaBio's rubric explicitly scores "Health Impact & **Rigor**", so a validation section with real numbers is a direct scoring lever.
- **A Methodology page with diagrams** turns the "walk judges through your own code" requirement into a strength. We should ship the same thing (`docs/EXPLAIN-IT.md` plus an in-app "How it works").
- **Personal "why" in the first seconds.** Open the video on the person the tool is for.
- Avoid its weak spot: the in-browser promise leaned on a backend and a pasted API key. Ours should be fully static and on-device so a cold judge visit always works.
