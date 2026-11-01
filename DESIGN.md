# Design: German Christmas Carols Collection & Interactive Web Player

## 1. System Overview & Technical Objectives

This document provides the detailed technical design for the open-source **German Christmas Carols Collection & Interactive Web Player**. It expands upon the business goals and high-level architecture specified in `CONCEPT.md`.

### Core Technical Objectives
1. **Single Master Source**: Store all score notations and lyrics exclusively in LilyPond (`.ly`) master files within `src/songs/`.
2. **Automated Asset Generation**: Provide build toolchains in `src/` to compile LilyPond files into:
   - Publication-grade print PDF documents via `lilypond`.
   - Dynamic ABC notation (`.abc`) files derived via parse engines for web rendering.
   - High-quality piano MP3 audio files generated via MIDI and FluidSynth acoustic SoundFont synthesis.
   - Clean, pure text Markdown (`.md`) lyrics files extracted automatically from `.ly` master sources.
   - Standalone pure text lyrics PDF documents compiled without musical score clutter.
3. **Interactive Web Application**: Deliver a responsive web application hosted on GitHub Pages utilizing `abcjs` for dynamic sheet music rendering, browser-side audio synthesis (Web Audio API), pure text lyrics Markdown display, and audio streaming/download capabilities.
4. **Automated Verification & CI/CD Pipeline**: Maintain `src/install.sh` and `test/install.sh` scripts alongside GitHub Actions workflows for automated build, verification testing, visual regression screenshot captures, and static site deployment.

---

## 2. Detailed Architecture & Technical Component Design

### Top Architecture Overview
The overall architecture showing major modules and dataflows is illustrated below and defined in `TOP_ARCHITECTURE.puml`:

![Top Architecture Diagram](TOP_ARCHITECTURE.puml)

```
                       +-----------------------------------+
                       |    Primary LilyPond Master Src    |
                       |       (src/songs/*/*.ly)          |
                       +-----------------+-----------------+
                                         |
                                         v
                       +-----------------------------------+
                       |    Build & Toolchain Pipeline     |
                       |         (src/scripts/*)           |
                       +---+--------+--------+--------+----+
                           |        |        |        |
           +---------------+        |        |        +--------------------+
           |                        v        v                             |
           v              +-------------------+               v
+--------------------+    | Derived ABC Src   |    +--------------------+
| Print PDF Assets   |    |  (build/*.abc)    |    | Piano MP3 Assets   |
| (Sheet & Text PDF) |    +---------+---------+    |   (build/*.mp3)    |
+--------------------+              |              +--------------------+
                                    v
                       +-----------------------------------+
                       | Derived Pure Text Lyrics (MD)     |
                       |          (build/lyrics/)          |
                       +-----------------+-----------------+
                                         |
                                         v
                       +-----------------------------------+
                       |  Web App Player & Lyrics Viewer   |
                       |           (src/web/)              |
                       +-----------------+-----------------+
                                         |
                                         v
                       +-----------------------------------+
                       |    GitHub Pages Hosting & CDN     |
                       +-----------------------------------+
```

### Technical Component Specifications & Interfaces

#### 1. Primary Source Notation Module (`src/songs/`)
- **Description**: Standardized folder structure containing LilyPond master files (`.ly`) for each of the 25 German Christmas carols.
- **File Structure**: `src/songs/<song_id>/<song_id>.ly` (e.g., `src/songs/stille_nacht/stille_nacht.ly`).
- **Data Model**:
  - LilyPond header fields: `title`, `composer`, `poet`, `arranger`, `tagline`.
  - Score layout block: Voice structures (melody in treble clef, piano accompaniment in bass clef), lyrics alignment, and MIDI block generation (`\midi {}`).

