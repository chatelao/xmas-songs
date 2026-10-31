# Concept: German Christmas Carols Collection & Interactive Web Player

## 1. Goal and Vision

The primary goal of this project is to curate and publish an open-source collection of the **25 most popular German Christmas carols** (*die 25 bekanntesten deutschen Weihnachtslieder*).

The collection will be maintained with **LilyPond (`.ly`)** as the single primary source of truth for all sheet music.

The final assets made available include:
- **LilyPond (`.ly`)**: Primary typographic master source files containing musical score and lyrics.
- **ABC Notation (`.abc`)**: Derived or compiled text-based notation for web rendering and audio synthesis.
- **PDF (Sheet Music & Complete Booklet)**: Ready-to-print, publication-grade vector sheet music compiled directly from the `.ly` master source, and a consolidated complete Carol Booklet (`weihnachtslieder_liederbuch.pdf`) complete with festive cover art, running page numbers, and Table of Contents at the end.
- **MP3**: High-quality piano audio recordings (`.mp3`) compiled directly from `.ly` master sources via MIDI audio synthesis.
- **Markdown (`.md`)**: Pure text lyrics collection exported as clean Markdown files, published directly on GitHub Pages for easy reading and copy-pasting.
- **PDF (Pure Text Lyrics)**: Standalone, clean text-only lyrics PDF documents without musical scores for easy singing and printing.

Additionally, the project provides an interactive web application hosted on **GitHub Pages**. This web application leverages `abcjs` to dynamically render sheet music scores and provide real-time audio playback (MIDI/Web Audio synthesis) directly in modern web browsers across desktop and mobile devices, alongside a pure text lyrics reader viewing Markdown files, and download options for piano MP3 files, sheet music PDFs, and pure text lyrics PDFs.

---

## 2. Business & Use Cases

### Business Goals
1. **Single Source of Truth**: Maintain all musical content and lyrics primarily in LilyPond (`.ly`) format to prevent synchronization errors between formats.
2. **Accessibility**: Provide free, accessible, and high-quality Christmas carol scores and piano audio recordings to musicians, choirs, teachers, and families.
3. **Interactivity**: Allow users to listen to and view scores online without requiring specialized sheet music software.
4. **Portability**: Offer downloadable digital assets (`.ly`, `.abc`, `.pdf`, `.mp3`, pure text `.md` lyrics, and text-only `.pdf` lyrics) for offline printing, listening, and editing in notation software.
5. **Pure Text Lyrics Accessibility**: Provide a clean text-only lyrics reader on GitHub Pages and standalone text PDFs for users, choirs, and teachers who need the lyrics without musical notation clutter.
6. **Automation**: Establish a robust CI/CD workflow to validate LilyPond source notation, compile sheet music PDFs, generate piano MP3 audio, derive/validate ABC files, extract pure text Markdown lyrics, compile text-only lyrics PDFs, and automatically deploy the web application.

### Key Use Cases

#### UC-1: Browse Song Catalog
- **Actor**: End User (Musician / Listener)
- **Description**: The user navigates to the web application and views a list of all 25 German Christmas carols organized alphabetically or by category.
- **Outcome**: User selects a song to display its sheet music and lyrics.

#### UC-2: Render Sheet Music & Play Audio
- **Actor**: End User
- **Description**: Upon selecting a song, the web application dynamically renders the score using `abcjs` (from the derived ABC files). The user can press play to listen to a synthesized audio playback (via Web Audio API / MIDI) synchronized with the score or stream the pre-rendered piano MP3 audio track.
- **Outcome**: Interactive score display and audible playback directly in the browser.

#### UC-3: Download Music Assets
- **Actor**: End User / Choir Conductor / Arranger / Listener
- **Description**: From the song detail view or download directory, the user downloads `.pdf` files for printing, `.mp3` piano audio files for rehearsal/listening, or `.ly` primary master sources / `.abc` files for personal adaptation.
- **Outcome**: User receives local copies of desired sheet music and audio assets.

#### UC-4: Score Validation & Automated Deployment
- **Actor**: Content Maintainer / GitHub Actions
- **Description**: When new or updated `.ly` primary source files are committed to the repository, automated workflows compile PDF files, render piano `.mp3` audio files, generate/validate `.abc` files, extract pure text Markdown lyrics, compile text-only lyrics PDFs, execute verification tests, and publish the static site to GitHub Pages.
- **Outcome**: Continuous deployment of verified scores, audio files, text lyrics, and updated web application from the single `.ly` primary source.

