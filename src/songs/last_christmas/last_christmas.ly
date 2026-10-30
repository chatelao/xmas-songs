\version "2.24.0"

\header {
  title = "Last Christmas"
  composer = "George Michael (1984)"
  poet = "George Michael (1984)"
  tagline = ##f
}

global = {
  \key d \major
  \time 4/4
  \tempo 4 = 108
}

harmonies = \chordmode {
  d1 | d1 | b1:m | b1:m |
  e1:m | e1:m | a1 | a1 |
  d1 | d1 | b1:m | b1:m |
  e1:m | e1:m | a1 | a1 |
}

soprano = \relative c'' {
  \global
  a4. fis8 a4. fis8 |
  a4 a8 b8 a4 fis4 |
  fis4. d8 fis4. d8 |
  fis4 fis8 g8 fis4 d4 |
  e4. e8 e4 fis4 |
  g4 g8 fis8 e4 d4 |
  e4. e8 e4 fis4 |
  e2 d2 |
  a'4. fis8 a4. fis8 |
  a4 a8 b8 a4 fis4 |
  fis4. d8 fis4. d8 |
  fis4 fis8 g8 fis4 d4 |
  e4. e8 e4 fis4 |
  g4 g8 fis8 e4 d4 |
  e4 e4 fis4 e4 |
  d1 \bar "|."
}

alto = \relative c' {
  \global
  fis4. d8 fis4. d8 |
  fis4 fis8 g8 fis4 d4 |
  d4. b8 d4. b8 |
  d4 d8 e8 d4 b4 |
  b4. b8 b4 d4 |
  e4 e8 d8 cis4 b4 |
  cis4. cis8 cis4 d4 |
  cis2 a2 |
  fis'4. d8 fis4. d8 |
  fis4 fis8 g8 fis4 d4 |
  d4. b8 d4. b8 |
  d4 d8 e8 d4 b4 |
  b4. b8 b4 d4 |
  e4 e8 d8 cis4 b4 |
  cis4 cis4 d4 cis4 |
  a1 \bar "|."
}

tenor = \relative c' {
  \global
  a4. a8 a4. a8 |
  a4 a8 a8 a4 a4 |
  b4. fis8 b4. fis8 |
  b4 b8 b8 b4 fis4 |
  g4. g8 g4 a4 |
  b4 b8 a8 g4 g4 |
  a4. a8 a4 a4 |
  g2 f2 |
  a4. a8 a4. a8 |
  a4 a8 a8 a4 a4 |
  b4. fis8 b4. fis8 |
  b4 b8 b8 b4 fis4 |
  g4. g8 g4 a4 |
  b4 b8 a8 g4 g4 |
  a4 a4 a4 g4 |
  fis1 \bar "|."
}

bass = \relative c {
  \global
  d4. d8 d4. d8 |
  d4 d8 d8 d4 d4 |
  b4. b8 b4. b8 |
  b4 b8 b8 b4 b4 |
  e4. e8 e4 e4 |
  e4 e8 e8 e4 e4 |
  a,4. a8 a4 a4 |
  a2 a2 |
  d4. d8 d4. d8 |
  d4 d8 d8 d4 d4 |
  b4. b8 b4. b8 |
  b4 b8 b8 b4 b4 |
  e4. e8 e4 e4 |
  e4 e8 e8 e4 e4 |
  a,4 a4 a4 a4 |
  d1 \bar "|."
}

firstVerse = \lyricmode {
  Last Christ -- mas I gave you my heart,
  but the ve -- ry next day you gave it a -- way.
  This year, to save me from tears,
  I'll give it to some -- one spe -- cial.
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
