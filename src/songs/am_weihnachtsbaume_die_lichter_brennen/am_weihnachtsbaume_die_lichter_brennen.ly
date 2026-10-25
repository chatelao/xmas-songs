\version "2.24.0"

\header {
  title = "Am Weihnachtsbaume die Lichter brennen"
  composer = "Traditionell"
  poet = "Hermann Kletke (1841)"
  tagline = ##f
}

global = {
  \key g \major
  \time 2/4
  \tempo 4 = 72
}

melody = \relative c' {
  \global
  d8. e16 d8 g8 |
  b4. g8 |
  a8 g8 a8 b8 |
  g2 |
  d8. e16 d8 g8 |
  b4. g8 |
  a8 g8 a8 b8 |
  g2 |
  b8. c16 d8 b8 |
  c4 a8 r8 |
  a8. b16 c8 a8 |
  b4 g8 r8 |
  d8. e16 d8 g8 |
  b4. g8 |
  a8 g8 a8 b8 |
  g2 \bar "|."
}

firstVerse = \lyricmode {
  Am Weih -- nachts -- bau -- me die Lich -- ter bren -- nen,
  wie glänzt er fest -- lich, wie weiss und mild!
  O lass zu sei -- nen hel -- len Schein uns tre -- ten,
  und schau -- en der Weih -- nacht gol -- de -- nes Bild!
}

secondVerse = \lyricmode {
  Die Kin -- der ste -- hen mit hel -- len Bli -- cken,
  das Au -- ge strahlt und das Her -- ze springt.
  Sie ger -- ne woll'n nach den Ga -- ben grei -- fen,
  die in -- nig die lie -- be Mut -- ter ih -- nen bringt.
}

\score {
  <<
    \new Staff {
      \new Voice = "singer" { \melody }
    }
    \new Lyrics \lyricsto "singer" \firstVerse
    \new Lyrics \lyricsto "singer" \secondVerse
  >>
  \layout { }
  \midi { }
}