#### UC-5: Browse and Download Pure Text Lyrics
- **Actor**: End User / Educator / Singer
- **Description**: The user navigates to the lyrics collection section on GitHub Pages to read clean pure text lyrics formatted in Markdown or downloads text-only lyrics PDFs for printouts and rehearsals without score notation.
- **Outcome**: User accesses clean, readable pure text lyrics without musical notation clutter.

---

## 3. High-Level Architecture & Functional Components

```
+-------------------------------------------------------------------------+
|                        Primary Source Repository                        |
|                                                                         |
|                       +------------------------+                        |
|                       |  LilyPond Master Src   |                        |
|                       |       (src/*.ly)       |                        |
|                       +-----------+------------+                        |
+-----------------------------------|-------------------------------------+
                                    |
                                    v
+-------------------------------------------------------------------------+
|                         Asset Build Pipeline                            |
|  +-------------------+  +-----------------------+  +-----------------+  |
|  | LilyPond Compiler |  | LilyPond MIDI ->      |  | .ly -> .abc     |  |
|  |   -> Sheet PDF    |  | Piano SoundFont MP3   |  | Conversion      |  |
|  +---------+---------+  +-----------+-----------+  +--------+--------+  |
|                                                             |           |
|  +----------------------------------------------------------+--------+  |
|  | .ly -> Lyrics Extractor -> Markdown (.md) & Text-Only Lyrics PDF  |  |
|  +-----------------------------------+-------------------------------+  |
+------------|------------------------|-----------------------|-----------+
             |                        |                       |
             v                        v                       v
+----------------------+  +-----------------------+  +--------------------+
| Compiled PDF Assets  |  | Compiled Piano MP3    |  | Web Application,   |
| (Sheet & Text PDF)   |  | (build/*.mp3)         |  | Player & Text      |
+----------+-----------+  +-----------+-----------+  | Lyrics (Markdown)  |
           |                          |              +--------+-----------+
           +--------------------------+-----------------------+
                                      |
                                      v
+-------------------------------------------------------------------------+
|                     GitHub Pages Static Web Host                        |
+-------------------------------------------------------------------------+
```

### Functional Components and Business Interfaces

1. **Primary Content Repository Component**
   - *Responsibility*: Stores primary source LilyPond notation files (`.ly`) for all 25 carols alongside metadata (title, lyrics, key, tempo).
   - *Interface*: Standardized file layout and naming schema (`src/songs/<song_id>/<song_id>.ly`).

2. **Asset Build Pipeline Component**
   - *Responsibility*: Serves as the automated compilation engine that compiles `.ly` primary sources into publication-grade `.pdf` sheet music documents, synthesizes high-quality piano `.mp3` audio files via MIDI, generates/verifies `.abc` files, extracts pure text Markdown (`.md`) lyrics, and compiles standalone text-only lyrics `.pdf` documents during CI/CD.
   - *Interface*: Command-line scripts (`src/install.sh`, build tasks) producing output artifacts in `build/` or deployment directories.

3. **Web Application & Lyrics Reader Component**
   - *Responsibility*: Client-side application rendering ABC scores via `abcjs`, providing playback controls (play, pause, tempo adjustment, piano MP3 streaming), a dedicated Markdown pure text lyrics viewer, responsive layout, and direct download links for sheet music `.pdf`, text-only lyrics `.pdf`, `.mp3`, `.md`, and `.ly` files.
   - *Interface*: RESTful/static fetch of `.abc` files, `.mp3` audio, Markdown `.md` lyrics files, and static `.pdf`/`.ly` assets from the server.

4. **Hosting & Deployment Component**
   - *Responsibility*: Serves the static website assets, scores, and pre-rendered piano `.mp3` audio files over HTTPS via GitHub Pages.
   - *Interface*: HTTPS web access for end users.

---

## 4. Strategic Choices & Major Alternatives

