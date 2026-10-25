\version "2.24.0"

\header {
  title = "I Wish You a Merry Christmas"
  composer = "Englisches Volkslied"
  poet = "Traditionell"
  tagline = ##f
}

global = {
  \key f \major
  \time 3/4
  \tempo 4 = 120
}

melody = \relative c' {
  \global
  \partial 4 c4 |
  f4 f8 g8 f8 e8 |
  d4 d4 d4 |
  g4 g8 a8 g8 f8 |
  e4 c4 c4 |
  a'4 a8 bes8 a8 g8 |
  f4 d4 c8 c8 |
  d4 g4 e4 |
  f2 \bar "|."
}

firstVerse = \lyricmode {
  I wish you a mer -- ry Christ -- mas,
  I wish you a mer -- ry Christ -- mas,
  I wish you a mer -- ry Christ -- mas,
  and a hap -- py New Year!
}

\score {
  <<
    \new Staff {
      \new Voice = "singer" { \melody }
    }
    \new Lyrics \lyricsto "singer" \firstVerse
  >>
  \layout { }
  \midi { }
}
