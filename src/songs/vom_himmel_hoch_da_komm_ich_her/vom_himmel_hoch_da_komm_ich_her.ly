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
  \partial 4
}

harmonies = \chordmode {
  c4 |
  b2:dim e4:m a4:m | g4 d4 g2 |
  g4 c4 g4 c4:6 | d4:m7 g4 c2 |
  c2 a4:m d4:m | e4:m a4:m d4:m g4 |
  c4 a4:m d4:m g4 | c4 g4 c4 \bar "|."
}

soprano = \relative c'' {
  \global
  c4 |
  b4 a4 b4 g4 |
  a4 b4 c4 \breathe c4 |
  c4 g4 g4 e4 |
  g4 f4 e4 \breathe e4 |
  a4 a4 g4 b4 |
  c4 a4 g4 \breathe b4 |
  c4 a4 g4 f4 |
  e4 d4 c4 \bar "|."
}

alto = \relative c'' {
  \global
  g4 |
  g4 f4 e4 e4 |
  d4 d4 d4 g4 |
  g4 e4 d4 c4 |
  d4 d4 c4 c4 |
  f4 e4 e4 f4 |
  g4 e4 d4 g4 |
  e4 f4 d4 d4 |
  c4 b4 c4 \bar "|."
}

% Oktavlage angepasst für optimale Darstellung in \clef "treble_8"
tenor = \relative c' {
  \global
  e4 |
  d4 d4 b4 b4 |
  a4 g4 g4 e'4 |
  d4 c4 b4 g4 |
  a4 g4 g4 a4 |
  c4 c4 c4 d4 |
  e4 c4 b4 d4 |
  c4 c4 b4 a4 |
  g4 f4 e4 \bar "|."
}

bass = \relative c' {
  \global
  c,4 |
  g'4 d4 e4 e4 |
  f4 g4 g,4 c4 |
  g'4 c,4 g'4 e4 |
  f4 g4 c,4 a'4 |
  f4 a4 c,4 d4 |
  c4 a4 g'4 g4 |
  a4 f4 g4 d4 |
  e4 g4 c,4 \bar "|."
}

firstVerse = \lyricmode {
  \set stanza = "1."
  Vom Him -- mel hoch, da komm ich her,
  ich bring euch gu -- te neu -- e Mär;
  der gu -- ten Mär bring ich so viel,
  da -- von ich sin -- gen und sa -- gen will.
}

secondVerse = \lyricmode {
  \set stanza = "2."
  Euch ist ein Kind -- lein heut ge -- born
  von ei -- ner Jung -- frau aus -- er -- korn,
  ein Kind -- lein, so zart und fein,
  das soll eu -- er Freud und Won -- ne sein.
}

thirdVerse = \lyricmode {
  \set stanza = "3."
  Es ist der Herr Christ, un -- ser Gott,
  der will euch führn aus al -- ler Not,
  er will eu -- er Hei -- land se -- lig sein,
  von al -- len Sün -- den ma -- chen rein.
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