### Strategic Choice 1: Sheet Music Source Strategy & Compilation Workflow
- **Alternative 1A (Chosen)**: LilyPond (`.ly`) Primary Master Source — Maintain `.ly` files as the single primary source of truth, compiling high-grade print PDFs directly via LilyPond and deriving `.abc` files for web rendering and audio playback.
- **Alternative 1B**: Dual Independent Primary Sources — Maintain both `.ly` and `.abc` files independently side-by-side as two primary sources.
- **Alternative 1C**: ABC Notation Primary Master Source — Maintain `.abc` files as primary source and compile them to PDF using `abcm2ps` / `abc2ps`.

*Selection Reason*: Alternative 1A establishes a single source of truth in LilyPond (`.ly`), eliminating double-entry maintenance and synchronization errors across formats. LilyPond provides superior, publication-grade musical typography for print PDFs, while automated pipeline tools derive lightweight `.abc` files for web rendering with `abcjs`.

---

### Strategic Choice 2: Web Score Rendering & Audio Synthesis Engine
- **Alternative 2A (Chosen)**: Client-Side `abcjs` Rendering & Web Audio Synth — Use `abcjs` library to parse `.abc` files directly in the user's browser, generating interactive SVG sheet music and real-time Web Audio MIDI synth audio.
- **Alternative 2B**: Pre-rendered Static Images & MP3 Audio Files — Server-side compilation of scores into SVG/PNG images and pre-rendered MP3 audio files served via standard HTML5 `<audio>` elements.
- **Alternative 2C**: MusicXML with OpenSheetMusicDisplay (OSMD) & Soundfont Player — Convert music to MusicXML and render using OSMD with a web soundfont player.

*Selection Reason*: Alternative 2A provides an optimal balance of lightweight repository footprint, immediate interactivity, responsive zooming, dynamic transposition, and low build complexity without requiring server-side audio rendering or hosting bulky media files.

---

### Strategic Choice 3: Web Application Hosting & Distribution Platform
- **Alternative 3A (Chosen)**: Static GitHub Pages Hosted via GitHub Actions Workflow — Host the static web application and assets on GitHub Pages with automated builds driven by GitHub Actions workflows.
- **Alternative 3B**: Containerized Full-Stack Web Application (Node.js/Docker) — Host a server-side web application on a cloud provider (e.g. AWS, DigitalOcean).
- **Alternative 3C**: Static Site Generation on External Jamstack Platform (Vercel / Netlify) — Deploy static web application on third-party Jamstack platforms.

*Selection Reason*: Alternative 3A seamlessly integrates with GitHub repository management, offers zero hosting overhead, provides free worldwide SSL/CDN distribution, and satisfies all requirements natively within the project environment.

---

### Strategic Choice 4: Piano MP3 Audio Synthesis Toolchain & Pipeline
- **Alternative 4A (Chosen)**: Automated LilyPond MIDI to Piano SoundFont Synthesis — Extract MIDI generated from `.ly` master sources during build, and synthesize high-quality piano `.mp3` audio files using a software synthesizer (e.g. FluidSynth/Timidity++) with an acoustic piano SoundFont within the CI/CD pipeline.
- **Alternative 4B**: Manual Studio acoustic/digital piano recordings — Record acoustic or digital piano performances manually for each song and commit static MP3 files to the repository.
- **Alternative 4C**: Client-side dynamic Web Audio recording export — Rely solely on browser-rendered MIDI/Web Audio without pre-rendering MP3 files for offline download.

*Selection Reason*: Alternative 4A guarantees automated reproducibility directly from the LilyPond primary master source, ensures exact alignment between scores and audio, avoids large repository bloat, and provides high quality piano MP3 files ready for offline distribution.

---

### Strategic Choice 5: Pure Text Lyrics Extraction & Formatting Strategy
- **Alternative 5A (Chosen)**: Automated Extraction from LilyPond (`.ly`) Primary Master Source to Markdown (`.md`) and Text PDF — Automatically extract all stanzas/lyrics from `.ly` master source files using an automated AST/regex extraction engine (`ly2lyrics.py`), outputting structured Markdown files for GitHub Pages and compiling clean text-only lyrics PDFs.
- **Alternative 5B**: Manual Pure Text Lyrics File Maintenance — Maintain separate `.txt` or `.md` lyrics files manually in `src/songs/` alongside `.ly` primary master sources.
- **Alternative 5C**: Client-Side Dynamic DOM Lyrics Extraction from ABC Notation — Parse ABC notation inside the browser via JavaScript at runtime to dynamically reconstruct pure text lyrics in the DOM without pre-generated Markdown or text PDF files.

