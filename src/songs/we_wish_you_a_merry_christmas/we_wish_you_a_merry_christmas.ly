\version "2.24.0"

\header {
  title = "We Wish You a Merry Christmas"
  composer = "Traditionell (England)"
  poet = "Traditionell"
  tagline = ##f
}

global = {
  \key g \major
  \time 3/4
  \tempo 4 = 120
}

melody = \relative c' {
  \global
  \partial 4 d4 |
  g4 g8 a8 g8 fis8 |
  e4 e4 e4 |
  a4 a8 b8 a8 g8 |
  fis4 d4 d4 |
  b'4 b8 c8 b8 a8 |
  g4 e4 d8 d8 |
  e4 a4 fis4 |
  g2 d4 \bar "||"
  g4 g4 g4 |
  fis2 fis4 |
  g4 fis4 e4 |
  d2 a'4 |
  b4 a4 g4 |
  d'4 d,4 d8 d8 |
  e4 a4 fis4 |
  g2 \bar "|."
}

firstVerse = \lyricmode {
  We wish you a mer -- ry Christ -- mas,
  we wish you a mer -- ry Christ -- mas,
  we wish you a mer -- ry Christ -- mas
  and a hap -- py New Year!
  Good ti -- dings we bring to you and your kin,
  We wish you a mer -- ry Christ -- mas
  and a hap -- py New Year!
}

secondVerse = \lyricmode {
  Wir wün -- schen dir fro -- he Weih -- nach -- ten,
  wir wün -- schen dir fro -- he Weih -- nach -- ten,
  wir wün -- schen dir fro -- he Weih -- nach -- ten
  und ein glück -- li -- ches neu -- es Jahr!
  Gu -- te Nach -- rich -- ten brin -- gen wir dir und dei -- nen Ver -- wand -- ten,
  wir wün -- schen dir fro -- he Weih -- nach -- ten
  und ein glück -- li -- ches neu -- es Jahr!
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
