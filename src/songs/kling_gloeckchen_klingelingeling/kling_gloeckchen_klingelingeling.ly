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
  % Refrain A (Takt 1-4)
  f2 | c2:7 | c4:7 f4 | c4:7 f4 |
  % Strophe B (Takt 5-12)
  c2:7 | f2 | c2:7 | f2 |
  g4:m c4:7 | f2 | d4:m g4:7 | c2 |
  % Refrain A' (Takt 13-16)
  f2 | c2:7 | c4:7 f4 | c4:7 f4 |
}

soprano = \relative c'' {
  \global
  % Takt 1-4: Kling, Glöckchen, klingelingeling, kling, Glöckchen, kling!
  c4 a8 bes8 |
  c16 d16 c16 bes16 a8( g8) |
  g4 a8( bes8) |
  c8( g8) a4 \bar "||"
  % Takt 5-8: Lasst mich ein, ihr Kinder, ist so kalt der Winter,
  g8 g8 g8 a8 |
  bes8( g8) a4 |
  g8 g8 g8 a8 |
  bes8( g8) a4 |
  % Takt 9-12: öffnet mir die Türen, lasst mich nicht erfrieren!
  d8 d8 c8 bes8 |
  a8( g8) f4 |
  d'8 d8 c8 b8 |
  d4 c4 \bar "||"
  % Takt 13-16: Kling, Glöckchen, klingelingeling, kling, Glöckchen, kling!
  c4 a8 bes8 |
  c16 d16 c16 bes16 a8( g8) |
  g4 a8( bes8) |
  c8( e,8) f4 \bar "|."
}

alto = \relative c' {
  \global
  % Takt 1-4
  f4 f8 f8 |
  e16 f16 e16 d16 c8( e8) |
  e4 f8( f8) |
  e8( e8) f4 \bar "||"
  % Takt 5-8
  e8 e8 e8 f8 |
  g8( e8) f4 |
  e8 e8 e8 f8 |
  g8( e8) f4 |
  % Takt 9-12
  g8 g8 e8 g8 |
  f8( e8) f4 |
  f8 f8 e8 d8 |
  f4 e4 \bar "||"
  % Takt 13-16
  f4 f8 f8 |
  e16 f16 e16 d16 c8( e8) |
  e4 f8( f8) |
  e8( c8) c4 \bar "|."
}

tenor = \relative c' {
  \global
  % Takt 1-4
  a4 c8 d8 |
  c16 bes16 a16 g16 f8( c'8) |
  c4 c8( d8) |
  g,8( c8) c4 \bar "||"
  % Takt 5-8
  c8 c8 c8 c8 |
  d8( bes8) c4 |
  c8 c8 c8 c8 |
  d8( bes8) c4 |
  % Takt 9-12
  bes8 bes8 c8 c8 |
  c8( bes8) a4 |
  a8 a8 g8 g8 |
  b4 g4 \bar "||"
  % Takt 13-16
  a4 c8 d8 |
  c16 bes16 a16 g16 f8( c'8) |
  c4 c8( d8) |
  g,8( bes8) a4 \bar "|."
}

bass = \relative c {
  \global
  % Takt 1-4 (Optimiert für treble_8: tiefster Ton ist das kleine f)
  f4 f8 bes,8 |
  c16 c16 c16 c16 f8( c8) |
  c4 f8( d8) |
  c8( c8) f4 \bar "||"
  % Takt 5-8
  c8 c8 c8 f8 |
  g8( c,8) f4 |
  c8 c8 c8 f8 |
  g8( c,8) f4 |
  % Takt 9-12
  g8 g8 c,8 e8 |
  f8( c8) d4 |
  d8 d8 g8 g8 |
  g4 c,4 \bar "||"
  % Takt 13-16
  f4 f8 bes,8 |
  c16 c16 c16 c16 f8( c8) |
  c4 f8( d8) |
  c8( c8) f4 \bar "|."
}

firstVerse = \lyricmode {
  \set stanza = "1."
  Kling, Glöck -- chen, klin -- ge -- lin -- ge -- ling,
  kling, Glöck -- chen, kling!
  Lasst mich ein, ihr Kin -- der,
  ist so kalt der Win -- ter,
  öff -- net mir die Tü -- ren,
  lasst mich nicht er -- frie -- ren!
  Kling, Glöck -- chen, klin -- ge -- lin -- ge -- ling,
  kling, Glöck -- chen, kling!
}

secondVerse = \lyricmode {
  \set stanza = "2."
  Kling, Glöck -- chen, klin -- ge -- lin -- ge -- ling,
  kling, Glöck -- chen, kling!
  Mäd -- chen, hört, und Büb -- chen,
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
      \new Lyrics \lyricsto "soprano" \firstVerse
      \new Lyrics \lyricsto "soprano" \secondVerse
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
