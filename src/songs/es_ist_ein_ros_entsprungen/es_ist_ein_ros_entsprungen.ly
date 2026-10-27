\version "2.24.0"

\header {
  title = "Es ist ein Ros entsprungen"
  composer = "Michael Praetorius (1609)"
  poet = "Traditionell (16. Jh.)"
  tagline = ##f
}

global = {
  \key f \major
  \time 4/4
  \tempo 4 = 92
}

harmonies = \chordmode {
  f1 | bes2 f2 | d2:m c4:m f4 | c2 f2 |
  f1 | bes2 f2 | d2:m c4:m f4 | c2 f2 |
  d4:m c4 a4:m d4:m | g2 c2 |
  f1 | bes2 f2 | d2:m c4:m f4 | c2 f2 |
}

soprano = \relative c'' {
  \global
  c2 c4 c4 |
  d4 c4 c2 |
  a4 bes4 c4 a4 |
  g2 f2 \bar "||"
  c'2 c4 c4 |
  d4 c4 c2 |
  a4 bes4 c4 a4 |
  g2 f2 \bar "||"
  a4 g4 e4 f4 |
  d2 c2 |
  c'2 c4 c4 |
  d4 c4 c2 |
  a4 bes4 c4 a4 |
  g2 f2 \bar "|."
}

alto = \relative c' {
  \global
  a'2 a4 f4 |
  f4 f4 e2 |
  f4 f4 e4 f4 |
  e2 c2 \bar "||"
  a'2 a4 f4 |
  f4 f4 e2 |
  f4 f4 e4 f4 |
  e2 c2 \bar "||"
  f4 d4 c4 c4 |
  b2 c2 |
  a'2 a4 f4 |
  f4 f4 e2 |
  f4 f4 e4 f4 |
  e2 c2 \bar "|."
}

tenor = \relative c' {
  \global
  c2 c4 a4 |
  bes4 a4 g2 |
  c4 d4 g,4 c4 |
  c4 b4 a2 \bar "||"
  c2 c4 a4 |
  bes4 a4 g2 |
  c4 d4 g,4 c4 |
  c4 b4 a2 \bar "||"
  c4 bes4 a4 a4 |
  g2 g2 |
  c2 c4 a4 |
  bes4 a4 g2 |
  c4 d4 g,4 c4 |
  c4 b4 a2 \bar "|."
}

bass = \relative c {
  \global
  f2 f4 f4 |
  bes,4 f'4 c2 |
  f4 bes,4 c4 f,4 |
  c'2 f,2 \bar "||"
  f'2 f4 f4 |
  bes,4 f'4 c2 |
  f4 bes,4 c4 f,4 |
  c'2 f,2 \bar "||"
  f'4 g4 a4 f4 |
  g2 c,2 |
  f2 f4 f4 |
  bes,4 f'4 c2 |
  f4 bes,4 c4 f,4 |
  c'2 f,2 \bar "|."
}

firstVerse = \lyricmode {
  Es ist ein Ros ent -- sprun -- gen
  aus ei -- ner Wur -- zel zart,
  wie uns die Al -- ten sun -- gen,
  von Jes -- se kam die Art
  und hat ein Blüm -- lein 'bracht
  mitten im kal -- ten Win -- ter,
  wohl zu der hal -- ben Nacht.
}

secondVerse = \lyricmode {
  Das Rös -- lein, das ich mei -- ne,
  da -- von I -- sai -- as sagt,
  hat uns ge -- bracht al -- lei -- ne
  die rei -- ne Magd Ma -- ria.
  Aus Got -- tes ew' -- gem Rat
  hat sie ein Kind ge -- bo -- ren
  und blieb ein rei -- ne Magd.
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
    \new Lyrics \lyricsto "soprano" \secondVerse
  >>
  \layout { }
  \midi { }
}
