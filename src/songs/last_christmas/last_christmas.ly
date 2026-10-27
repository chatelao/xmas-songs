\version "2.24.0"

\header {
  title = "Last Christmas"
  composer = "George Michael (1984)"
  poet = "George Michael (1984)"
  tagline = ##f
}

global = {
  \key c \major
  \time 4/4
  \tempo 4 = 108
}

harmonies = \chordmode {
  c1 | a1:m | d1:m | g1 |
  c1 | a1:m | d1:m | g1 |
}

soprano = \relative c'' {
  \global
  c4. c8 c4. b8 |
  a4 a4 a2 |
  d4. d8 d4. c8 |
  b4 a4 g2 |
  c4. c8 c4. b8 |
  a4. a8 a4 b4 |
  c4. a8 g4. f8 |
  e2. r4 \bar "|."
}

alto = \relative c' {
  \global
  g'4. g8 g4. g8 |
  e4 e4 e2 |
  f4. f8 f4. f8 |
  d4 d4 d2 |
  g4. g8 g4. g8 |
  e4. e8 e4 e4 |
  f4. f8 d4. d8 |
  c2. r4 \bar "|."
}

tenor = \relative c' {
  \global
  e4. e8 e4. d8 |
  c4 c4 c2 |
  a4. a8 a4. a8 |
  b4 c4 b2 |
  e4. e8 e4. d8 |
  c4. c8 c4 d4 |
  d4. c8 b4. a8 |
  g2. r4 \bar "|."
}

bass = \relative c {
  \global
  c4. c8 c4. c8 |
  a4 a4 a2 |
  d4. d8 d4. d8 |
  g,4 g,4 g2 |
  c4. c8 c4. c8 |
  a4. a8 a4 a4 |
  d4. d8 g,4. g,8 |
  c2. r4 \bar "|."
}

firstVerse = \lyricmode {
  Last Christ -- mas I gave you my heart,
  but the ve -- ry next day you gave it a -- way.
  This year, to save me from tears,
  I'll give it to some -- one spe -- cial.
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
