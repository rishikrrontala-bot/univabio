# CONCEPT: Hark

**Event:** UnivaBio 2026 ("AI for Human Health") · **Lane:** person-facing, private, on-device; *live with it* + *detect earlier* · **Claimed:** Wed Sep 23 2026, 23:12 EDT

**One line:** *A private night-cough counter.* Leave your phone on the nightstand; Hark counts every cough on-device, never records or uploads a sound, and gives you a morning report your doctor can read.

**The problem:** how much someone coughs at night is exactly what a doctor asks about in asthma, COPD, chronic cough and a child's lingering cold. Patients and parents answer from memory. Objective cough frequency is the endpoint clinicians trust: it is the primary endpoint of phase-3 chronic-cough trials (McGarvey et al., *Lancet* 2022). But measuring it takes a dedicated ambulatory monitor. Chronic cough alone affects about 9.6% of adults (Song et al., *ERJ* 2015).

**The user:** someone living with a cough-heavy condition, or the parent of a child with one, who wants a real number to bring to an appointment. This is a persona, not a real user.

**What it does**
1. **Listen, on-device.** The phone's microphone is analysed in 1-second windows by a compact CNN on log-mel spectrograms, using hand-written TypeScript inference. Audio stays in RAM for about 1 s and is then discarded. No network calls.
2. **Count.** It detects cough events, groups them into bursts (epochs), and keeps only timestamps and confidences.
3. **Report.** In the morning: total coughs, coughs per hour, the hourly histogram, the busiest hour, bursts, and a comparison with your own previous nights. The report is printable/PDF, with a plain "what this is / isn't" box.
4. **Trend.** Across nights it compares against a personal baseline. It flags a sustained rise ("bring this to your care team") and never diagnoses.

**Wow moment (first 15 s of the video):** someone coughs at a laptop, and a marker drops onto a live strip chart ("cough · 0.97"). They talk, laugh and clap, and nothing fires. Cut to the morning report of a full night.

**AI + rigor:**
- **Data:** our own model, trained on the public **Coswara** dataset (cough vs. the same participants' breathing, counting and vowels) plus **ESC-50** environmental sounds.
- **Validation:** a participant-disjoint held-out split, reporting sensitivity, specificity, PPV and ROC-AUC. Synthetic whole nights are used to measure event recall and false alarms per hour.
- **Baseline:** Google's YAMNet "Cough" class on the same data.
- **Reproducibility:** every number can be re-run from `ml/` in this repo.

**Named prior art:** Leicester Cough Monitor, VitaloJAK, and Hyfe (app and wearable). We differ on four points:
- zero install, in any browser;
- audio never stored or sent;
- validation that is open and reproducible;
- a report built for the appointment.

**Stack:** Vite + TypeScript, AudioWorklet → log-mel → CNN in a Web Worker, Canvas strip chart, Vitest (including a Python↔TS parity test) + Playwright, and the PyTorch training pipeline in `ml/`. Deploys to GitHub Pages. No backend, no key, no tracking.

Full scoring is in `research/CONCEPTS.md`: A 4.60 · B 3.60 · C 3.80 with equal weights, and A 4.65 · B 3.50 · C 3.75 with the organizer's previously published weights.
