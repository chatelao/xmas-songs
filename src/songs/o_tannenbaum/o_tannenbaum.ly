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

melody = \relative c' {
  \global
  \partial 4 c4 |
  f8. f8. f4 g4 |
  a8. a8. a4. a8 |
  g4 a4 b4 |
  c2 \bar "||"
  \partial 4 c4 |
  c4 a4 d4 |
  c4. bes8 a4 |
  bes4 g4 c4 |
  a2 \bar "||"
  \partial 4 c,4 |
  f8. f8. f4 g4 |
  a8. a8. a4. a8 |
  g4 a4 b4 |
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
