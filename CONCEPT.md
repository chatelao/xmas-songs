# Concept: German Christmas Carols Collection & Interactive Web Player

## 1. Goal and Vision

The primary goal of this project is to curate and publish an open-source collection of the **25 most popular German Christmas carols** (*die 25 bekanntesten deutschen Weihnachtslieder*).

The collection will be maintained with **LilyPond (`.ly`)** as the single primary source of truth for all sheet music.

The final assets made available include:
- **LilyPond (`.ly`)**: Primary typographic master source files containing musical score and lyrics.
- **ABC Notation (`.abc`)**: Derived or compiled text-based notation for web rendering and audio synthesis.
- **PDF**: Ready-to-print, publication-grade vector sheet music compiled directly from the `.ly` master source.

Additionally, the project provides an interactive web application hosted on **GitHub Pages**. This web application leverages `abcjs` to dynamically render sheet music scores and provide real-time audio playback (MIDI/Web Audio synthesis) directly in modern web browsers across desktop and mobile devices.

---

## 2. Business & Use Cases

### Business Goals
1. **Single Source of Truth**: Maintain all musical content and lyrics primarily in LilyPond (`.ly`) format to prevent synchronization errors between formats.
2. **Accessibility**: Provide free, accessible, and high-quality Christmas carol scores to musicians, choirs, teachers, and families.
3. **Interactivity**: Allow users to listen to and view scores online without requiring specialized sheet music software.
4. **Portability**: Offer downloadable digital assets (`.ly`, `.abc`, `.pdf`) for offline printing and editing in notation software.
5. **Automation**: Establish a robust CI/CD workflow to validate LilyPond source notation, compile PDFs and derived ABC files, and automatically deploy the web application.

### Key Use Cases

#### UC-1: Browse Song Catalog
- **Actor**: End User (Musician / Listener)
- **Description**: The user navigates to the web application and views a list of all 25 German Christmas carols organized alphabetically or by category.
- **Outcome**: User selects a song to display its sheet music and lyrics.

#### UC-2: Render Sheet Music & Play Audio
- **Actor**: End User
- **Description**: Upon selecting a song, the web application dynamically renders the score using `abcjs` (from the derived ABC files). The user can press play to listen to a synthesized audio playback (via Web Audio API / MIDI) synchronized with the score.
- **Outcome**: Interactive score display and audible playback directly in the browser.

#### UC-3: Download Music Assets
- **Actor**: End User / Choir Conductor / Arranger
- **Description**: From the song detail view or download directory, the user downloads `.pdf` files for printing, or `.ly` primary master sources / `.abc` files for personal adaptation.
- **Outcome**: User receives local copies of desired sheet music assets.

#### UC-4: Score Validation & Automated Deployment
- **Actor**: Content Maintainer / GitHub Actions
- **Description**: When new or updated `.ly` primary source files are committed to the repository, automated workflows compile PDF files, generate/validate `.abc` files, execute verification tests, and publish the static site to GitHub Pages.
- **Outcome**: Continuous deployment of verified scores and updated web application from the single `.ly` primary source.

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
|  +-------------------------------+    +------------------------------+  |
|  | LilyPond Compiler -> PDF      |    | .ly -> .abc Conversion       |  |
|  +---------------+---------------+    +--------------+---------------+  |
+------------------|-----------------------------------|------------------+
                   |                                   |
                   v                                   v
+----------------------------------+    +---------------------------------+
|      Compiled PDF Assets         |    |   Web Application & Player      |
|           (build/*.pdf)          |    |     (HTML5 / JS / abcjs)        |
+------------------+---------------+    +--------------+------------------+
                   |                                   |
                   +-------------------+---------------+
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
   - *Responsibility*: Serves as the automated compilation engine that compiles `.ly` primary sources into publication-grade `.pdf` documents and generates/verifies `.abc` files for web playback during CI/CD.
   - *Interface*: Command-line scripts (`src/install.sh`, build tasks) producing output artifacts in `build/` or deployment directories.

3. **Web Player Component**
   - *Responsibility*: Client-side application rendering ABC scores via `abcjs`, providing playback controls (play, pause, tempo adjustment), responsive layout, and direct download links for `.pdf` and `.ly` files.
   - *Interface*: RESTful/static fetch of `.abc` files and static `.pdf`/`.ly` assets from the server.

4. **Hosting & Deployment Component**
   - *Responsibility*: Serves the static website assets, scores, and audio engine assets over HTTPS via GitHub Pages.
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
