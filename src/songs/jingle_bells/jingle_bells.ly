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

harmonies = \chordmode {
  g1 | g1 | g1 | g1 |
  c1 | g1 | a1:7 | d1:7 |
  g1 | g1 | g1 | g1 |
  c1 | g1 | d1:7 | g1 |
}

soprano = \relative c'' {
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

alto = \relative c' {
  \global
  g'4 g4 g2 |
  g4 g4 g2 |
  g4 b4 d,4. fis8 |
  g1 |
  g4 g4 g4. g8 |
  g4 g4 g4 g8 g8 |
  g4 e4 e4 g4 |
  fis2 fis2 |
  g4 g4 g2 |
  g4 g4 g2 |
  g4 b4 d,4. fis8 |
  g1 |
  g4 g4 g4. g8 |
  g4 g4 g4 g8 g8 |
  fis4 fis4 fis4 fis4 |
  d1 \bar "|."
}

tenor = \relative c' {
  \global
  d4 d4 d2 |
  d4 d4 d2 |
  d4 d4 b4. d8 |
  d1 |
  e4 e4 e4. e8 |
  e4 d4 d4 d8 d8 |
  cis4 cis4 cis4 cis4 |
  c2 c2 |
  d4 d4 d2 |
  d4 d4 d2 |
  d4 d4 b4. d8 |
  d1 |
  e4 e4 e4. e8 |
  e4 d4 d4 d8 d8 |
  c4 c4 d4 c4 |
  b1 \bar "|."
}

bass = \relative c {
  \global
  g'4 g4 g2 |
  g4 g4 g2 |
  g4 g4 g,4. g8 |
  g'1 |
  c,4 c4 c4. c8 |
  g'4 g4 g4 g8 g8 |
  a,4 a4 a4 a4 |
  d2 d2 |
  g4 g4 g2 |
  g4 g4 g2 |
  g4 g4 g,4. g8 |
  g'1 |
  c,4 c4 c4. c8 |
  g'4 g4 g4 g8 g8 |
  d4 d4 d4 d4 |
  g,1 \bar "|."
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
  >>
  \layout { }
  \midi { }
}
