# Winner brief — LifeLink

**Hackathon:** MediHacks 2024, presented by the Laerdal Million Lives Fund ("the largest high school led hackathon for innovating technology in health"; virtual, ~7 days, July 2024) · **Prize won:** First Place (index-reported prize: $1,000 cash + $750 Laerdal bonus, plus software perks). Built for the Laerdal Prize Track, Option #3.
**Submission URL:** https://devpost.com/software/lifelink-24fd3g · **Repo:** https://github.com/ericli3690/lifelink · **Demo video:** https://www.youtube.com/watch?v=rm-jQnrakIM (length unknown; YouTube is blocked from this VM)
**Verified:** page loaded ☐ · prize stated on page ☑ · video played ☐
Method: the Devpost page was read only through the WebSearch index (direct load blocked by the egress proxy), which returned "LifeLink won First Place at MediHacks 2024: Presented by the Laerdal Million Lives Fund" for this page. The repo description ("1st place at MediHacks 2024") and README ("First Place Winner of MediHacks 2024") state the same. The repo was cloned and its README, server code and commit history read. Caveat: this is about 26 months old, slightly outside the ≤24-month window. It is kept because it is the top prize at the largest *high-school-led* health hackathon.

## Pitch, verbatim
> "When an emergency breaks out, a first responder getting to the scene before professional help arrives can be the difference between life and death. This is the challenge posed by Laerdal Prize Track, Option #3: can a technological system be devised that notifies nearby trained first responders when an emergency happens, beckoning them over to help?"

(Verbatim from the repo README's "Inspiration 💡" section, which mirrors Devpost's section headings; not confirmed character-for-character against the Devpost page.)

## The wow moment
A physical button box (Arduino + ESP32 + camera) in a "village" is pressed, and seconds later a phone app lights up with the location, a face-detected photo and an AI-written assessment of the situation. It is hardware → local AI → phone notification, end to end. (Inferred from the README's five-step story; the video was not played, so no timestamp.)

## Demo teardown
- Length: unknown
- First 15 seconds show: unknown
- Narrated? Captioned? Live or recorded? Recorded YouTube video (virtual event); other details unknown.
- Real data or hardcoded? Mixed. The hardware and server are real: OpenCV Haar-cascade face detection and colour correction, and a locally hosted **Synthia-7B (Q2_K GGUF via llama.cpp/LangChain)** that turns a symptom list into "the most likely diagnosis … in one sentence". Firestore gives real-time sync, and the Expo Android build is public. But the README admits the app is "optimized for testing in Calgary, Alberta" ("No emergencies will show up in any other places"), and the hardware and middle-end cannot be demoed by judges ("physical components in Gautham's house").

## Scope reality
- Features actually shown working: one hardware unit (they built only one), Flask middle-end with face detection plus the LLM "diagnosis", React Native app with Google Maps location, notifications, and first-responder ↔ dispatcher chat on Firestore.
- Features only described: mass-produced village network, microphone/speech input, a better camera and sensors, an in-app AI chatbot, scale to "third-world countries".
- Repo commit window: 44 commits, 2024-07-08 → 2024-07-14 (5 / 5 / 11 / 11 / 4 / 4 / 3 per day), then one README update on 2024-08-22. It was built inside the event week.

## Stack
Arduino, ESP32 (HTTP), I2C display · Python Flask, OpenCV (Haar cascades), LangChain + llama.cpp running Synthia-7B locally, Firebase Admin / Cloud Firestore · React Native (Expo), TailwindCSS/NativeWind, Google Maps API, Nominatim reverse geocoding. "Hosting the LLM locally rather than using the OpenAI API" is called out as a proud accomplishment, so local AI *was* part of the story.

## Submission page shape
- Images: unknown count (not retrievable)
- Sections present (README mirrors them): Inspiration → a narrative "Imagine a rural village…" walkthrough in numbered Steps One to Five → How we built it (Hardware / Middle-End / Mobile App) → Challenges (a first-person line per teammate) → Accomplishments → What we learned → Future improvements. Emoji-heavy headers.
- Led with: the sponsor's exact prize-track prompt ("Laerdal Prize Track, Option #3"), then a reframing to an underserved population (low-income regions where many people have no phone).

## Why this won (one sentence)
It answered the title sponsor's own challenge prompt word for word, then widened the impact with an equity reframing (people without phones) and proved it with a working hardware → local-LLM → phone loop, which reads as far more "real" than an app-only entry.

## Transferable to us
- **Copy:** map the submission explicitly onto the organiser's stated prompt. For UnivaBio that means naming which of "detect earlier / understand better / live with it more easily" we serve, in those words, in the first two sentences.
- **Copy:** the equity reframing (who is *left out* of current care) raises perceived Health Impact cheaply and honestly.
- **Copy:** the numbered "Step 1 → Step 5" user story is an easy structure for judges to scan.
- **Don't copy:** an LLM prompted to output "the most likely diagnosis" with no guardrails, no evaluation and no limitations. UnivaBio explicitly scores rigour, and we never claim to diagnose.
- **Don't copy:** a demo judges can't reproduce ("works only in Calgary", "hardware is in Gautham's house"). Our demo must run from a cold link.
- **Don't copy:** the emoji section headers (banned by our design rules anyway).
