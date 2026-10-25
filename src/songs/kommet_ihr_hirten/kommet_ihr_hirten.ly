\version "2.24.0"

\header {
  title = "Kommet, ihr Hirten"
  composer = "Böhmische Volksweise (1605)"
  poet = "Carl Riedel (1870)"
  tagline = ##f
}

global = {
  \key f \major
  \time 3/4
  \tempo 4 = 110
}

melody = \relative c' {
  \global
  f4 f4 g4 |
  a2 a4 |
  bes4 a4 g4 |
  a2. |
  f4 f4 g4 |
  a2 a4 |
  bes4 a4 g4 |
  f2. |
  c'4 c4 c4 |
  d2 d4 |
  c4 c4 bes4 |
  a2. |
  c4 c4 c4 |
  d2 d4 |
  c4 c4 bes4 |
  a2. |
  f4 f4 g4 |
  a2 a4 |
  bes4 a4 g4 |
  f2. \bar "|."
}

firstVerse = \lyricmode {
  Kom -- met, ihr Hir -- ten, ihr Män -- ner und Frau'n,
  kom -- met, das lieb -- li -- che Kind -- lein zu schau'n!
  Chris -- tus, der Herr, ist heu -- te ge -- bo -- ren,
  den Gott zum Hei -- land euch hat er -- ko -- ren.
  Fürch -- tet euch nicht!
}

secondVerse = \lyricmode {
  Lass -- et uns se -- hen in Beth -- le -- hems Stall,
  was uns ver -- hei -- ssen der en -- gel -- sche Schall!
  Was wir dort fin -- den, lass -- et uns prei -- sen,
  lasst uns dem Kind -- lein Dank -- bar -- keit er -- wei -- sen!
  Lass -- et uns geh'n!
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
