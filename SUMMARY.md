# Project Summary: German Christmas Carols Collection (Deutsche Weihnachtslieder)

## 1. Executive Overview

The **German Christmas Carols Collection** (*Deutsche Weihnachtslieder*) is an open-source digital music publishing project and interactive web platform providing complete, publication-grade sheet music, synthetic piano audio recordings, and pure text lyrics for the 25 most popular German Christmas carols, plus 4 well-known international carols.

The central pillar of the system architecture is establishing **LilyPond (`.ly`)** files as the **single primary source of truth** for all musical scores and lyrics. Downstream formats—including vector print sheet music PDFs, derived ABC notation files, SoundFont-synthesized acoustic piano MP3s, pure text Markdown lyrics, and standalone text-only lyrics PDFs—are compiled deterministically via an automated build pipeline.

An interactive client-side Single Page Application (SPA) hosted on **GitHub Pages** utilizes `abcjs` for dynamic vector score rendering, Web Audio playback, pure text lyrics reading, and asset downloads.

---

## 2. Core Project Objectives & Capabilities

- **Single Source of Truth**: All musical notation, voice parts, chords, and stanza lyrics are authored and maintained exclusively in LilyPond (`.ly`) format within `src/songs/`, eliminating format synchronization discrepancies.
- **Multiformat Asset Derivation**:
  - **Sheet Music PDFs (`.pdf`)**: Publication-grade vector sheet music compiled directly with LilyPond.
  - **ABC Notation (`.abc`)**: Derived via Python AST parsing (`python-ly`) for browser-based rendering and audio synthesis.
  - **Piano MP3 Audio (`.mp3`)**: High-quality 192kbps MP3 audio rendered from LilyPond MIDI files using FluidSynth with GeneralUser GM acoustic piano SoundFont patches and encoded via LAME.
  - **Pure Text Lyrics (`.md`)**: Extracted directly from LilyPond AST/regex (`ly2lyrics.py`) for clean reading on GitHub Pages.
  - **Standalone Text-Only Lyrics PDFs (`_lyrics.pdf`)**: Compiled pure text PDFs (`fpdf2`) without musical score clutter for printouts, choirs, and community singing.
- **Interactive Web Player**: A responsive web application deployed to GitHub Pages with song catalog filtering, interactive score zooming, playback controls, synthesized Web Audio playback with cursor highlighting, piano MP3 streaming, and one-click asset downloads.
- **Automated CI/CD & Testing**: Continuous integration and deployment via GitHub Actions running syntax parsers, asset integrity validation, and Playwright headless browser end-to-end tests with screenshot capture.

---

## 3. High-Level Architecture & Workflow

```
                        +---------------------------------------+
                        |      Primary LilyPond Master Src      |
                        |          (src/songs/*/*.ly)           |
                        +-------------------+-------------------+
                                            |
                                            v
                        +---------------------------------------+
                        |      Asset Build Pipeline Engine      |
                        |           (src/scripts/*)             |
                        +---+-----------+-----------+-------+---+
                            |           |           |       |
            +---------------+           |           |       +---------------+
            |                           v           v                       |
            v                 +-------------------+                         v
+-----------------------+     | Derived ABC Src   |             +-----------------------+
|  Print PDF Assets     |     |   (build/abc/)    |             |   Piano MP3 Assets    |
| (Sheet & Text PDFs)   |     +---------+---------+             |     (build/mp3/)      |
+-----------------------+               |                       +-----------------------+
                                        v
                        +---------------------------------------+
                        |     Pure Text Lyrics Markdown         |
                        |            (build/lyrics/)            |
                        +-------------------+-------------------+
                                            |
                                            v
                        +---------------------------------------+
                        |     Interactive Web Application       |
                        |             (src/web/)                |
                        +-------------------+-------------------+
                                            |
                                            v
                        +---------------------------------------+
                        |       GitHub Pages CDN & Host         |
                        +---------------------------------------+
```

### Component Breakdown

1. **Primary Source Repository (`src/songs/`)**:
   Standardized snake_case directories containing `.ly` master score files for each carol. Master scores define SATB voice structures with chords (`\chordmode`) and stanza verses.
2. **Build Pipeline (`src/scripts/build_pipeline.sh`)**:
   - `lilypond`: Compiles sheet music PDFs and extracts MIDI sequences.
   - `fluidsynth` & `lame`: Synthesizes WAV audio from MIDI with acoustic piano SoundFont (`.sf2`) and encodes into MP3.
   - `ly2abc.py`: Parses LilyPond sources via `python-ly` and generates ABC notation.
   - `ly2lyrics.py`: Extracts stanzas into Markdown (`.md`) and compiles text-only PDFs (`fpdf2`).
   - `generate_catalog.py`: Generates the central index manifest (`build/catalog.json`).
3. **Interactive Web Application (`src/web/`)**:
   Vanilla ES6 JavaScript (`app.js`), semantic HTML5 (`index.html`), and responsive CSS (`style.css`) leveraging `abcjs` for score rendering and Web Audio API playback.
