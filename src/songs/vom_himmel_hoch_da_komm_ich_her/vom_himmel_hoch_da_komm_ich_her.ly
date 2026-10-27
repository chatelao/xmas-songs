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

harmonies = \chordmode {
  c2 f2 | c2 g2:7 | c2 f4 c4 | f2 c2 |
  c2 g2 | c2 a2:m | e2:m f2 | d2:m g2:7 | c1 |
}

soprano = \relative c'' {
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

alto = \relative c' {
  \global
  e4 g4 f4 f4 |
  e4 f4 g4 g4 |
  e4 f4 f4 e4 |
  f4 d4 c2 |
  c4 e4 e4 d4 |
  c4 b4 c4 a4 |
  b4 e4 f4 e4 |
  d4 c4 b4 c2 \bar "|."
}

tenor = \relative c' {
  \global
  g4 d'4 c4 d4 |
  c4 c4 d4 e4 |
  g,4 c4 c4 c4 |
  c4 a4 g2 |
  g4 c4 c4 a4 |
  g4 f4 g4 e4 |
  g4 b4 c4 b4 |
  a4 g4 f4 e2 \bar "|."
}

bass = \relative c {
  \global
  c4 g'4 f4 d4 |
  c4 f4 g4 c,4 |
  c'4 f,4 f4 c4 |
  f4 d4 c2 |
  c4 c4 c4 d4 |
  e4 d4 c4 a4 |
  e'4 e4 f4 e4 |
  d4 c4 g4 c2 \bar "|."
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
