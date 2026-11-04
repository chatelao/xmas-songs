# German Christmas Carols Collection (Deutsche Weihnachtslieder)

Welcome to the **German Christmas Carols Collection** — an open-source library of 22 popular Christmas carols (*die beliebtesten deutschen Weihnachtslieder*).

## 🌐 Interactive Web Player

Access the interactive web sheet music player and audio synthesizer hosted on GitHub Pages:
👉 **[Interactive Web Player](https://chatelao.github.io/xmas-songs)**

---

## 🎼 Overview & Formats

This repository serves as a curated collection of sheet music and lyrics for 22 Christmas carols. All sheet music is maintained using **LilyPond (`.ly`)** as the single primary source of truth.

The collection provides:
- **LilyPond (`.ly`)**: Primary typographic master source files containing musical scores and lyrics.
- **ABC Notation (`.abc`)**: Light-weight notation derived for browser-based rendering and audio synthesis.
- **PDF Documents (Sheet Music)**: Publication-grade vector sheet music compiled directly from LilyPond.
- **Complete Song Booklet (PDF)**: Consolidated songbook (`weihnachtslieder_liederbuch.pdf`) containing all carols, continuous page numbering, festive graphical cover page, and Table of Contents (Inhaltsverzeichnis) positioned at the end.
- **MP3 Audio**: High-quality piano recordings synthesized directly from LilyPond MIDI files.
- **Markdown (`.md`)**: Pure text lyrics collection formatted as Markdown on GitHub Pages.
- **PDF Documents (Pure Text Lyrics)**: Standalone text-only lyrics documents compiled without score clutter for easy reading and printing.

---

## 📜 Song List

The collection includes the following carols:

1. **Alle Jahre wieder**
2. **Es ist ein Ros entsprungen**
3. **Fröhliche Weihnacht überall**
4. **Ihr Kinderlein, kommet**
5. **In dulci jubilo**
6. **Kling, Glöckchen, klingelingeling**
7. **Kommet, ihr Hirten**
8. **Lasst uns froh und munter sein**
9. **Leise rieselt der Schnee**
10. **Macht hoch die Tür**
11. **O du fröhliche**
12. **O Tannenbaum**
13. **Schneeflöckchen, Weissröckchen**
14. **Stille Nacht, heilige Nacht**
15. **Süsser die Glocken nie klingen**
16. **Tochter Zion, freue dich**
17. **Vom Himmel hoch, da komm ich her**
18. **Was soll das bedeuten**

### Additional Carols
- **Jingle Bells**
- **We Wish You a Merry Christmas**
- **Rudolph the Red-Nosed Reindeer**
- **Last Christmas**

---

## 🛠 Project Structure

- `CONCEPT.md`: High-level vision, use cases, and strategic choices.
- `DESIGN.md`: Detailed technological choices and architecture design.
- `ROADMAP.md`: Project implementation progress and phase tracking.
- `TECHNICAL_DEBTS.md`: Outstanding technical debt items.
- `src/`: Source code including LilyPond master files, ABC notation, and web player scripts.
