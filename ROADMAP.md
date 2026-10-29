# Project Roadmap: German Christmas Carols Collection & Interactive Web Player

This document outlines the execution roadmap for the **German Christmas Carols Collection & Interactive Web Player** project.

---

## Progress Overview

| Phase | Description | Status |
| :--- | :--- | :--- |
| **Phase 1** | Repository Architecture & Documentation Infrastructure | ✅ Completed |
| **Phase 2** | Build Pipeline & Asset Generation Toolchain | ✅ Completed |
| **Phase 3** | LilyPond Master Score Corpus (25 Carols) | ✅ Completed |
| **Phase 4** | Interactive Web Application (abcjs Web Player) | ✅ Completed |
| **Phase 5** | Test Harness & Visual Verification Suite | ✅ Completed |
| **Phase 6** | CI/CD Integration & GitHub Pages Deployment | ✅ Completed |

---

## Goals

- [x] 🎼 **Single Primary Master Source**: Store all sheet music scores and lyrics in LilyPond (`.ly`) master files within `src/songs/`. ✅
- [x] ⚙️ **Automated Compilation Pipeline**: Automatically derive sheet music PDF, ABC notation, and SoundFont acoustic piano MP3 audio files during build. ✅
- [x] 📝 **Pure Text Lyrics Collection**: Automatically extract pure text Markdown (`.md`) lyrics for GitHub Pages and compile standalone text-only lyrics PDFs. ✅
- [x] 🌐 **Interactive Web Player**: Provide an accessible GitHub Pages web app with `abcjs` dynamic rendering, pure text lyrics reader, and Web Audio playback for 25 German Christmas carols. ✅
- [x] 🧪 **Automated Testing & Visual Verification**: End-to-end browser testing with Playwright visual screenshots and notation validation. ✅

---

## Phases & Detailed Task Tracking

### Phase 1: Repository Architecture & Documentation Infrastructure
Establish repository structure, core documentation specifications, and basic tooling configuration.

- [x] **Task 1.1: Core Documentation Specifications** ✅
  - [x] Create `CONCEPT.md` with business cases and architecture decisions.
  - [x] Create `DESIGN.md` with technical architecture specs and technological choices.
  - [x] Create `TOP_ARCHITECTURE.puml` diagram.
  - [x] Create `TECHNICAL_DEBTS.md` tracking initial debts.
  - [x] Update `README.md` with overview and song list.
- [x] **Task 1.2: Environment Setup Scripts** ✅
  - [x] Create `src/install.sh` for build dependencies installation.
  - [x] Create `test/install.sh` for test toolchain installation.

---

### Phase 2: Build Pipeline & Asset Generation Toolchain
Build automated tools for compiling `.ly` master files into derived assets (`.pdf`, `.abc`, `.mp3`).

- [x] **Task 2.1: PDF Compilation Pipeline** ✅
  - [x] Configure LilyPond compiler invocation scripts for vector PDF rendering in `build/pdf/`.
- [x] **Task 2.2: LilyPond to ABC Derivation Engine** ✅
  - [x] Develop `src/scripts/ly2abc.py` using AST parser (`python-ly`) to convert LilyPond scores into clean `.abc` files in `build/abc/`.
- [x] **Task 2.3: Acoustic Piano MP3 Synthesis Engine** ✅
  - [x] Implement MIDI extraction from LilyPond score blocks (`\midi {}`).
  - [x] Implement FluidSynth SoundFont (`.sf2`) synthesis pipeline to convert MIDI to WAV.
  - [x] Implement LAME encoder script to convert WAV to 192kbps MP3 audio in `build/mp3/`.
- [x] **Task 2.4: Catalog Manifest Generator** ✅
  - [x] Create script to scan song metadata and generate `build/catalog.json` index.
- [x] **Task 2.5: Pure Text Lyrics & PDF Pipeline** ✅
  - [x] Develop `src/scripts/ly2lyrics.py` to extract pure text Markdown lyrics into `build/lyrics/`.
  - [x] Develop `src/scripts/lyrics2pdf.py` to compile Markdown lyrics into standalone pure text PDFs in `build/lyrics_pdf/`.

---

### Phase 3: LilyPond Master Score Corpus Creation (25 Carols)
Create LilyPond primary master source files (`.ly`) for all 25 German Christmas carols, adhering to Swiss German spelling conventions (using 'ss' instead of 'ß').

