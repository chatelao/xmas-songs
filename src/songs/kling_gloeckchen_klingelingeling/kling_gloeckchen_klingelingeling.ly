\version "2.24.0"

\header {
  title = "Kling, Glöckchen, klingelingeling"
  composer = "Volksweise (19. Jh.)"
  poet = "Karl Enslin (1854)"
  tagline = ##f
}

global = {
  \key f \major
  \time 2/4
  \tempo 4 = 100
}

melody = \relative c'' {
  \global
  c4 a8. f16 |
  g8 g8 f4 |
  g8 g8 g8 a8 |
  bes8 g8 a4 |
  g8 g8 g8 a8 |
  bes8 g8 a4 |
  c4 a8. f16 |
  g8 g8 f4 \bar "||"
  d'8 d8 d8 d8 |
  c4 a4 |
  bes8 bes8 g8 g8 |
  c2 |
  c4 a8. f16 |
  g8 g8 f4 \bar "|."
}

firstVerse = \lyricmode {
  Kling, Glöck -- chen, klin -- ge -- lin -- ge -- ling,
  kling, Glöck -- chen, kling!
  Lass mich ein, ihr Kin -- der,
  ist so kalt der Win -- der,
  öff -- net mir die Tü -- ren,
  lasst mich nicht er -- frie -- ren!
  Kling, Glöck -- chen, klin -- ge -- lin -- ge -- ling,
  kling, Glöck -- chen, kling!
}

secondVerse = \lyricmode {
  Kling, Glöck -- chen, klin -- ge -- lin -- ge -- ling,
  kling, Glöck -- chen, kling!
  Mäd -- chen, hört und Büb -- chen,
  macht mir auf das Stüb -- chen!
  Bring euch vie -- le Ga -- ben,
  sollt euch dran er -- la -- ben.
  Kling, Glöck -- chen, klin -- ge -- lin -- ge -- ling,
  kling, Glöck -- chen, kling!
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
