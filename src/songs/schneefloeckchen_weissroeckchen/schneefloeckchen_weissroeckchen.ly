\version "2.24.0"

\header {
  title = "Schneeflöckchen, Weissröckchen"
  composer = "Traditionell"
  poet = "Hedwig Haberkern (1869)"
  tagline = ##f
}

global = {
  \key g \major
  \time 3/4
  \tempo 4 = 96
}

melody = \relative c'' {
  \global
  d4 b4 g4 |
  e2 a4 |
  d4 b4 g4 |
  a2. |
  d4 b4 g4 |
  e2 a4 |
  g4 fis4 a4 |
  g2. \bar "|."
}

firstVerse = \lyricmode {
  Schnee -- flöck -- chen, Weiss -- röck -- chen,
  wann kommst du ge -- schneit?
  Du wohnst in den Wol -- ken,
  dein Weg ist so weit.
}

secondVerse = \lyricmode {
  Komm setz dich ans Fen -- ster,
  du lieb -- li -- cher Gast,
  du bringst uns den Win -- ter,
  machst Freu -- de uns fast.
}

thirdVerse = \lyricmode {
  Schnee -- flöck -- chen, du deckst uns
  die Blüm -- lein be -- schirmt,
  dann schla -- fen sie si -- cher,
  wenn's wet -- tert und stürmt.
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
