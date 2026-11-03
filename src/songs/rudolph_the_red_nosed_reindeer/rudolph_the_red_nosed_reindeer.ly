\version "2.24.0"

\header {
  title = "Rudolph the Red-Nosed Reindeer"
  composer = "Johnny Marks (1949)"
  poet = "Johnny Marks (1949)"
  tagline = ##f
}

global = {
  \key c \major
  \time 4/4
  \tempo 4 = 128
}

harmonies = \chordmode {
  % A1
  c1 | c1 | c1 | g1 |
  g1:7 | g1:7 | g1:7 | c1 |
  % A2
  c1 | c1 | c1 | g1 |
  g1:7 | g1:7 | g1:7 | c1 |
  % B (Bridge)
  f1 | c1 | d2:m g2:7 | c1 |
  f1 | c1 | d1:7 | g1:7 |
  % A3
  c1 | c1 | c1 | g1 |
  g1:7 | g1:7 | g1:7 | c1 |
}

soprano = \relative c'' {
  \global
  % A1
  g4 a4 g4 e4 |
  c'4 a4 g2 |
  g4 a4 g4 a4 |
  g2 c2 |
  b4 f4 g4 a4 |
  b4 a4 g2 |
  g4 a4 g4 f4 |
  e1 |
  % A2
  g4 a4 g4 e4 |
  c'4 a4 g2 |
  g4 a4 g4 a4 |
  g2 c2 |
  b4 f4 g4 a4 |
  b4 a4 g2 |
  g4 a4 g4 b4 |
  c1 |
  % B
  a4 a4 c4 a4 |
  g4 e4 g2 |
  f4 a4 g4 f4 |
  e1 |
  a4 a4 c4 a4 |
  g4 e4 g2 |
  e4 f4 e4 d4 |
  g2. r4 |
  % A3
  g4 a4 g4 e4 |
  c'4 a4 g2 |
  g4 a4 g4 a4 |
  g2 c2 |
  b4 f4 g4 a4 |
  b4 a4 g2 |
  g4 a4 g4 b4 |
  c1 \bar "|."
}

alto = \relative c' {
  \global
  % A1
  e4 f4 e4 c4 |
  e4 f4 e2 |
  e4 f4 e4 f4 |
  d2 d2 |
  d4 d4 d4 f4 |
  f4 f4 f2 |
  f4 f4 f4 d4 |
  c1 |
  % A2
  e4 f4 e4 c4 |
  e4 f4 e2 |
  e4 f4 e4 f4 |
  d2 d2 |
  d4 d4 d4 f4 |
  f4 f4 f2 |
  f4 f4 f4 f4 |
  e1 |
  % B
  f4 f4 f4 f4 |
  e4 c4 e2 |
  d4 f4 d4 d4 |
  c1 |
  f4 f4 f4 f4 |
  e4 c4 e2 |
  c4 c4 c4 c4 |
  b2( d4) r4 |
  % A3
  e4 f4 e4 c4 |
  e4 f4 e2 |
  e4 f4 e4 f4 |
  d2 d2 |
  d4 d4 d4 f4 |
  f4 f4 f2 |
  f4 f4 f4 f4 |
  e1 \bar "|."
}

tenor = \relative c' {
  \global
  % A1
  c4 c4 c4 g4 |
  g4 c4 c2 |
  c4 c4 c4 c4 |
  b2 a2 |
  g4 b4 b4 c4 |
  d4 c4 b2 |
  b4 c4 b4 g4 |
  g1 |
  % A2
  c4 c4 c4 g4 |
  g4 c4 c2 |
  c4 c4 c4 c4 |
  b2 a2 |
  g4 b4 b4 c4 |
  d4 c4 b2 |
  b4 c4 b4 d4 |
  c1 |
  % B
  c4 c4 a4 c4 |
  c4 g4 c2 |
  a4 c4 b4 g4 |
  g1 |
  c4 c4 a4 c4 |
  c4 g4 c2 |
  fis,4 a4 a4 fis4 |
  g2. r4 |
  % A3
  c4 c4 c4 g4 |
  g4 c4 c2 |
  c4 c4 c4 c4 |
  b2 a2 |
  g4 b4 b4 c4 |
  d4 c4 b2 |
  b4 c4 b4 d4 |
  c1 \bar "|."
}

bass = \relative c {
  \global
  % A1 (Im treble_8 kompakt im Bereich c bis c' gehalten)
  c4 c4 c4 c4 |
  c4 c4 c2 |
  c4 c4 e4 c4 |
  g'2 fis2 |
  g4 g4 g4 g4 |
  g4 g4 g2 |
  g4 g4 g4 g4 |
  c,1 |
  % A2
  c4 c4 c4 c4 |
  c4 c4 c2 |
  c4 c4 e4 c4 |
  g'2 fis2 |
  g4 g4 g4 g4 |
  g4 g4 g2 |
  g4 g4 g4 g4 |
  c,1 |
  % B
  f4 f4 f4 f4 |
  c4 c4 c2 |
  d4 d4 g4 g4 |
  c,1 |
  f4 f4 f4 f4 |
  c4 c4 c2 |
  d4 d4 d4 d4 |
  g2( f4) r4 |
  % A3
  c4 c4 c4 c4 |
  c4 c4 c2 |
  c4 c4 e4 c4 |
  g'2 fis2 |
  g4 g4 g4 g4 |
  g4 g4 g2 |
  g4 g4 g4 g4 |
  c,1 \bar "|."
}

firstVerse = \lyricmode {
  Ru -- dolph, the red -- nosed rein -- deer
  had a ve -- ry shi -- ny nose.
  And if you e -- ver saw it,
  you would e -- ven say it glows.
  All of the o -- ther rein -- deer
  used to laugh and call him names.
  They ne -- ver let poor Ru -- dolph
  join in a -- ny rein -- deer games.
  Then one fog -- gy Christ -- mas Eve
  San -- ta came to say:
  “Ru -- dolph with your nose so bright,
  won't you guide my sleigh to -- night?”
  Then how the rein -- deer loved him
  as they shou -- ted out with glee:
  “Ru -- dolph, the red -- nosed rein -- deer,
  you'll go down in his -- to -- ry!”
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
      \new Lyrics \lyricsto "soprano" \firstVerse
      \new Staff \with { instrumentName = "T / B" } <<
        \clef "treble_8"
        \new Voice = "tenor" { \voiceOne \tenor }
        \new Voice = "bass" { \voiceTwo \bass }
      >>
    >>
  >>
  \layout { }
  \midi { }
}
