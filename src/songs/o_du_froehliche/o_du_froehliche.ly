\version "2.24.0"

\header {
  title = "O du fröhliche"
  composer = "Sizilianische Volksweise"
  poet = "Johannes Daniel Falk (1816) / Heinrich Holzschuher (1829)"
  tagline = ##f
}

global = {
  \key d \major
  \time 4/4
  \tempo 4 = 100
}

melody = \relative c'' {
  \global
  a2 b2 |
  a4. g8 fis4 g4 |
  a2 b2 |
  a4. g8 fis4 g4 |
  a2 a2 |
  b2 cis4 d4 |
  cis2 b2 |
  a1 |
  a4. b8 a4 g4 |
  fis4. g8 a2 |
  g4. a8 g4 fis4 |
  e4. fis8 g2 |
  fis2 g2 |
  a2 b4 cis4 |
  d2 cis2 |
  d1 \bar "|."
}

firstVerse = \lyricmode {
  O du fröh -- li -- che, o du se -- li -- ge,
  gnad -- brin -- gen -- de Weih -- nachts -- zeit!
  Welt ging ver -- lo -- ren, Christ ist ge -- bo -- ren:
  Freu e, freu e dich, o Chris -- ten -- heit!
}

secondVerse = \lyricmode {
  O du fröh -- li -- che, o du se -- li -- ge,
  gnad -- brin -- gen -- de Weih -- nachts -- zeit!
  Christ ist er -- schie -- nen, uns zu ver mei -- nen:
  Freu e, freu e dich, o Chris -- ten -- heit!
}

thirdVerse = \lyricmode {
  O du fröh -- li -- che, o du se -- li -- ge,
  gnad -- brin -- gen -- de Weih -- nachts -- zeit!
  Himm -- li -- sche Hee -- re jauch -- zen dir Eh -- re:
  Freu e, freu e dich, o Chris -- ten -- heit!
}

\score {
  <<
    \new Staff {
      \new Voice = "singer" { \melody }
    }
    \new Lyrics \lyricsto "singer" \firstVerse
    \new Lyrics \lyricsto "singer" \secondVerse
    \new Lyrics \lyricsto "singer" \thirdVerse
  >>
  \layout { }
  \midi { }
}
