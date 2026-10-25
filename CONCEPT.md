# Concept: German Christmas Carols Collection & Interactive Web Player

## 1. Goal and Vision

The primary goal of this project is to curate and publish an open-source collection of the **25 most popular German Christmas carols** (*die 25 bekanntesten deutschen Weihnachtslieder*).

The repository is maintained with **LilyPond (`.ly`)** as the single primary source of truth for all sheet music.

All output formats are compiled and published strictly as **generated release assets** (build artifacts / release releases) via automated CI/CD build pipelines:
- **LilyPond (`.ly`)**: Primary typographic master source files stored in source control.
- **ABC Notation (`.abc`)**: Derived release asset generated from `.ly` for web rendering and score interchange.
- **PDF (`.pdf`)**: Ready-to-print, publication-grade vector sheet music compiled directly from `.ly` primary sources for GitHub Releases and downloads.
- **MP3 (`.mp3`)**: Synthesized audio release asset compiled from MIDI/LilyPond output for downloadable offline listening and media distribution.

Additionally, the project provides an interactive web application hosted on **GitHub Pages**. This web application leverages `abcjs` to dynamically render sheet music scores and provide real-time audio playback (MIDI/Web Audio synthesis) directly in modern web browsers across desktop and mobile devices, referencing the generated release assets.

---

## 2. Business & Use Cases

### Business Goals
1. **Single Source of Truth**: Maintain all musical content and lyrics solely in LilyPond (`.ly`) format within source control to eliminate version drift and duplicate maintenance.
2. **Automated Release Asset Generation**: Compile `.pdf`, `.abc`, and `.mp3` files as build artifacts published in GitHub Releases / deployment builds.
3. **Accessibility**: Provide free, accessible, and high-quality Christmas carol scores to musicians, choirs, teachers, and families.
4. **Interactivity**: Allow users to listen to and view scores online without requiring specialized sheet music software.
5. **Portability**: Offer downloadable release assets (`.pdf`, `.abc`, `.mp3`, `.ly`) for offline printing, listening, and editing.
6. **Automation**: Establish a robust CI/CD workflow to validate LilyPond source notation, compile release assets (`.pdf`, `.abc`, `.mp3`), and automatically deploy the web application.

### Key Use Cases

#### UC-1: Browse Song Catalog
- **Actor**: End User (Musician / Listener)
- **Description**: The user navigates to the web application and views a list of all 25 German Christmas carols organized alphabetically or by category.
- **Outcome**: User selects a song to display its sheet music and lyrics.

#### UC-2: Render Sheet Music & Play Audio
- **Actor**: End User
- **Description**: Upon selecting a song, the web application dynamically renders the score using `abcjs` (from generated `.abc` assets). The user can press play to listen to synthesized audio playback (via Web Audio API / MIDI or embedded `.mp3` release asset) synchronized with the score.
- **Outcome**: Interactive score display and audible playback directly in the browser.

#### UC-3: Download Music Release Assets
- **Actor**: End User / Choir Conductor / Arranger
- **Description**: From the song detail view or GitHub Releases, the user downloads generated `.pdf` files for printing, `.mp3` files for offline listening, or `.ly` / `.abc` files for personal adaptation.
- **Outcome**: User receives local copies of desired sheet music and audio release assets.

#### UC-4: Automated Release Build Pipeline
- **Actor**: Content Maintainer / GitHub Actions
- **Description**: When new or updated `.ly` primary source files are committed, automated CI/CD workflows compile PDF documents, derive `.abc` notation, synthesize `.mp3` audio files, publish release packages to GitHub Releases, and deploy the web application.
- **Outcome**: Continuous automated delivery of verified release assets and updated web application from `.ly` primary sources.

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
|                    CI/CD Asset Build Pipeline                           |
|  +--------------------+  +--------------------+  +-------------------+  |
|  | LilyPond -> PDF    |  | .ly -> .abc        |  | MIDI/MIDI -> MP3  |  |
|  +---------+----------+  +---------+----------+  +---------+---------+  |
+------------|-----------------------|-----------------------|------------+
             |                       |                       |
             v                       v                       v
