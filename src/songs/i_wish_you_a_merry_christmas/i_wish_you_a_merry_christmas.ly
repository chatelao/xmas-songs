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

harmonies = \chordmode {
  \partial 4 s4 |
  f2. | g2.:m | c2. | f2. |
  f2. | bes2. | c2.:7 | f2 |
}

soprano = \relative c' {
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

alto = \relative c' {
  \global
  \partial 4 c4 |
  c4 c8 e8 c8 c8 |
  bes4 bes4 d4 |
  d4 d8 f8 d8 d8 |
  c4 c4 c4 |
  c4 c8 d8 c8 bes8 |
  a4 bes4 a8 a8 |
  bes4 d4 c4 |
  c2 \bar "|."
}

tenor = \relative c' {
  \global
  \partial 4 a4 |
  a4 a8 bes8 a8 g8 |
  f4 f4 f4 |
  b4 b8 b8 b8 b8 |
  g4 e4 e4 |
  f4 f8 f8 f8 e8 |
  f4 f4 f8 f8 |
  f4 bes4 g4 |
  a2 \bar "|."
}

bass = \relative c {
  \global
  \partial 4 f4 |
  f4 f8 f8 f8 f8 |
  bes,4 bes4 bes4 |
  g4 g8 g8 g8 g8 |
  c4 c4 c4 |
  f4 f8 f8 f8 f8 |
  d4 bes4 f8 f8 |
  bes4 g4 c4 |
  f,2 \bar "|."
}

firstVerse = \lyricmode {
  I wish you a mer -- ry Christ -- mas,
  I wish you a mer -- ry Christ -- mas,
  I wish you a mer -- ry Christ -- mas,
  and a hap -- py New Year!
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
