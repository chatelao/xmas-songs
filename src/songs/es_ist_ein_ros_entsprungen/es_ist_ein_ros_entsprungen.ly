\version "2.24.0"

\header {
  title = "Es ist ein Ros entsprungen"
  composer = "Speyerer Gesangbuch (1599)"
  poet = "Traditionell (16. Jh.)"
  tagline = ##f
}

global = {
  \key f \major
  \time 4/4
  \tempo 4 = 92
}

melody = \relative c'' {
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
    \new Staff {
      \new Voice = "singer" { \melody }
    }
    \new Lyrics \lyricsto "singer" \firstVerse
    \new Lyrics \lyricsto "singer" \secondVerse
  >>
  \layout { }
  \midi { }
}