#### 2. Build Pipeline & Synthesis Engine (`src/scripts/` & `src/install.sh`)
- **Description**: Automated compilation toolchain installed via `src/install.sh` that processes `.ly` master files into downstream build artifacts.
- **Sub-components & Command Interfaces**:
  - **PDF Compiler**:
    - *Command*: `lilypond --pdf -o build/pdf/<song_id> src/songs/<song_id>/<song_id>.ly`
    - *Input*: `.ly` master source file.
    - *Output*: Vector `.pdf` file.
  - **MIDI Synthesizer & MP3 Encoder**:
    - *Command 1*: `lilypond -dno-point-and-click -o build/midi/<song_id> src/songs/<song_id>/<song_id>.ly` -> produces `<song_id>.mid`.
    - *Command 2*: `fluidsynth -ni -g 1.0 -F build/wav/<song_id>.wav /path/to/soundfont.sf2 build/midi/<song_id>.mid`
    - *Command 3*: `lame --preset standard build/wav/<song_id>.wav build/mp3/<song_id>.mp3`
    - *Input*: `.ly` file -> Intermediate `.mid` file -> SoundFont `.sf2` -> `.wav` -> Final 192kbps `.mp3`.
  - **ABC Derivation Engine**:
    - *Command*: `python3 src/scripts/ly2abc.py src/songs/<song_id>/<song_id>.ly build/abc/<song_id>.abc`
    - *Input*: `.ly` AST / notation structure.
    - *Output*: Clean, validated `.abc` notation file.
  - **Pure Text Lyrics Extractor & PDF Compiler**:
    - *Command 1*: `python3 src/scripts/ly2lyrics.py src/songs/<song_id>/<song_id>.ly build/lyrics/<song_id>.md`
    - *Command 2*: `python3 src/scripts/lyrics2pdf.py build/lyrics/<song_id>.md build/lyrics_pdf/<song_id>_lyrics.pdf`
    - *Input*: `.ly` master source file.
    - *Output*: Pure text Markdown (`.md`) file and standalone text-only lyrics PDF document (`.pdf`).
  - **Consolidated Booklet Compiler**:
    - *Command*: `python3 src/scripts/generate_booklet.py build/pdf/weihnachtslieder_liederbuch.pdf`
    - *Input*: Individual song PDFs from `build/pdf/` and `build/catalog.json`.
    - *Output*: Consolidated `weihnachtslieder_liederbuch.pdf` complete with vector cover art, dynamic running page numbers, and Table of Contents (Inhaltsverzeichnis) positioned at the end.

#### 3. Interactive Web Application Module (`src/web/`)
- **Description**: Static client-side Single Page Application (SPA) utilizing `abcjs` for visual sheet music rendering and audio playback.
- **Component Layout**:
  - `src/web/index.html`: Main shell structure featuring song catalog list, player controls, and score container.
  - `src/web/app.js`: Application logic handling song navigation, fetching `.abc` files, initializing `abcjs` visual renderer and synth controller, and managing MP3 stream downloads.
  - `src/web/style.css`: Modern, responsive CSS supporting mobile and desktop viewports.
  - `src/web/catalog.json`: Automatically generated index manifest listing all 25 carols with title, category, key, tempo, and asset file paths.
- **Client-Side Data Interfaces**:
  - `ABCJS.renderAbc(containerId, abcString, renderParams)`: Renders SVG score in DOM.
  - `ABCJS.synth.CreateSynth()` / `WebAudio`: Synthesizes real-time audio playback with measure cursor tracking.

#### 4. Automated Testing & Visual Regression Engine (`test/` & `test/install.sh`)
- **Description**: Test harness installed via `test/install.sh` for validating notation syntax, audio generation, and UI components.
- **Sub-components**:
  - **Notation Parser Test**: Validates LilyPond syntax (`lilypond --parse-only`) and ABC syntax validation.
  - **Asset Validation Test**: Checks that all 25 songs have compiled `.pdf`, `.mp3`, and `.abc` files of non-zero size.
  - **Visual Regression UI Test**: Uses Playwright headless browser to load the web player, capture screenshots of song rendering and playback states, and save screenshot artifacts for review.

---

## 3. Technology Stack

