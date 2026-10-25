# Project Roadmap: German Christmas Carols Collection & Interactive Web Player

This document outlines the execution roadmap for the **German Christmas Carols Collection & Interactive Web Player** project.

---

## Progress Overview

| Phase | Description | Status |
| :--- | :--- | :--- |
| **Phase 1** | Repository Architecture & Documentation Infrastructure | ✅ Completed |
| **Phase 2** | Build Pipeline & Asset Generation Toolchain | ⏳ Planned |
| **Phase 3** | LilyPond Master Score Corpus (25 Carols) | ⏳ Planned |
| **Phase 4** | Interactive Web Application (abcjs Web Player) | ⏳ Planned |
| **Phase 5** | Test Harness & Visual Verification Suite | ⏳ Planned |
| **Phase 6** | CI/CD Integration & GitHub Pages Deployment | ⏳ Planned |

---

## Goals

- [ ] 🎼 **Single Primary Master Source**: Store all sheet music scores and lyrics in LilyPond (`.ly`) master files within `src/songs/`. ⏳
- [ ] ⚙️ **Automated Compilation Pipeline**: Automatically derive PDF, ABC notation, and SoundFont acoustic piano MP3 audio files during build. ⏳
- [ ] 🌐 **Interactive Web Player**: Provide an accessible GitHub Pages web app with `abcjs` dynamic rendering and Web Audio playback for 25 German Christmas carols. ⏳
- [ ] 🧪 **Automated Testing & Visual Verification**: End-to-end browser testing with Playwright visual screenshots and notation validation. ⏳

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

- [ ] **Task 2.1: PDF Compilation Pipeline** ⏳
  - [ ] Configure LilyPond compiler invocation scripts for vector PDF rendering in `build/pdf/`.
- [ ] **Task 2.2: LilyPond to ABC Derivation Engine** ⏳
  - [ ] Develop `src/scripts/ly2abc.py` using AST parser (`python-ly`) to convert LilyPond scores into clean `.abc` files in `build/abc/`.
- [ ] **Task 2.3: Acoustic Piano MP3 Synthesis Engine** ⏳
  - [ ] Implement MIDI extraction from LilyPond score blocks (`\midi {}`).
  - [ ] Implement FluidSynth SoundFont (`.sf2`) synthesis pipeline to convert MIDI to WAV.
  - [ ] Implement LAME encoder script to convert WAV to 192kbps MP3 audio in `build/mp3/`.
- [ ] **Task 2.4: Catalog Manifest Generator** ⏳
  - [ ] Create script to scan song metadata and generate `build/catalog.json` index.

---

### Phase 3: LilyPond Master Score Corpus Creation (25 Carols)
Create LilyPond primary master source files (`.ly`) for all 25 German Christmas carols, adhering to Swiss German spelling conventions (using 'ss' instead of 'ß').

- [ ] **Task 3.1: Group 1 Carols (Songs 1–5)** ⏳
  - [ ] `Alle Jahre wieder`
  - [ ] `Am Weihnachtsbaume die Lichter brennen`
  - [ ] `Der Christbaum ist der schönste Baum`
  - [ ] `Es ist ein Ros entsprungen`
  - [ ] `Es wird scho glei dumpa`
- [ ] **Task 3.2: Group 2 Carols (Songs 6–10)** ⏳
  - [ ] `Fröhliche Weihnacht überall`
  - [ ] `Ihr Kinderlein, kommet`
  - [ ] `In dulci jubilo`
  - [ ] `Kling, Glöckchen, klingelingeling`
  - [ ] `Kommet, ihr Hirten`
- [ ] **Task 3.3: Group 3 Carols (Songs 11–15)** ⏳
  - [ ] `Lasst uns froh und munter sein`
  - [ ] `Leise rieselt der Schnee`
  - [ ] `Macht hoch die Tür`
  - [ ] `Maria durch ein Dornwald ging`
  - [ ] `Morgen, Kinder, wird’s was geben`
- [ ] **Task 3.4: Group 4 Carols (Songs 16–20)** ⏳
  - [ ] `O du fröhliche`
  - [ ] `O Tannenbaum`
  - [ ] `Schneeflöckchen, Weissröckchen`
  - [ ] `Stern über Bethlehem`
  - [ ] `Stille Nacht, heilige Nacht`
- [ ] **Task 3.5: Group 5 Carols (Songs 21–25)** ⏳
  - [ ] `Süsser die Glocken nie klingen`
  - [ ] `Tochter Zion, freue dich`
  - [ ] `Vom Himmel hoch, da komm ich her`
  - [ ] `Was soll das bedeuten`
  - [ ] `Zu Bethlehem geboren`

---

### Phase 4: Interactive Web Application & Player Development
Build the client-side Single Page Application hosted on GitHub Pages.

- [ ] **Task 4.1: Shell & Visual Layout (`src/web/`)** ⏳
  - [ ] Create `index.html` structure with catalog selector and player container.
  - [ ] Create responsive stylesheet `style.css` supporting mobile and desktop viewports.
- [ ] **Task 4.2: Dynamic Score Rendering & Audio Playback** ⏳
  - [ ] Integrate `abcjs` in `src/web/app.js` to render vector SVG scores from derived `.abc` files.
  - [ ] Integrate Web Audio API synth controller for interactive score playback and measure highlighting.
  - [ ] Implement MP3 streaming audio player and direct asset download links (`.pdf`, `.mp3`, `.ly`, `.abc`).

---

### Phase 5: Test Harness & Visual Verification Suite
Build automated test suites for notation syntax, compilation integrity, and visual UI verification.

- [ ] **Task 5.1: Notation & Asset Validation Tests** ⏳
  - [ ] Implement LilyPond syntax validation tests (`lilypond --parse-only`).
  - [ ] Implement asset integrity check script verifying non-zero size for compiled `.pdf`, `.abc`, and `.mp3` files.
- [ ] **Task 5.2: Playwright Visual Regression & UI Verification** ⏳
  - [ ] Set up Playwright test framework under `test/e2e/`.
  - [ ] Implement automated browser UI tests to verify score rendering and audio playback controls.
  - [ ] Capture and store screenshot artifacts of web player component states.

---

### Phase 6: CI/CD Integration & GitHub Pages Deployment
Automate full build, test, and static site deployment workflows.

- [ ] **Task 6.1: GitHub Actions Workflow Construction** ⏳
  - [ ] Create `.github/workflows/ci-cd.yml` workflow executing `src/install.sh` and `test/install.sh`.
  - [ ] Configure step to run asset generation pipeline for all 25 carols.
  - [ ] Configure step to run full test suite and artifact generation.
- [ ] **Task 6.2: GitHub Pages Deployment** ⏳
  - [ ] Configure automated deployment step to publish `build/site/` to GitHub Pages upon push to main branch.
