# Goal
Eine Sammlung der 25 bekanntesten deutschen Weihnachtslieder in den Formaten .ly, .abc, PDF und MP3, eine reine Text-Liedtext-Sammlung als Markdown-Dateien auf GitHub Pages und als reine Text-PDFs sowie eine interaktive Web-Anwendung auf GitHub Pages zum Anzeigen und Abspielen der ABC-Dateien.

# Structure
- `CONCEPT.md`: The overall structure of the product, including Business & Use Cases as well as the High-Level Architecture.
- `DESIGN.md`: The detailed design of the solution, including the architecture, used tech stack for development, production and testing, etc.
- `TOP_ARCHITECTURE.puml`: The top-level component overview showing all major modules and the dataflows between them.
- `ROADMAP.md`: The list of accomplished and planned steps of the project.
- `TECHNICAL_DEBTS.md`: If you find technical debts, like outdated components, security flaws, old patterns, etc. log them here, but don’t fix them until asked to do so.
- `README.md`: Add a link to the GitHub pages web application for viewing and playing the ABC sheet music files.
- `/specification/`: External Know-How as datasheet, standards, etc. Should be converted to Markdown if PDF, etc.
- `/src/`: The source code of the project (e.g. LilyPond files, ABC files, sheet music generation scripts, and web app player source)
- `/test/`: All tools, configurations & test cases
- `/build/`: Only temporary place for compilation, may be cached by Github

# `CONCEPT.md` handling
- The `CONCEPT.md` adds the business and use cases to the top Goal of this file.
- It contains an architecture with top-level functional components and their business interfaces.
- It does not contain all precise implementation choices.
- Every major choice is first drawn out as three alternatives, the best one is chosen and the other, discarded ones kept in summary in the last chapter of the concept.

# `DESIGN.md`
- The `DESIGN.md` derives all necessary technological choices from `CONCEPT.md`.
- It contains precise implementation choices.
- Every major choice is first drawn out as three alternatives, the best one is chosen and the other, discarded ones kept in summary in the last chapter of the concept.
- It contains a detailed architecture of all components and their technical interfaces.
- Includes the `TOP_ARCHITECTURE.puml` as dynamic-rendering image as soon as available.

## GitHub Pages & ABC Web Player
- Provide an interactive web interface hosted on GitHub Pages (e.g. deployed via GitHub Actions workflow or from the `docs/` folder).
- Integrate `abcjs` (or a similar JavaScript library) to visually render `.abc` notation into sheet music scores and enable interactive audio playback (MIDI / Web Audio synth) directly in the browser.
- Allow users to select, view, and play any of the 25 Christmas songs.
- Ensure a responsive layout compatible with both desktop and mobile web browsers.

## UI / Visualisierung
- Create screenshots of UI components and the web player interface for testing and review purposes.

# `ROADMAP.md` handling
- The `ROADMAP.md` is the final plan to implement the `CONCEPT.md` and `DESIGN.md` to achieve the top goal.
- Define the steps in a way to allow for parallelization by defining interfaces only first and implementing functions later.
- The `ROADMAP.md` file is structured into several key sections:
  - **Progress Overview**: A table summarizing Phases, Descriptions, and Status (using ✅ for completed, 🚧 for in-progress, ⏳ for planned).
  - **Goals**: A high-level list of project objectives with status emojis.
  - **Phases**: Detailed chapters for each project phase.
- The Tasks, and Subtasks if necessary, have checkboxes to show the progress.
- Every task to be implemented has to be modest, feasible and reasonable.
  - If no such task is available, then break down a bigger step into modest ones without implementing anything, just changing the `ROADMAP.md`.
- Status Emojis:
  - ✅: Completed
  - 🚧: In Progress
  - ⏳: Planned / To Do
- The progress is updated with every increment.
- The finished tasks are linked to the corresponding issue and timestamped at the end of the line.

# HOWTO
- Keep `src/install.sh` to install all tools to build the application (test only tools, see below)
- Consult https://github.com/chatelao/ai-tooling for proven tool installation methods when setting up or updating installation scripts (`src/install.sh` and `test/install.sh`).
- Use “ReadTheDocs.org” (RTD) or GitHub Pages for documentation and web player publishing from the main branch.

# Testing Locally & with Github Action Workflow (GH Action WF)
- Setup the empty CI/CD pipeline before coding anything
- Write CI/CD tests independent as `test` script of the Github action workflows
- Create screenshots of each UI step tested and store it as asset of the Action Workflow for review
- Use `test/install.sh` to install test tools.
- Use the Github action workflows to run the tests after commits.
- Before committing fetch all changes from the remote repository and merge the changes
- Run the CI/CD on every commit on every branch
- Add as much caching as possible to the Github action workflows
