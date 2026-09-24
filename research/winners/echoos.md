# Winner brief — echoOS

**Hackathon:** Raven Hacks VTL, 2026 (Univa Dev; Mar 14–22, 2026) · **Prize won:** 2nd place ("Second Place Winner")
**Submission URL:** https://devpost.com/software/echoos · **Repo:** https://github.com/v1shay/echo-OS · **Demo video:** unknown (URL and length not retrievable. Raven Hacks required a 2–3 min video.)
**Verified:** page loaded ☐ · prize stated on page ☑ · video played ☐
Method: direct loads of devpost.com are blocked by the egress proxy. WebSearch's index of devpost.com/software/echoos reports that it "was submitted to Raven Hacks VTL and won Second Place" and lists its Built With tags. Univa Dev's own site source (github.com/univadev/univadev.com, `src/app/ravenhacks/page.tsx` plus certificate `RHVTL-2ND-ECHOOS-001`) independently lists echoOS as 2nd place, with team Vishwesh Chinthukumar, Vishay Agarwal and Rushil Agrawal. I cloned the repo and read its code.

## Pitch, verbatim
> "a fully autonomous and conversing AI Agent for the visually impaired, built with ElevenLabs STT and TTS"

This is the Devpost tagline as quoted by the WebSearch index. I could not confirm it character-for-character. *Inspiration, paraphrased from the index:* one teammate had his arm in a sling and found online schoolwork frustrating without a keyboard and mouse, so the team built a way to control the whole computer by voice ("open the notes app", "scroll down", "open file.png").

## The wow moment
You say a sentence and the computer does it. Spotify starts a matching playlist, a Gmail draft to a teacher opens, a text message goes out, files get organised, and a voice answers back. Nobody touches a keyboard.

## Demo teardown
- Length: unknown (video not viewable).
- First 15 seconds show: unknown.
- Narrated? Captioned? Live or recorded? Unknown. The product's voice replies come from ElevenLabs TTS.
- Real data or hardcoded? **Scripted.** The server that shipped (`backend/app/server.py`, unchanged since the only code commit) wires up `HardcodedDemoRuntime` (`backend/app/demo/runtime.py`). That runtime matches the utterance against **six hard-coded intents**: `hello`, `play_happy`, `pause_happy`, `email_teacher`, `text_vishwesh` and `organize_files`. It then performs real macOS actions through AppleScript (`osascript` controlling Spotify, Messages and Chrome; a Gmail compose URL addressed to a teammate). Any other request gets "Is there anything else I can help you with?" A LangGraph agent, a tool registry and Chroma memory exist in `backend/app/agent/` but are not wired into the server. The frontend also ships scripted `demoScenarios` (`frontend/src/demoData.ts`).

## Scope reality
- Features actually shown working: wake word and speech-to-text (Vosk model bundled; Whisper/ElevenLabs per README) → intent match → real AppleScript execution for the six scripted intents → ElevenLabs TTS reply, with a React UI showing a live transcript and execution timeline over WebSockets.
- Features only described: a "continuous autonomous agent loop" across any task, persistent memory, and general tool use across desktop and web. The code exists, but the shipped server doesn't reach it.
- Repo commit window: all code landed in **one commit**, "Add Echo OS autonomous monorepo", at 2026-03-22 23:22 PDT (02:22 EDT on Mar 23, about 2.4 h after the 11:59 PM ET deadline stated on univadev.com). The hackathon README followed on Mar 26, with README edits, a license and a `memory-harness.rs` in Apr–Jul. The README now calls it "winner of an ElevenLabs, FeatherlessAI, and AoPS-backed hackathon".

## Stack
Per the Devpost Built With list (via the WebSearch index): chromadb, electron, elevenlabs, fastapi, google, langgraph, macos-automation (applescript), openai-apis, playwright, python, react, tailwind-css, twilio, typescript, vite, vosk, websockets. The code matches this list.

## Submission page shape
- Images: unknown. The GitHub README leads with one large demo GIF or screenshot.
- Sections present: standard Devpost story sections. Inspiration, What it does, the challenges (reliability of the listen → act → verify → recover loop, wake-word tuning, macOS permissions, browser-automation timing) and per-teammate contributions were all visible in the index.
- Led with: the accessibility framing ("for the visually impaired") and the sponsor tool (ElevenLabs).

## Why this won (one sentence)
A visceral live demo (talk and the computer obeys) framed as accessibility, built on the event's headline sponsor (ElevenLabs). That lands on Innovation, Impact and Presentation even though only a scripted slice actually runs.

## Transferable to us
- **This network's judges score the video and the page more than the repo.** A scripted 6-intent demo placed 2nd, so a tight, rehearsed demo path matters a lot. Our bar is higher: the demo path must be *real*, and LIMITATIONS must say plainly what is out of scope (UnivaBio's Presentation criterion reportedly rewards "honesty about finished vs planned").
- **Frame the tool around a person with a named constraint** (arm in a sling, visual impairment) and show them using it end to end.
- **Use sponsor tech where it genuinely fits.** At Raven Hacks, ElevenLabs was the sponsor and both the 2nd- and 3rd-place projects were built on it. At UnivaBio the analogues are Momen (a separate "Best No-code AI App" prize) and possibly MeDo, DevSwarm and Protoflow (sponsor list unconfirmed).
- **Show agency, not chat.** The tool *does* something visible in the real world, which reads as far more impressive than a Q&A box.