| Domain | Technology / Tool | Version / Specification | Rationale & Usage |
| :--- | :--- | :--- | :--- |
| **Master Source Notation** | LilyPond | 2.24+ | Primary single source of truth for sheet music and MIDI export. |
| **Derivation Engine** | Python | 3.10+ (`python-ly`) | AST-based parsing and compilation scripts to derive ABC notation and extract pure text Markdown lyrics. |
| **Lyrics PDF Compiler** | Python / WeasyPrint / Pandoc | Standard Linux Toolchain | Compiles clean Markdown lyrics into standalone pure text lyrics PDFs. |
| **Audio Synthesizer** | FluidSynth | 2.3+ | Software synthesizer using SoundFont 2 (`.sf2`) acoustic piano patches. |
| **Audio Encoder** | LAME / ffmpeg | 3.100+ | Encodes WAV synth output into compressed MP3 (192 kbps). |
| **Web Frontend** | HTML5 / CSS3 / ES6 JS | Standard Modern Web | Lightweight client-side application logic without heavy dependencies. |
| **Sheet Music Web Render**| `abcjs` | 6.2+ | Renders dynamic vector SVG scores from ABC notation and powers Web Audio MIDI synth. |
| **Test Automation** | Playwright / Node.js | 1.40+ | End-to-end browser testing, interactive verification, and screenshot capture. |
| **Build & Dependencies** | Bash / Shell Scripting | POSIX Shell | Reproducible installer scripts (`src/install.sh`, `test/install.sh`). |
| **CI/CD Host** | GitHub Actions & Pages | Standard Actions Runner | Automated pipeline execution and static hosting. |

---

## 4. Major Technical Choices & Alternatives

### Technical Decision 1: LilyPond-to-ABC Conversion Strategy
- **Alternative 1A (Chosen)**: Automated AST Parsing & Conversion Script (`python-ly` / Custom Converter) — Parses LilyPond source files via Python AST parser scripts into structured notation objects and formats them into clean `.abc` files during build.
- **Alternative 1B**: MIDI-Intermediate Conversion (`lilypond -> midi -> midi2abc`) — Compiles LilyPond to MIDI and uses `midi2abc` to convert MIDI data back into ABC format.
- **Alternative 1C**: Client-Side Direct LilyPond Parsing via WebAssembly — Compiles LilyPond parser to WebAssembly to parse `.ly` files directly inside the browser.

*Selection Rationale*: Alternative 1A preserves musical metadata (such as lyrics, title headers, and explicit voice/key signatures) directly from the text source, producing human-readable ABC notation. Alternative 1B loses textual lyrics and layout context, while Alternative 1C introduces massive WebAssembly binary overhead and slow initial load times in the browser.

---

### Technical Decision 2: Piano SoundFont Synthesis Toolchain
- **Alternative 2A (Chosen)**: FluidSynth with Acoustic Piano SoundFont (`.sf2`) & LAME MP3 Encoder — Synthesizes MIDI files generated by LilyPond into high-quality WAV audio using FluidSynth with a curated acoustic piano SoundFont, then encodes to 192kbps MP3 via LAME.
- **Alternative 2B**: TiMidity++ Synthesizer with Standard MIDI Patches — Uses TiMidity++ with default MIDI sound sets to generate audio files.
- **Alternative 2C**: DAW / Headless VST Plugin Rendering Pipeline — Uses headless digital audio workstation (DAW) and commercial VST piano plugins in CI/CD container.

*Selection Rationale*: Alternative 2A provides crisp, realistic acoustic piano synthesis with deterministic output, fast rendering speed in Linux CI environments, and lightweight installation requirements via standard packages. Alternative 2B produces low-quality synthesized audio, while Alternative 2C requires complex proprietary licensing and heavy execution containers.

---

