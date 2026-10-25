\version "2.24.0"

\header {
  title = "Süsser die Glocken nie klingen"
  composer = "Traditionell"
  poet = "Friedrich Wilhelm Kritzinger (1860)"
  tagline = ##f
}

global = {
  \key g \major
  \time 6/8
  \tempo 4. = 50
}

melody = \relative c' {
  \global
  g'4 g8 a4 a8 |
  b4. b4. |
  c4 c8 b4 b8 |
  a2. |
  g4 g8 a4 a8 |
  b4. b4. |
  a4 g8 a4 b8 |
  g2. |
  d'4 d8 c4 b8 |
  c4. a4. |
  c4 c8 b4 a8 |
  b2. |
  g4 g8 a4 a8 |
  b4. b4. |
  a4 g8 a4 b8 |
  g2. \bar "|."
}

firstVerse = \lyricmode {
  Süss -- er die Glo -- cken nie klin -- gen
  als zu der Weih -- nachts -- zeit,
  's_ist, als ob En -- gel -- lein sin -- gen
  wie -- der von Freud' und Leid.
  Wie sie ge -- sun -- gen in hei -- li -- ger Nacht,
  Glo -- cken mit hei -- li -- gem Klang,
  klin -- get die Er -- de ent -- lang!
}

secondVerse = \lyricmode {
  O, wenn die Glo -- cken er -- klin -- gen,
  schnell mit je -- dem Ton
  dringt ein Ge -- bet in den Him -- mel,
  hoch zu des Va -- ters Thron.
  O wie er -- freu -- et uns die -- se Ge -- stalt,
  Glo -- cken mit hei -- li -- gem Klang,
  klin -- get die Er -- de ent -- lang!
}

thirdVerse = \lyricmode {
  Klin -- get mit lieb -- li -- chem Schal -- le
  ü -- ber die Mee -- re hin -- weg,
  dass sie er -- schal -- le in al -- len
  Her -- zen am je -- di -- gen Fleck.
  Schüt -- zet die Schwa -- chen und trös -- tet die Not,
  Glo -- cken mit hei -- li -- gem Klang,
  klin -- get die Er -- de ent -- lang!
}

\score {
  <<
    \new Staff {
      \new Voice = "singer" { \melody }
    }
    \new Lyrics \lyricsto "singer" \firstVerse
    \new Lyrics \lyricsto "singer" \secondVerse
    \new Lyrics \lyricsto "singer" \thirdVerse
  >>
  \layout { }
  \midi { }
}
