\version "2.24.0"

\header {
  title = "Vom Himmel hoch, da komm ich her"
  composer = "Martin Luther (1539)"
  poet = "Martin Luther (1535)"
  tagline = ##f
}

global = {
  \key c \major
  \time 4/4
  \tempo 4 = 100
}

melody = \relative c'' {
  \global
  c4 b4 a4 b4 |
  g4 a4 b4 c4 |
  c4 a4 a4 g4 |
  a4 f4 e2 |
  e4 g4 g4 f4 |
  e4 d4 e4 c4 |
  e4 g4 a4 g4 |
  f4 e4 d4 c2 \bar "|."
}

firstVerse = \lyricmode {
  Vom Him -- mel hoch, da komm ich her,
  ich bring euch gu -- te neu e Mär;
  der gu -- ten Mär bring ich so viel,
  da -- von ich sin -- gen und sa -- gen will.
}

secondVerse = \lyricmode {
  Euch ist ein Kind -- lein heut ge -- born
  von ei -- ner Jung -- frau aus -- er korn,
  ein Kind -- lein zart und fein,
  das soll eu er Freud und Won ne sein.
}

thirdVerse = \lyricmode {
  Es ist der Herr Christ, un ser Gott,
  der will euch füh rn aus al ler Not,
  er will eu er Hei land sein,
  von al len Sün den ma chen rein.
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
