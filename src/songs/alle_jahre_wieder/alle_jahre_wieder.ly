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

harmonies = \chordmode {
  d2 a2 | d2 g2 | d1 |
  g2 d2 | a1 |
  d2 a2 | d2 g2 |
  d2 a2 | d1 |
}

soprano = \relative c' {
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

alto = \relative c' {
  \global
  d4 cis4 d4 cis4 |
  d2 d2 |
  e1 |
  d4 d4 d4 d4 |
  cis1 |
  d4 d4 d4 cis4 |
  d2 d2 |
  d4( d4) cis2 |
  d1 \bar "|."
}

tenor = \relative c' {
  \global
  a4 a4 fis4 a4 |
  a2 b2 |
  a1 |
  g4 a4 b4 a4 |
  a1 |
  fis4 g4 a4 a4 |
  fis2 b2 |
  a4( b4) a2 |
  fis1 \bar "|."
}

bass = \relative c {
  \global
  d4 a4 d4 a4 |
  d2 g,2 |
  a1 |
  g4 fis4 e4 d4 |
  a'1 |
  d,4 e4 fis4 a,4 |
  d2 g,2 |
  d'4( g,4) a2 |
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
