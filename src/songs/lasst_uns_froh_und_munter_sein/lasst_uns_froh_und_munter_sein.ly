\version "2.24.0"

\header {
  title = "Lasst uns froh und munter sein"
  composer = "Traditionell"
  poet = "Volkslied aus dem Hunsrück (19. Jh.)"
  tagline = ##f
}

global = {
  \key g \major
  \time 2/4
  \tempo 4 = 100
}

harmonies = \chordmode {
  g2 | d2:7 | g4 d4:7 | g2 |
  g2 | c2 | g4 d4:7 | g2 |
  g2 | d2 | g2 | d2 |
  g2 | d2:7 | g4 d4:7 | g2 |
}

soprano = \relative c' {
  \global
  g'4 g8 g8 |
  a4 a8 a8 |
  b4 a4 |
  g2 |
  d'4 d8 d8 |
  c4 c8 c8 |
  b4 a4 |
  g2 |
  d'4 c4 |
  b4 a4 |
  d4 c4 |
  b4 a4 |
  g4 g8 g8 |
  a4 a8 a8 |
  b4 a4 |
  g2 \bar "|."
}

alto = \relative c' {
  \global
  d4 d8 d8 |
  fis4 fis8 fis8 |
  g4 fis4 |
  d2 |
  g4 g8 g8 |
  g4 g8 g8 |
  g4 fis4 |
  d2 |
  g4 e4 |
  g4 fis4 |
  g4 e4 |
  g4 fis4 |
  d4 d8 d8 |
  fis4 fis8 fis8 |
  g4 fis4 |
  d2 \bar "|."
}

tenor = \relative c' {
  \global
  b4 b8 b8 |
  c4 c8 c8 |
  d4 c4 |
  b2 |
  b4 b8 b8 |
  c4 c8 c8 |
  d4 c4 |
  b2 |
  b4 g4 |
  d'4 d4 |
  b4 g4 |
  d'4 d4 |
  b4 b8 b8 |
  c4 c8 c8 |
  d4 c4 |
  b2 \bar "|."
}

bass = \relative c {
  \global
  g'4 g8 g8 |
  d4 d8 d8 |
  g,4 d'4 |
  g,2 |
  g'4 g8 g8 |
  e4 e8 e8 |
  d4 d4 |
  g,2 |
  g'4 c,4 |
  g'4 d4 |
  g4 c,4 |
  g'4 d4 |
  g,4 g8 g8 |
  d'4 d8 d8 |
  g,4 d'4 |
  g,2 \bar "|."
}

firstVerse = \lyricmode {
  Lasst uns froh und mun -- ter sein
  und uns in dem Herrn er -- freu'n!
  Lus -- tig, lus -- tig, tral -- le -- ral -- le -- ra!
  Bald ist Ni -- ko -- laus -- abend da,
  bald ist Ni -- ko -- laus -- abend da!
}

secondVerse = \lyricmode {
  Bald ist un -- sre Schut -- ze -- zeit,
  dann ist gro -- sse Freu -- de weit!
  Lus -- tig, lus -- tig, tral -- le -- ral -- le -- ra!
  Bald ist Ni -- ko -- laus -- abend da,
  bald ist Ni -- ko -- laus -- abend da!
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
