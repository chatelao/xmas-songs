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
  c1 | c1 | c1 | g1:7 |
  g1:7 | g1:7 | g1:7 | c1 |
  c1 | c1 | c1 | g1:7 |
  g1:7 | g1:7 | g1:7 | c1 |
  f1 | c1 | g1:7 | c1 |
  f1 | c1 | d1:7 | g1:7 |
}

soprano = \relative c'' {
  \global
  g4 a4 g4 e4 |
  c'4 a4 g2 |
  g4 a4 g4 a4 |
  g2 d2 |
  f4 g4 f4 d4 |
  b'4 a4 g2 |
  g4 a4 g4 f4 |
  e1 |
  g4 a4 g4 e4 |
  c'4 a4 g2 |
  g4 a4 g4 a4 |
  g2 d2 |
  f4 g4 f4 d4 |
  b'4 a4 g2 |
  g4 a4 g4 b4 |
  c1 |
  a4 a4 c4 a4 |
  g4 e4 g2 |
  f4 a4 g4 f4 |
  e1 |
  a4 a4 c4 a4 |
  g4 e4 g2 |
  d4 d4 f4 e4 |
  d2 g2 \bar "|."
}

alto = \relative c' {
  \global
  e4 f4 e4 c4 |
  e4 f4 e2 |
  e4 f4 e4 f4 |
  e2 b2 |
  d4 e4 d4 b4 |
  f'4 f4 e2 |
  d4 f4 d4 d4 |
  c1 |
  e4 f4 e4 c4 |
  e4 f4 e2 |
  e4 f4 e4 f4 |
  e2 b2 |
  d4 e4 d4 b4 |
  f'4 f4 e2 |
  d4 f4 d4 f4 |
  e1 |
  f4 f4 a4 f4 |
  e4 c4 e2 |
  d4 f4 e4 d4 |
  c1 |
  f4 f4 a4 f4 |
  e4 c4 e2 |
  c4 c4 c4 c4 |
  b2 b2 \bar "|."
}

tenor = \relative c' {
  \global
  c4 c4 c4 g4 |
  g4 c4 c2 |
  c4 c4 c4 c4 |
  b2 g2 |
  g4 g4 g4 g4 |
  d'4 c4 b2 |
  b4 c4 b4 g4 |
  g1 |
  c4 c4 c4 g4 |
  g4 c4 c2 |
  c4 c4 c4 c4 |
  b2 g2 |
  g4 g4 g4 g4 |
  d'4 c4 b2 |
  b4 c4 b4 d4 |
  c1 |
  c4 c4 c4 c4 |
  c4 g4 c2 |
  b4 c4 b4 g4 |
  g1 |
  c4 c4 c4 c4 |
  c4 g4 c2 |
  fis,4 fis4 a4 g4 |
  g2 f2 \bar "|."
}

bass = \relative c {
  \global
  c4 c4 c4 c4 |
  c4 c4 c2 |
  c4 c4 c4 c4 |
  g2 g2 |
  g4 g4 g4 g4 |
  g4 g4 g2 |
  g4 g4 g4 g4 |
  c1 |
  c4 c4 c4 c4 |
  c4 c4 c2 |
  c4 c4 c4 c4 |
  g2 g2 |
  g4 g4 g4 g4 |
  g4 g4 g2 |
  g4 g4 g4 g4 |
  c1 |
  f4 f4 f4 f4 |
  c4 c4 c2 |
  g4 g4 g4 g4 |
  c1 |
  f4 f4 f4 f4 |
  c4 c4 c2 |
  d4 d4 d4 d4 |
  g,2 g2 \bar "|."
}

firstVerse = \lyricmode {
  Ru -- dolph the red -- nosed rein -- deer,
  had a ve -- ry shi -- ny nose,
  and if you e -- ver saw it,
  you would e -- ven say it glows.
  All of the o -- ther rein -- deer
  used to laugh and call him names,
  they ne -- ver let poor Ru -- dolph
  join in a -- ny rein -- deer games.
  Then one fog -- gy Christ -- mas Eve,
  San -- ta came to say:
  "Ru -- dolph with your nose so bright,
  won't you guide my sleigh to -- night?"
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