### Technical Decision 3: Web Application Architecture & State Management
- **Alternative 3A (Chosen)**: Vanilla ES6 JavaScript + Modular `abcjs` Engine — A lightweight, dependency-free frontend using modern ES6 modules to manage application state (active song, playback controls, view options), dynamic DOM updates, and `abcjs` audio/visual instances.
- **Alternative 3B**: React/Vue Single Page Application Framework — Builds the UI using React or Vue framework with bundlers (Webpack/Vite).
- **Alternative 3C**: Static HTML Multi-Page Application with Embedded IFrames — Generates separate HTML pages for each carol with static pre-rendered iFrame embeds.

*Selection Rationale*: Alternative 3A provides instant page load speed, minimal build setup, zero runtime framework maintenance overhead, and seamless integration with `abcjs` DOM elements. Frameworks (Alt 3B) add unnecessary complexity for a 25-song catalog, while multi-page static HTML (Alt 3C) prevents continuous audio playback across song transitions.

---

### Technical Decision 4: Automated Testing & UI Verification Framework
- **Alternative 4A (Chosen)**: Playwright Headless Browser Test Engine with Screenshot Capture — Executes automated headless browser tests to load web pages, verify `abcjs` score SVG rendering, trigger audio playback handlers, capture visual screenshots for UI inspection, and store artifacts in GitHub Actions.
- **Alternative 4B**: Cypress E2E Testing Framework — Uses Cypress for browser automated testing.
- **Alternative 4C**: Manual Visual Inspection Checklist — Relies solely on maintainers manually testing web pages locally without automated browser testing.

*Selection Rationale*: Alternative 4A runs natively and rapidly in headless CI environments, supports multi-browser screenshot comparison (Chromium, Firefox, WebKit), and directly aligns with the CI/CD testing guidelines defined in `GEMINI.md`.

---

### Technical Decision 5: Pure Text Lyrics Extraction & PDF Toolchain
- **Alternative 5A (Chosen)**: AST/Regex Python Extractor (`ly2lyrics.py`) & Markdown/PDF Compiler — Parses LilyPond `\lyricmode` and `\markup` blocks to produce clean, formatted Markdown files, and compiles them into lightweight text PDFs via automated build scripts.
- **Alternative 5B**: Separate Duplicate Markdown Source Maintenance — Manually write and maintain separate `.md` lyrics files alongside `.ly` files in each carol folder.
- **Alternative 5C**: Browser Client-Side JS Parsing from ABC Notation — Parse ABC notation strings in JavaScript inside the browser to generate lyrics dynamically in DOM.

*Selection Rationale*: Alternative 5A upholds the single master source constraint in LilyPond (`.ly`), guarantees synchronization across all exported formats, and allows generating both static Markdown files for GitHub Pages and standalone text-only lyrics PDFs in the CI/CD pipeline.

---

## 5. Repository Directory Layout

```
.
├── CONCEPT.md                # High-level product definition & business cases
├── DESIGN.md                 # Detailed technical design & decision specs
├── TOP_ARCHITECTURE.puml     # Top-level architecture diagram (PlantUML)
├── ROADMAP.md                # Execution phases, status tracking & task lists
├── TECHNICAL_DEBTS.md        # Tracked technical debts & maintenance backlog
├── README.md                 # Project entry point & link to GitHub Pages
├── specification/            # Datasheets, musical guidelines, and reference specs
├── src/                      # Source code directory
│   ├── songs/                # 25 Carol primary sources
│   │   ├── stille_nacht/
│   │   │   └── stille_nacht.ly
│   │   └── ...
│   ├── scripts/              # Compilation & conversion scripts (ly2abc.py, build.sh)
│   ├── web/                  # Web player source code (HTML, CSS, JS)
│   └── install.sh            # Build environment toolchain installer script
├── test/                     # Testing toolchain & test suites
│   ├── install.sh            # Test environment setup script
│   ├── unit/                 # Notation parser and conversion tests
│   └── e2e/                  # Playwright visual regression and UI tests
└── build/                    # Temporary build output directory (git-ignored)
    ├── pdf/                  # Compiled sheet music PDFs
    ├── abc/                  # Derived ABC notation files
    ├── lyrics/               # Derived pure text Markdown lyrics (.md)
    ├── lyrics_pdf/           # Compiled pure text lyrics PDFs (_lyrics.pdf)
    ├── midi/                 # Intermediate MIDI files
    ├── wav/                  # Intermediate WAV audio
    ├── mp3/                  # Final compiled piano MP3 audio
    └── site/                 # Assembled web app directory deployed to GitHub Pages
```

