\version "2.24.0"

\header {
  title = "O Tannenbaum"
  composer = "Traditionell"
  poet = "Joachim August Zarnack (1819) / Ernst Anschütz (1824)"
  tagline = ##f
}

global = {
  \key f \major
  \time 3/4
  \tempo 4 = 100
}

harmonies = \chordmode {
  \partial 4 s4 |
  f2. | f2. | c2.:7 | f2 |
  s4 |
  f2. | f2. | c2.:7 | f2 |
  s4 |
  f2. | f2. | c2.:7 | f2 |
}

soprano = \relative c' {
  \global
  \partial 4 c4 |
  f8. f16 f4 g4 |
  a8. a16 a4. a8 |
  g4 a4 b4 |
  c2 \bar "||"
  \partial 4 c4 |
  c4 a4 d4 |
  c4. bes8 a4 |
  bes4 g4 c4 |
  a2 \bar "||"
  \partial 4 c,4 |
  f8. f16 f4 g4 |
  a8. a16 a4. a8 |
  g4 a4 b4 |
  c2 \bar "|."
}

alto = \relative c' {
  \global
  \partial 4 c4 |
  c8. c16 c4 e4 |
  f8. f16 f4. f8 |
  e4 f4 f4 |
  e2 \bar "||"
  \partial 4 f4 |
  f4 f4 f4 |
  f4. g8 f4 |
  e4 e4 e4 |
  f2 \bar "||"
  \partial 4 c4 |
  c8. c16 c4 e4 |
  f8. f16 f4. f8 |
  e4 f4 f4 |
  e2 \bar "|."
}

tenor = \relative c' {
  \global
  \partial 4 a4 |
  a8. a16 a4 bes4 |
  c8. c16 c4. c8 |
  c4 c4 d4 |
  c2 \bar "||"
  \partial 4 a4 |
  a4 c4 bes4 |
  a4. c8 c4 |
  c4 c4 bes4 |
  c2 \bar "||"
  \partial 4 a4 |
  a8. a16 a4 bes4 |
  c8. c16 c4. c8 |
  c4 c4 d4 |
  c2 \bar "|."
}

bass = \relative c {
  \global
  \partial 4 f4 |
  f8. f16 f4 c4 |
  f8. f16 f4. f8 |
  c4 f4 d4 |
  c2 \bar "||"
  \partial 4 f4 |
  f4 f4 bes,4 |
  f'4. f8 f4 |
  c4 c4 c4 |
  f,2 \bar "||"
  \partial 4 f'4 |
  f8. f16 f4 c4 |
  f8. f16 f4. f8 |
  c4 f4 d4 |
  c2 \bar "|."
}

firstVerse = \lyricmode {
  O Tan -- nen -- baum, o Tan -- nen -- baum,
  wie grün sind dei -- ne Blät -- ter!
  Du grünst nicht nur zur Som -- mer -- zeit,
  nein auch im Win -- ter, wenn es schneit.
  O Tan -- nen -- baum, o Tan -- nen -- baum,
  wie grün sind dei -- ne Blät -- ter!
}

secondVerse = \lyricmode {
  O Tan -- nen -- baum, o Tan -- nen -- baum,
  du kannst mir sehr ge -- fal -- len!
  Wie oft hat nicht zur Weih -- nachtszeit
  ein Baum von dir mich hoch er -- freut!
  O Tan -- nen -- baum, o Tan -- nen -- baum,
  du kannst mir sehr ge -- fal -- len!
}

thirdVerse = \lyricmode {
  O Tan -- nen -- baum, o Tan -- nen -- baum,
  dein Kleid will mich was leh -- ren:
  Die Hoff -- nung und Be -- stän -- dig -- keit
  gibt Trost und Kraft zu je -- der Zeit.
  O Tan -- nen -- baum, o Tan -- nen -- baum,
  dein Kleid will mich was leh -- ren.
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
    \new Lyrics \lyricsto "soprano" \thirdVerse
  >>
  \layout { }
  \midi { }
}
