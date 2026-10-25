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

melody = \relative c' {
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
    \new Staff {
      \new Voice = "singer" { \melody }
    }
    \new Lyrics \lyricsto "singer" \firstVerse
    \new Lyrics \lyricsto "singer" \secondVerse
  >>
  \layout { }
  \midi { }
}
