\version "2.24.0"

\header {
  title = "Alle Jahre wieder"
  composer = "Friedrich Silcher (1842)"
  poet = "Johann Wilhelm Hey (1837)"
  tagline = ##f
}

global = {
  \key d \major
  \time 4/4
  \tempo 4 = 100
}

melody = \relative c' {
  \global
  fis4 e4 d4 e4 |
  fis2 g2 |
  a1 |
  b4 a4 g4 fis4 |
  e1 |
  a4 g4 fis4 e4 |
  d2 g2 |
  fis4( g4) e2 |
  d1 \bar "|."
}

firstVerse = \lyricmode {
  Al -- le Jah -- re wie -- der
  kommt das Chris -- tus -- kind
  auf die Er -- de nie -- der,
  wo wir Men -- schen sind.
}

secondVerse = \lyricmode {
  Kehrt mit sei -- nem Se -- gen
  ein in je -- des Haus,
  geht auf al -- len We -- gen
  mit uns ein und aus.
}

thirdVerse = \lyricmode {
  Steht auch mir zur Sei -- te
  still und un -- er -- kannt,
  dass es treu mich lei -- te
  an der lie -- ben Hand.
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
