# Concepts: three scored, one picked

*Sep 23 2026, 23:10 EDT, about 312.6 h left. The rubric is from `research/RESEARCH-BRIEF.md` §4. Scores run 1–5.*

**Constraints every concept must satisfy**
- Person-facing: detect earlier, or live with it.
- Private and on-device, with no API key.
- Validation possible on **public data reachable from this build VM** (GitHub, PyPI, npm, googleapis; Devpost, Hugging Face, PhysioNet and Kaggle are blocked).
- No overlap with siblings or past projects. At the time of scoring only *Low Sun* (sun glare) was claimed. Past projects that are close: Baseline (webcam concussion), LARMOR (MRI), Breathing Room (anxiety).
- No overlap with the crowded competitor lanes found at this event (medication AI, lab reports, triage chat, care navigation).

---

## A · **Hark**: a private night-cough counter

**Pitch.** Leave your phone on the nightstand. Hark counts every cough on-device, never records or uploads a sound, and hands you a morning report your doctor can read.

**Why it matters (cited).**
- Chronic cough affects about **9.6%** of adults worldwide (Song et al., *Eur Respir J* 2015, 45:1479).
- Objective 24-h cough frequency is the **primary endpoint** in phase-3 chronic-cough drug trials (McGarvey et al., COUGH-1/COUGH-2, *Lancet* 2022).
- Measuring it today takes a dedicated ambulatory monitor, e.g. the Leicester Cough Monitor (Birring et al., *Eur Respir J* 2008) or Hyfe (a multicenter validation in *Sci Rep* 2025: 90.4% sensitivity, 1.03 false positives/h).
- Patients and parents otherwise report night cough from memory, which is unreliable.
- Rising cough is being studied as an early warning of COPD worsening (ClinicalTrials.gov NCT07212439).

**What the judge does.** Opens the link and allows the mic. They cough, and a marker drops on a live strip chart with the model's confidence. Their own speech, a clap and a laugh don't trigger it. Then they open the morning report from a full night built from public recordings (clearly labelled as such): cough count, coughs per hour, bursts, the 3 a.m. peak, and a trend against personal baseline.

**AI.** A compact CNN on log-mel spectrograms that we train ourselves on the **Coswara** dataset: 2,600+ participants whose cough, breathing, counting and vowel recordings serve as positives and hard negatives. We add **ESC-50** environmental sounds as negatives. The model is exported to hand-written TypeScript inference, and parity tests check it against the Python reference.

**Validation.** On a *participant-disjoint* held-out split we report sensitivity, specificity, PPV and ROC-AUC. On synthetic nights (held-out coughs mixed into long ambient noise) we report event-level recall and false alarms per hour. The baseline is Google's YAMNet "Cough" class on the same set. Every number is reproducible with one script.

**Riskiest unknown.** How well phone-at-bedside audio (distance, room noise) matches Coswara's close-mic recordings. Mitigation: augmentation (distance/reverb simulation, noise mixing), plus an honest LIMITATIONS entry.

**Cut first if short on time:** the multi-night trend alert and the PDF export (the on-screen report stays).

## B · **Quiet Test**: a calibration-free digits-in-noise hearing screen

**Pitch.** A 3-minute hearing screen that works on any headphones, because it measures the signal-to-noise ratio at which you understand digits, not loudness. It follows the WHO hearWHO / Smits et al. 2004 digits-in-noise method, with an antiphasic variant (De Sousa et al. 2020).

**Health.** WHO estimates about 1.5 billion people live with hearing loss, and more than 1 billion young people are at risk from unsafe listening.

**AI / rigor gap.** The adaptive staircase is statistics, not a learned model. Our digit recordings (Free Spoken Digit Dataset, 8 kHz amateur speakers) are **not normed**, so no honest pass/refer cutoff exists without testing listeners, which we can't do. The only validation available is a simulated-listener precision check.