4. **Testing Harness (`test/`)**:
   - `test/unit/`: Validates LilyPond syntax, conversion scripts, and non-zero asset file outputs.
   - `test/e2e/`: Automated Playwright UI tests verifying score loading, audio triggers, and responsive layout.

---

## 4. Carol Catalog (28 Songs)

The collection consists of the 25 classic German Christmas carols and 4 additional international carols:

### The 25 Classic German Christmas Carols
1. **Alle Jahre wieder**
2. **Am Weihnachtsbaume die Lichter brennen**
3. **Der Christbaum ist der schönste Baum**
4. **Es ist ein Ros entsprungen**
5. **Fröhliche Weihnacht überall**
6. **Ihr Kinderlein, kommet**
7. **In dulci jubilo**
8. **Kling, Glöckchen, klingelingeling**
9. **Kommet, ihr Hirten**
10. **Lasst uns froh und munter sein**
11. **Leise rieselt der Schnee**
12. **Macht hoch die Tür**
13. **Maria durch ein Dornwald ging**
14. **Morgen, Kinder, wird’s was geben**
15. **O du fröhliche**
16. **O Tannenbaum**
17. **Schneeflöckchen, Weissröckchen**
18. **Stern über Bethlehem**
19. **Stille Nacht, heilige Nacht**
20. **Süsser die Glocken nie klingen**
21. **Tochter Zion, freue dich**
22. **Vom Himmel hoch, da komm ich her**
23. **Was soll das bedeuten**
24. **Zu Bethlehem geboren**

### Additional Carols
25. **Jingle Bells**
26. **I Wish You a Merry Christmas**
27. **Rudolph the Red-Nosed Reindeer**
28. **Last Christmas**

*(Note: In accordance with repository conventions, Swiss German spelling rules apply to all German texts, substituting 'ss' for 'ß'.)*

---

## 5. Technology Stack Summary

| Layer | Technology | Role |
| :--- | :--- | :--- |
| **Master Notation** | LilyPond (v2.24+) | Typographic master score and MIDI sequencing |
| **Notation Derivation** | Python 3 + `python-ly` | AST-based LilyPond-to-ABC converter |
| **Lyrics & PDF Engine** | Python 3 + `fpdf2` | Stanza extractor, Markdown exporter, and text PDF compiler |
| **Audio Synthesis** | FluidSynth + GM SoundFont | Acoustic piano SoundFont synthesizer |
| **Audio Compression** | LAME MP3 Encoder | 192kbps MP3 encoding from raw WAV |
| **Frontend Runtime** | Modern HTML5 / CSS3 / ES6 JS | Lightweight, dependency-free Single Page Application |
| **Score Rendering** | `abcjs` (v6.2+) | Dynamic browser SVG sheet music & Web Audio MIDI synth |
| **Testing Suite** | Python `unittest` + Playwright | Unit notation tests and E2E visual verification |
| **CI/CD & Hosting** | GitHub Actions & GitHub Pages | Automated build, artifact validation, and static hosting |

---

## 6. Repository Layout

```
.
├── CONCEPT.md                # Vision, business cases, and high-level architectural decisions
├── DESIGN.md                 # Detailed technical design and component interfaces
├── TOP_ARCHITECTURE.puml     # PlantUML system architecture diagram
├── ROADMAP.md                # Development phases, task tracking, and milestone statuses
├── SUMMARY.md                # Executive project summary and architectural digest
├── README.md                 # Project landing page and web application link
├── Jules_Setup.sh            # Global environment initialization script
├── src/
│   ├── songs/                # 28 carol LilyPond master source files (<song_id>/<song_id>.ly)
│   ├── scripts/              # Build scripts (build_pipeline.sh, ly2abc.py, ly2lyrics.py, etc.)
│   ├── web/                  # Web player application source (index.html, style.css, app.js)
│   └── install.sh            # Build environment toolchain installer script
├── test/
│   ├── unit/                 # Unit and notation validation test suite
│   ├── e2e/                  # Playwright visual regression test suite
│   └── install.sh            # Test environment setup script
└── build/                    # Temporary compilation output (git-ignored)
    ├── pdf/                  # Compiled sheet music PDFs
    ├── abc/                  # Derived ABC notation files
    ├── lyrics/               # Derived pure text Markdown lyrics
    ├── lyrics_pdf/           # Compiled pure text lyrics PDFs
    ├── mp3/                  # Synthesized piano MP3 audio
    └── site/                 # Assembled static site deployment bundle
```

---

## 7. Build and Verification Quickstart

### Environment Setup
Run setup scripts to install build and test dependencies:
```bash
bash src/install.sh
bash test/install.sh
```

### Build All Assets & Assemble Site
```bash
./src/scripts/build_pipeline.sh
```

### Run Tests
```bash
# Unit & notation validation tests
python3 -m unittest discover test/unit/

# Playwright E2E browser tests
python3 -m unittest discover test/e2e/
```
