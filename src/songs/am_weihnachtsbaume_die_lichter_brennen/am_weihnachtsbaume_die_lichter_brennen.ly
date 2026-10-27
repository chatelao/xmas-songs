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

harmonies = \chordmode {
  g2 | g2 | d2:7 | g2 |
  g2 | g2 | d2:7 | g2 |
  g2 | c2 | d2:7 | g2 |
  g2 | g2 | d2:7 | g2 |
}

soprano = \relative c' {
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

alto = \relative c' {
  \global
  b8. c16 b8 d8 |
  g4. e8 |
  fis8 e8 fis8 d8 |
  d2 |
  b8. c16 b8 d8 |
  g4. e8 |
  fis8 e8 fis8 d8 |
  d2 |
  g8. a16 b8 g8 |
  g4 e8 r8 |
  fis8. g16 a8 fis8 |
  g4 d8 r8 |
  b8. c16 b8 d8 |
  g4. e8 |
  fis8 e8 fis8 d8 |
  d2 \bar "|."
}

tenor = \relative c' {
  \global
  g8. g16 g8 b8 |
  d4. b8 |
  c8 b8 c8 c8 |
  b2 |
  g8. g16 g8 b8 |
  d4. b8 |
  c8 b8 c8 c8 |
  b2 |
  d8. d16 d8 d8 |
  e4 c8 r8 |
  d8. d16 d8 c8 |
  d4 b8 r8 |
  g8. g16 g8 b8 |
  d4. b8 |
  c8 b8 c8 c8 |
  b2 \bar "|."
}

bass = \relative c {
  \global
  g8. g16 g8 g8 |
  g4. e'8 |
  d8 e8 d8 d8 |
  g,2 |
  g8. g16 g8 g8 |
  g4. e'8 |
  d8 e8 d8 d8 |
  g,2 |
  g'8. g16 g8 g8 |
  c,4 c8 r8 |
  d8. d16 d8 d8 |
  g,4 g8 r8 |
  g8. g16 g8 g8 |
  g4. e'8 |
  d8 e8 d8 d8 |
  g,2 \bar "|."
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
    \new ChordNames {
      \set chordChanges = ##t
      \harmonies
    }
    \new ChoirStaff <<
      \new Staff \with { instrumentName = "S / A" } <<
        \clef treble
        \new Voice = "soprano" { \voiceOne \soprano }
        \new Voice = "alto" { \voiceTwo \alto }
      >>
      \new Staff \with { instrumentName = "T / B" } <<
        \clef "treble_8"
        \new Voice = "tenor" { \voiceOne \tenor }
        \new Voice = "bass" { \voiceTwo \bass }
      >>
    >>
    \new Lyrics \lyricsto "soprano" \firstVerse
    \new Lyrics \lyricsto "soprano" \secondVerse
  >>
  \layout { }
  \midi { }
}
