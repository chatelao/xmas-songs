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

harmonies = \chordmode {
  f2 | c2:7 | c2:7 | f2 |
  c2:7 | f2 | f2 | c2:7 |
  f2 | f2 | c2:7 | f2 |
  f2 | c2:7 |
}

soprano = \relative c'' {
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

alto = \relative c' {
  \global
  a'4 f8. d16 |
  e8 e8 c4 |
  e8 e8 e8 f8 |
  g8 e8 f4 |
  e8 e8 e8 f8 |
  g8 e8 f4 |
  a4 f8. d16 |
  e8 e8 c4 \bar "||"
  f8 f8 f8 f8 |
  f4 f4 |
  g8 g8 e8 e8 |
  f2 |
  a4 f8. d16 |
  e8 e8 c4 \bar "|."
}

tenor = \relative c' {
  \global
  c4 c8. a16 |
  bes8 bes8 a4 |
  c8 c8 c8 c8 |
  c8 c8 c4 |
  c8 c8 c8 c8 |
  c8 c8 c4 |
  c4 c8. a16 |
  bes8 bes8 a4 \bar "||"
  bes8 bes8 bes8 bes8 |
  a4 c4 |
  c8 c8 c8 c8 |
  a2 |
  c4 c8. a16 |
  bes8 bes8 a4 \bar "|."
}

bass = \relative c {
  \global
  f4 f8. f16 |
  c8 c8 f4 |
  c8 c8 c8 c8 |
  c8 c8 f4 |
  c8 c8 c8 c8 |
  c8 c8 f4 |
  f4 f8. f16 |
  c8 c8 f,4 \bar "||"
  bes8 bes8 bes8 bes8 |
  f'4 f4 |
  c8 c8 c8 c8 |
  f2 |
  f4 f8. f16 |
  c8 c8 f,4 \bar "|."
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