**Riskiest unknown:** a pass/refer cutoff without normative data. **Cut first:** the antiphasic mode.

## C · **Ten Past Eleven**: a digital Mini-Cog clock-drawing screen

**Pitch.** Draw a clock on your phone. On-device handwriting recognition reads every numeral, geometry checks placement and whether the hands point to 11 and 2, and the drawing is scored by the published Mini-Cog rules (Borson et al. 2000) for a caregiver to bring to a clinician.

**Health.** About 62% of dementia is undetected in primary care (Lang et al., *BMJ Open* 2017), and early detection now matters for newly approved early-Alzheimer's treatments.

**AI / rigor gap.** A digit CNN (EMNIST, from googleapis) runs into domain shift with trackpad strokes. **No public, reachable clock-drawing dataset with clinician scores** exists (the NHATS images need registration), so validation would be synthetic clocks only. Self-screening for dementia is also ethically delicate. The concept sits next to Baseline, Rishik's neuro screener.

**Riskiest unknown:** the scoring accuracy on real drawings is unknowable. **Cut first:** the 3-word recall step.

---

## Scoring

| Criterion | A · Hark | B · Quiet Test | C · Ten Past Eleven |
|---|---|---|---|
| Idea & Innovation | **4**: prior art exists (LCM, VitaloJAK, Hyfe) but none is zero-install in the browser with open validation and never-stored audio; no entrant here does audio | 3: hearWHO already does exactly this | 4: DCTclock is commercial; a free, explainable web version is fresh |
| Implementation | **5**: our own trained model, our own TS inference with parity tests, live mic pipeline, works on a judge's laptop | 4: clean DSP + staircase, no learned model | 4: CNN + geometric scorer; mouse drawing is awkward |
| Health Impact & Rigor | **5**: the measure is a trial endpoint; real public data; participant-disjoint validation + baseline | 3: validated method but un-normed stimuli, so no honest cutoff | 3: synthetic-only validation; ethically delicate |
| Design & Usability | **4**: bedside night mode + morning report; a strong, concept-derived art direction | 4 | 4 |
| Presentation | **5**: "cough → marker" is a 3-second wow a judge can reproduce | 4: needs headphones | 4: drawing on a trackpad is slow on video |
| **Equal weights (official)** | **4.60** | 3.60 | 3.80 |
| Raven-Hacks-mapped (25/30/25/10/10) | **4.65** | 3.50 | 3.75 |

Worked sums, mapped weights:
- **A** = 0.25·4 + 0.30·5 + 0.25·5 + 0.10·4 + 0.10·5 = **4.65**
- **B** = 0.25·3 + 0.30·4 + 0.25·3 + 0.10·4 + 0.10·4 = **3.50**
- **C** = 0.25·4 + 0.30·4 + 0.25·3 + 0.10·4 + 0.10·4 = **3.75**

## Pick: **A · Hark**

It wins under both weightings by about 0.8–1.1 points, and it is the only concept where all four of the following hold at once:
- the judge can reproduce the wow themselves in seconds;
- the model is trained by us on real public data;
- validation is honest and participant-disjoint, with a baseline;
- the clinical grounding is a measure clinicians already trust (cough frequency as a trial endpoint).

It also matches the shape that took 1st at this organizer's last event (SignBridge: a real model on a public dataset, running in the browser on everyday hardware), and it avoids every crowded lane at this event.

**Pre-mortem ("we lost; why?"), with the fix for each:**

| Risk | Fix |
|---|---|
| "Cough apps exist" | Name the prior art and differentiate on zero install, audio that never leaves the device, open validation, and a doctor-ready report |
| False positives from speech or laughter in the live demo | Train on Coswara counting/vowel/breathing as hard negatives; tune the threshold for precision; show the rejection live in the video |
| A cold judge visit fails without a mic | A built-in demo night and a "play sample sounds" path that runs the same model on bundled public clips |
| The video is weak | Scripted and captioned, with the wow in the first 5 s |