*Selection Reason*: Alternative 5A upholds the core principle of a single primary source of truth in LilyPond (`.ly`), eliminating double-entry maintenance and synchronization risk. It generates ready-to-use, SEO-friendly Markdown files for GitHub Pages as well as clean standalone text-only lyrics PDFs during the automated build pipeline.

---

### Strategic Choice 6: Consolidated Song Booklet Compilation Architecture
- **Alternative 6A (Chosen)**: Post-processing PDF Assembler with Dynamic Overlays (`pypdf` + `fpdf2`) — Compile individual song PDFs from LilyPond first, then assemble them into a master booklet by overlaying dynamic running page numbers, prepending an artistic vector cover page, and appending an automated Table of Contents (Inhaltsverzeichnis) at the end.
- **Alternative 6B**: Single Monolithic LilyPond Master File (`booklet.ly`) — Generate one massive LilyPond source file concatenating all scores with `\bookpart` and compiling it in a single pass.
- **Alternative 6C**: LaTeX / Pandoc Wrapper Pipeline — Transcode LilyPond scores into EPS/PDF snippets and assemble the booklet using LaTeX / pdfLaTeX / XeLaTeX.

*Selection Reason*: Alternative 6A reuses already compiled song score PDFs without duplicate LilyPond compilation overhead, isolates per-song layout adjustments, guarantees robust vector graphics generation via `fpdf2`, and positions the Table of Contents at the end of the booklet while stamping accurate running page numbers on every score page.

---

## 5. Summary of Discarded Alternatives

Below is a summary of all discarded options and the rationale behind choosing the primary alternatives:

| Strategic Decision | Discarded Alternative | Rationale for Rejection |
| :--- | :--- | :--- |
| **Source Strategy** | Alt 1B: Dual Independent Sources (`.ly` and `.abc`) | Maintaining two separate primary sources leads to notation drift, mismatched lyrics, and duplicate editing effort. |
| **Source Strategy** | Alt 1C: ABC primary with `abcm2ps` | ABC-generated PDFs lack the precise, publication-grade musical typography and layout flexibility provided by LilyPond. |
| **Web Rendering** | Alt 2B: Pre-rendered SVG/PNG + MP3 | Significantly increases repository and storage size (25 MP3s); lacks dynamic playback speed controls, interactive measure highlighting, and responsive resizing. |
| **Web Rendering** | Alt 2C: MusicXML + OSMD | MusicXML files are verbose and complex to edit by hand compared to lightweight `.abc` files; requires larger Javascript bundle size and soundfont management. |
| **Hosting Platform**| Alt 3B: Containerized Node.js/Docker Server | Unnecessary runtime cost and infrastructure maintenance for serving purely static assets and client-side web application. |
| **Hosting Platform**| Alt 3C: External Jamstack (Vercel/Netlify) | Adds third-party service dependencies when GitHub Pages natively provides all required static web hosting capability for open-source repositories. |
| **Piano MP3 Synthesis** | Alt 4B: Manual Studio/Piano Recordings | Extremely time-consuming, requires studio recording equipment, and breaks automated synchronization with `.ly` source changes. |
| **Piano MP3 Synthesis** | Alt 4C: Client-Side Only Synthesis (No MP3s) | Fails to provide downloadable standalone `.mp3` audio files for users wishing to listen offline or on standard media players. |
| **Lyrics Extraction** | Alt 5B: Manual Pure Text Lyrics Files | Dual source maintenance leads to lyrics mismatch, missing stanzas, and extra manual effort across 25 carols. |
| **Lyrics Extraction** | Alt 5C: Client-Side Browser DOM Extraction | Fails to provide downloadable pure text lyrics PDFs or static Markdown pages on GitHub Pages for offline reading or search indexers. |
| **Booklet Compilation** | Alt 6B: Monolithic LilyPond `booklet.ly` | Compiling 28+ songs in a single LilyPond run consumes excessive memory, slows down builds, and complicates custom end-of-booklet TOC layout. |
| **Booklet Compilation** | Alt 6C: LaTeX / Pandoc Assembler | Adds heavy TeX Live toolchain dependencies (several gigabytes) to CI runners and installer scripts. |
