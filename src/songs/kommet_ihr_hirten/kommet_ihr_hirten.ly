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

harmonies = \chordmode {
  f2. | f2. | g2.:m | f2. |
  f2. | f2. | g2.:m | f2. |
  f2. | bes2. | c2.:7 | f2. |
  f2. | bes2. | c2.:7 | f2. |
  f2. | f2. | g2.:m | f2. |
}

soprano = \relative c' {
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

alto = \relative c' {
  \global
  c4 c4 e4 |
  f2 f4 |
  g4 f4 e4 |
  f2. |
  c4 c4 e4 |
  f2 f4 |
  g4 f4 e4 |
  c2. |
  f4 f4 f4 |
  f2 f4 |
  e4 e4 g4 |
  f2. |
  f4 f4 f4 |
  f2 f4 |
  e4 e4 g4 |
  f2. |
  c4 c4 e4 |
  f2 f4 |
  g4 f4 e4 |
  c2. \bar "|."
}

tenor = \relative c' {
  \global
  a4 a4 c4 |
  c2 c4 |
  d4 c4 c4 |
  c2. |
  a4 a4 c4 |
  c2 c4 |
  d4 c4 bes4 |
  a2. |
  a4 a4 a4 |
  bes2 bes4 |
  g4 g4 c4 |
  c2. |
  a4 a4 a4 |
  bes2 bes4 |
  g4 g4 c4 |
  c2. |
  a4 a4 c4 |
  c2 c4 |
  d4 c4 bes4 |
  a2. \bar "|."
}

bass = \relative c {
  \global
  f4 f4 c4 |
  f2 f4 |
  g4 f4 c4 |
  f2. |
  f4 f4 c4 |
  f2 f4 |
  g4 f4 c4 |
  f2. |
  f4 f4 f4 |
  bes,2 bes4 |
  c4 c4 c4 |
  f2. |
  f4 f4 f4 |
  bes,2 bes4 |
  c4 c4 c4 |
  f2. |
  f4 f4 c4 |
  f2 f4 |
  g4 f4 c4 |
  f,2. \bar "|."
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