+-----------------------+ +---------------------+ +-----------------------+
|  Generated PDF Asset  | | Generated ABC Asset | |  Generated MP3 Asset  |
|     (build/*.pdf)     | |    (build/*.abc)    | |     (build/*.mp3)     |
+------------+----------+ +----------+----------+ +----------+------------+
             |                       |                       |
             +-----------------------+-----------------------+
                                     |
                                     v
+-------------------------------------------------------------------------+
|                 GitHub Releases & GitHub Pages Host                     |
+-------------------------------------------------------------------------+
```

### Functional Components and Business Interfaces

1. **Primary Content Repository Component**
   - *Responsibility*: Stores primary source LilyPond notation files (`.ly`) for all 25 carols alongside metadata (title, lyrics, key, tempo). Clean separation: no generated `.pdf`, `.abc`, or `.mp3` files are stored in source code control.
   - *Interface*: Standardized file layout and naming schema (`src/songs/<song_id>/<song_id>.ly`).

2. **Asset Build Pipeline Component**
   - *Responsibility*: Serves as the automated compilation engine that compiles `.ly` primary sources into publication-grade `.pdf` documents, derives `.abc` notation, and synthesizes `.mp3` audio files during CI/CD.
   - *Interface*: Command-line scripts (`src/install.sh`, build tasks) producing output artifacts in `build/` or release bundles.

3. **Web Player Component**
   - *Responsibility*: Client-side application rendering ABC scores via `abcjs`, providing playback controls (play, pause, tempo adjustment), responsive layout, and direct download links for generated `.pdf`, `.abc`, `.mp3`, and `.ly` files.
   - *Interface*: RESTful/static fetch of generated `.abc` files and static release assets (`.pdf`, `.mp3`) from the server/release host.

4. **Hosting & Deployment Component**
   - *Responsibility*: Serves static website assets over HTTPS via GitHub Pages and hosts compiled release assets (`.pdf`, `.abc`, `.mp3`) via GitHub Releases and GitHub Pages build artifacts.
   - *Interface*: HTTPS web access and download endpoints for end users.

---

## 4. Strategic Choices & Major Alternatives

### Strategic Choice 1: Sheet Music Source & Asset Delivery Strategy
- **Alternative 1A (Chosen)**: LilyPond (`.ly`) Primary Master Source with Generated Release Assets — Maintain `.ly` files as the single primary source in git repository, compiling `.pdf`, `.abc`, and `.mp3` assets solely as build outputs in CI/CD and publishing them as GitHub Release assets.
- **Alternative 1B**: Dual Independent Primary Sources Committed to Git — Maintain both `.ly` and `.abc` files directly in source control alongside manually exported `.pdf` and `.mp3` binaries.
- **Alternative 1C**: ABC Notation Primary Master Source — Maintain `.abc` files as primary source in git and generate `.pdf`/`.mp3` files using `abcm2ps` and MIDI synthesis.

*Selection Reason*: Alternative 1A establishes a single source of truth in `.ly`, keeping the git repository clean of generated binary artifacts (`.pdf`, `.mp3`) and derived notation (`.abc`), while ensuring 100% reproducible build pipelines for release distribution.

---

### Strategic Choice 2: Web Score Rendering & Audio Synthesis Engine
- **Alternative 2A (Chosen)**: Client-Side `abcjs` Rendering & Web Audio Synth with Fallback MP3 Download — Use `abcjs` library to parse generated `.abc` files in the browser for interactive SVG rendering and Web Audio MIDI synth playback, while offering pre-synthesized `.mp3` release assets for offline download.
- **Alternative 2B**: Pre-rendered Static Images & MP3 Audio Files Only — Server-side compilation of scores into SVG/PNG images and MP3 files served via standard HTML5 `<audio>` elements without client-side ABC parsing.
- **Alternative 2C**: MusicXML with OpenSheetMusicDisplay (OSMD) & Soundfont Player — Convert music to MusicXML and render using OSMD with a web soundfont player.

*Selection Reason*: Alternative 2A provides interactive score rendering, playback speed control, measure highlighting, and lightweight web delivery while ensuring users can also download generated `.mp3` files as release assets.

---

### Strategic Choice 3: Web Application Hosting & Distribution Platform
- **Alternative 3A (Chosen)**: Static GitHub Pages & GitHub Releases via Actions Workflow — Host the static web application on GitHub Pages and distribute compiled `.pdf`, `.abc`, `.mp3`, and source `.ly` archives as official GitHub Release assets via GitHub Actions.
- **Alternative 3B**: Containerized Full-Stack Web Application (Node.js/Docker) — Host a server-side web application on a cloud provider (e.g. AWS, DigitalOcean).
- **Alternative 3C**: Static Site Generation on External Jamstack Platform (Vercel / Netlify) — Deploy static web application on third-party Jamstack platforms.

*Selection Reason*: Alternative 3A seamlessly integrates with GitHub repository management, provides zero-cost distribution, natively supports GitHub Release asset storage for binary files (`.pdf`, `.mp3`), and automates deployment.

---

## 5. Summary of Discarded Alternatives

Below is a summary of all discarded options and the rationale behind choosing the primary alternatives:

| Strategic Decision | Discarded Alternative | Rationale for Rejection |
| :--- | :--- | :--- |
| **Source Strategy** | Alt 1B: Dual Independent Sources & Committed Binaries | Committing binary `.pdf`/`.mp3` and duplicate `.abc` files to git bloats repository history, leads to notation drift, and causes merge conflicts. |
| **Source Strategy** | Alt 1C: ABC primary with `abcm2ps` | ABC-generated PDFs lack the precise, publication-grade musical typography and layout flexibility provided by LilyPond. |
| **Web Rendering** | Alt 2B: Pre-rendered Static Images & MP3 Only | Lacks dynamic playback speed controls, interactive measure highlighting, responsive zooming, and client-side transposition. |
| **Web Rendering** | Alt 2C: MusicXML + OSMD | MusicXML files are verbose and complex to edit by hand compared to LilyPond `.ly` files; requires larger Javascript bundle size and soundfont management. |
| **Hosting Platform**| Alt 3B: Containerized Node.js/Docker Server | Unnecessary runtime cost and infrastructure maintenance for serving purely static assets and client-side web application. |
| **Hosting Platform**| Alt 3C: External Jamstack (Vercel/Netlify) | Adds third-party service dependencies when GitHub Pages and GitHub Releases natively provide all required distribution channels. |