- [x] **Task 3.1: Group 1 Carols (Songs 1–5)** ✅
  - [x] `Alle Jahre wieder`
  - [x] `Am Weihnachtsbaume die Lichter brennen`
  - [x] `Der Christbaum ist der schönste Baum`
  - [x] `Es ist ein Ros entsprungen`
  - [x] `Es wird scho glei dumpa`
- [x] **Task 3.2: Group 2 Carols (Songs 6–10)** ✅
  - [x] `Fröhliche Weihnacht überall`
  - [x] `Ihr Kinderlein, kommet`
  - [x] `In dulci jubilo`
  - [x] `Kling, Glöckchen, klingelingeling`
  - [x] `Kommet, ihr Hirten`
- [x] **Task 3.3: Group 3 Carols (Songs 11–15)** ✅
  - [x] `Lasst uns froh und munter sein`
  - [x] `Leise rieselt der Schnee`
  - [x] `Macht hoch die Tür`
  - [x] `Maria durch ein Dornwald ging`
  - [x] `Morgen, Kinder, wird’s was geben`
- [x] **Task 3.4: Group 4 Carols (Songs 16–20)** ✅
  - [x] `O du fröhliche`
  - [x] `O Tannenbaum`
  - [x] `Schneeflöckchen, Weissröckchen`
  - [x] `Stern über Bethlehem`
  - [x] `Stille Nacht, heilige Nacht`
- [x] **Task 3.5: Group 5 Carols (Songs 21–25)** ✅
  - [x] `Süsser die Glocken nie klingen`
  - [x] `Tochter Zion, freue dich`
  - [x] `Vom Himmel hoch, da komm ich her`
  - [x] `Was soll das bedeuten`
  - [x] `Zu Bethlehem geboren`
- [x] **Additional Carols** ✅
  - [x] `Jingle Bells`
  - [x] `I Wish You a Merry Christmas`

---

### Phase 4: Interactive Web Application & Player Development
Build the client-side Single Page Application hosted on GitHub Pages.

- [x] **Task 4.1: Shell & Visual Layout (`src/web/`)** ✅
  - [x] **Subtask 4.1a: Shell & Responsive Layout** ✅
    - [x] Create `index.html` structure with header, catalog selector, player container, and lyrics view.
    - [x] Create responsive stylesheet `style.css` supporting mobile and desktop viewports.
  - [x] **Subtask 4.1b: App Logic & Catalog Integration** ✅
    - [x] Create application entry point `app.js` to fetch `catalog.json` and initialize web app interface.
- [x] **Task 4.2: Dynamic Score Rendering & Audio Playback** ✅
  - [x] Integrate `abcjs` in `src/web/app.js` to render vector SVG scores from derived `.abc` files.
  - [x] Integrate Web Audio API synth controller for interactive score playback and measure highlighting.
  - [x] Implement MP3 streaming audio player and direct asset download links (`.pdf`, `.mp3`, `.ly`, `.abc`).
- [x] **Task 4.3: Pure Text Lyrics Reader & Downloads** ✅
  - [x] Integrate Markdown pure text lyrics viewer into GitHub Pages web player.
  - [x] Provide direct download links for pure text Markdown lyrics files (`.md`) and standalone text PDFs (`_lyrics.pdf`).

---

### Phase 5: Test Harness & Visual Verification Suite
Build automated test suites for notation syntax, compilation integrity, and visual UI verification.

- [x] **Task 5.1: Notation & Asset Validation Tests** ✅
  - [x] Implement LilyPond syntax validation tests (`lilypond --parse-only`).
  - [x] Implement asset integrity check script verifying non-zero size for compiled `.pdf`, `.abc`, and `.mp3` files.
- [x] **Task 5.2: Playwright Visual Regression & UI Verification** ✅
  - [x] Set up Playwright test framework under `test/e2e/`.
  - [x] Implement automated browser UI tests to verify score rendering and audio playback controls.
  - [x] Capture and store screenshot artifacts of web player component states.

---

### Phase 6: CI/CD Integration & GitHub Pages Deployment
Automate full build, test, and static site deployment workflows.

- [x] **Task 6.1: GitHub Actions Workflow Construction** ✅
  - [x] Create `.github/workflows/ci-cd.yml` workflow executing `src/install.sh` and `test/install.sh`.
  - [x] Configure step to run asset generation pipeline for all 25 carols.
  - [x] Configure step to run full test suite and artifact generation.
- [x] **Task 6.2: GitHub Pages Deployment** ✅
  - [x] Configure automated deployment step to publish `build/site/` to GitHub Pages upon push to main branch.