---

## 6. Automated CI/CD & Deployment Pipeline Workflow

```
[ Git Push to Main ]
        │
        ▼
[ GitHub Actions CI Runner ]
        │
        ├── 1. Run src/install.sh & test/install.sh
        │
        ├── 2. Compile LilyPond Master Files
        │       ├── Generate build/pdf/*.pdf
        │       └── Generate build/midi/*.mid
        │
        ├── 3. Synthesize Audio Assets
        │       └── FluidSynth + SF2 + LAME -> build/mp3/*.mp3
        │
        ├── 4. Derive ABC Notation & Pure Text Lyrics
        │       ├── ly2abc.py -> build/abc/*.abc
        │       ├── ly2lyrics.py -> build/lyrics/*.md
        │       └── lyrics2pdf.py -> build/lyrics_pdf/*_lyrics.pdf
        │
        ├── 5. Execute Test Suite & UI Screenshots
        │       ├── Validate syntax & compiled assets (PDF, MP3, ABC, MD, Text PDF)
        │       └── Playwright E2E tests -> Capture screenshots
        │
        ├── 6. Assemble Web Site Package (build/site/)
        │
        ▼
[ Deploy build/site/ to GitHub Pages ]
```

---

## 7. Summary of Discarded Technical Alternatives

The following table summarizes all technical choices evaluated in this design, highlighting discarded alternatives and the key reasons for their rejection:

| Area / Component | Discarded Alternative | Technical Rationale for Rejection |
| :--- | :--- | :--- |
| **LilyPond-to-ABC Conversion** | Alt 1B: MIDI-Intermediate (`midi2abc`) | Strips lyrics, textual headers, voice annotations, and structural formatting from source. |
| **LilyPond-to-ABC Conversion** | Alt 1C: WebAssembly Client-Side LilyPond | Enormous WASM bundle size (>20MB) causes severe browser latency and page load delays. |
| **Audio Synthesis** | Alt 2B: TiMidity++ Default Patches | Low-fidelity, artificial MIDI sound quality compared to SoundFont acoustic piano synthesis. |
| **Audio Synthesis** | Alt 2C: DAW / VST Engine in Container | Complex proprietary licensing, heavy Docker dependencies, and slow execution times. |
| **Web Architecture** | Alt 3B: React/Vue Framework SPA | Unnecessary framework bundle size and complexity overhead for static score viewing. |
| **Web Architecture** | Alt 3C: Multi-Page Static HTML IFrames | Prevents seamless audio playback when users browse between songs in the catalog. |
| **Testing Suite** | Alt 4B: Cypress E2E Framework | Slower CI execution and higher setup overhead compared to lightweight Playwright runner. |
| **Testing Suite** | Alt 4C: Manual Visual Testing | Lacks automated verification in CI/CD, risking visual regressions and broken links. |
| **Lyrics Extraction** | Alt 5B: Separate Duplicate Markdown | Dual editing maintenance introduces typos, stanza mismatches, and synchronization drift. |
| **Lyrics Extraction** | Alt 5C: Client-Side Browser Parsing | Fails to generate standalone downloadable text PDFs or SEO-friendly static Markdown files. |
| **Booklet Generation** | Alt 6B: Monolithic LilyPond Score | LilyPond compilation is slow and memory-intensive; lacks easy programmatic control over end-of-document TOC pagination. |
| **Booklet Generation** | Alt 6C: LaTeX Document Wrapper | Demands massive multi-gigabyte TeX Live distribution in CI environments. |
