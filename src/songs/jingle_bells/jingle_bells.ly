\version "2.24.0"

\header {
  title = "Jingle Bells"
  composer = "James Lord Pierpont (1857)"
  poet = "James Lord Pierpont (1857)"
  tagline = ##f
}

global = {
  \key g \major
  \time 4/4
  \tempo 4 = 112
}

melody = \relative c'' {
  \global
  b4 b4 b2 |
  b4 b4 b2 |
  b4 d4 g,4. a8 |
  b1 |
  c4 c4 c4. c8 |
  c4 b4 b4 b8 b8 |
  b4 a4 a4 b4 |
  a2 d2 |
  b4 b4 b2 |
  b4 b4 b2 |
  b4 d4 g,4. a8 |
  b1 |
  c4 c4 c4. c8 |
  c4 b4 b4 b8 b8 |
  d4 d4 c4 a4 |
  g1 \bar "|."
}

firstVerse = \lyricmode {
  Jin -- gle bells, jin -- gle bells,
  jin -- gle all the way!
  O what fun it is to ride
  in a one -- horse o -- pen sleigh, hey!
  Jin -- gle bells, jin -- gle bells,
  jin -- gle all the way!
  O what fun it is to ride
  in a one -- horse o -- pen sleigh!
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
