\version "2.24.0"

\header {
  title = "O Tannenbaum"
  composer = "Traditionell (16. Jh. / 1799)"
  poet = "Joachim August Zarnack (1819) / Ernst Anschütz (1824)"
  tagline = ##f
}

global = {
  \key f \major
  \time 3/4
  \tempo 4 = 92
}

harmonies = \chordmode {
  \partial 4 s4 |
  f2 c4:7 | f2. | g4:m c4:7 f4 | c4:7 f2 |
  f2 d4:m | g2:m c4:7 | c2:7 e4:dim | f2. |
  f2 c4:7 | f2. | g4:m c4:7 f4 | c4:7 f2 |
}

soprano = \relative c' {
  \global
  \partial 4 c4 |
  f8. f16 f4 g4 |
  a8. a16 a4. a8 |
  g8 a8 bes4 e,4 |
  g4 f4 r8 c'8 | \bar "||"
  c4 a4 d8 d8 |
  c4. c8 bes4 |
  bes4 g4 c8 c8 |
  bes4. bes8 a4 | \bar "||"
  \tiny c,8( c8) \normalsize |
  f8. f16 f4 g4 |
  a8. a16 a4. a8 |
  g8 a8 bes4 e,4 |
  g4 f2 \bar "|."
}
% Korrektur für Takt 8/9 Übergang im 3/4-Takt:
% Takt 8 hat "bes4(wenn) a4(schneit.)" + 1 Viertel Auftakt "O" = 3/4!
sopranoFixed = \relative c' {
  \global
  \partial 4 c4 |
  f8. f16 f4 g4 |
  a8. a16 a4. a8 |
  g8 a8 bes4 e,4 |
  g4 f4 c'8 c8 | \bar "||"
  c4 a4 d8 d8 |
  c4. c8 bes8 bes8 |
  bes4 g4 c8 c8 |
  bes4 a4 c,4 | \bar "||"
  f8. f16 f4 g4 |
  a8. a16 a4. a8 |
  g8 a8 bes4 e,4 |
  g4 f2 \bar "|."
}

alto = \relative c' {
  \global
  \partial 4 c4 |
  c8. c16 c4 e4 |
  f8. f16 f4. f8 |
  d8 f8 f4 c4 |
  e4 c4 f8 f8 |
  f4 f4 f8 f8 |
  e4. e8 d8 d8 |
  e4 e4 g8 g8 |
  e4 f4 c4 |
  c8. c16 c4 e4 |
  f8. f16 f4. f8 |
  d8 f8 f4 c4 |
  e4 c2 \bar "|."
}

tenor = \relative c' {
  \global
  \partial 4 a4 |
  a8. a16 a4 c4 |
  c8. c16 c4. c8 |
  bes8 c8 d4 g,4 |
  bes4 a4 a8 a8 |
  a4 c4 bes8 bes8 |
  g4. g8 g8 g8 |
  g4 c4 e8 e8 |
  c4 c4 a4 |
  a8. a16 a4 c4 |
  c8. c16 c4. c8 |
  bes8 c8 d4 g,4 |
  bes4 a2 \bar "|."
}

bass = \relative c {
  \global
  \partial 4 f4 |
  f8. f16 f4 c4 |
  f8. f16 f4. f8 |
  bes,8 a8 g4 c4 |
  c4 f4 f8 f8 |
  f4 f4 bes,8 bes8 |
  c4. c8 g'8 g8 |
  c,4 c4 c8 c8 |
  c4 f4 f4 |
  f8. f16 f4 c4 |
  f8. f16 f4. f8 |
  bes,8 a8 g4 c4 |
  c4 f2 \bar "|."
}

firstVerse = \lyricmode {
  \set stanza = "1."
  O Tan -- nen -- baum, o Tan -- nen -- baum,
  wie grün sind dei -- ne Blät -- ter!
  Du grünst nicht nur zur Som -- mer -- zeit,
  nein, auch im Win -- ter, wenn es schneit.
  O Tan -- nen -- baum, o Tan -- nen -- baum,
  wie grün sind dei -- ne Blät -- ter!
}

secondVerse = \lyricmode {
  \set stanza = "2."
  O Tan -- nen -- baum, o Tan -- nen -- baum,
  du kannst mir sehr ge -- fal -- len!
  Wie oft hat nicht zur Weih -- nachts -- zeit
  ein Baum von dir mich hoch er -- freut!
  O Tan -- nen -- baum, o Tan -- nen -- baum,
  du kannst mir sehr ge -- fal -- len!
}

thirdVerse = \lyricmode {
  \set stanza = "3."
  O Tan -- nen -- baum, o Tan -- nen -- baum,
  dein Kleid will mich was leh -- ren:
  Die Hoff -- nung und Be -- stän -- dig -- keit
  gibt Trost und Kraft zu je -- der Zeit!
  O Tan -- nen -- baum, o Tan -- nen -- baum,
  dein Kleid will mich was leh -- ren!
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
        \new Voice = "soprano" { \voiceOne \sopranoFixed }
        \new Voice = "alto" { \voiceTwo \alto }
      >>
      \new Lyrics \lyricsto "soprano" \firstVerse
      \new Lyrics \lyricsto "soprano" \secondVerse
      \new Lyrics \lyricsto "soprano" \thirdVerse
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
