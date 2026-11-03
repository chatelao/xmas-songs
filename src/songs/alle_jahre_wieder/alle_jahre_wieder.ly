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
  \tempo 4 = 96
}

harmonies = \chordmode {
  d2. a4:7 | d2 a2 | d1 |
  a2:7 d2 | a2 d2 |
  d2 g2 | d2 e2:m7 |
  g2 a2:7 | d1 |
}

soprano = \relative c'' {
  \global
  a4. b8 a4 g4 |
  fis2 e2 |
  d1 |
  e4 fis4 g4 fis4 |
  e2 fis2 |
  fis4 g4 a4 b4 |
  a2 g4( fis4) |
  e2 fis4( e4) |
  d1 \bar "|."
}

alto = \relative c' {
  \global
  fis4. g8 fis4 e4 |
  d2 cis2 |
  d1 |
  cis4 d4 cis4 d4 |
  cis2 d2 |
  d4 e4 fis4 g4 |
  fis2 e4( d4) |
  d2 cis2 |
  d1 \bar "|."
}

tenor = \relative c' {
  \global
  d4. d8 d4 b4 |
  a2 g2 |
  fis1 |
  g4 a4 a4 a4 |
  a2 a2 |
  a4 a4 d4 d4 |
  d2 b4( a4) |
  b2 a4( g4) |
  fis1 \bar "|."
}

bass = \relative c {
  \global
  d4. g8 fis4 e4 |
  d2 a'2 |
  d,1 |
  a'4 d,4 e4 d4 |
  a'2 d,2 |
  d4 cis4 d4 g4 |
  d2 e2 |
  g2 a,2 |
  d1 \bar "|."
}

firstVerse = \lyricmode {
  \set stanza = "1."
  Al -- le Jah -- re wie -- der
  kommt das Chris -- tus -- kind
  auf die Er -- de nie -- der,
  wo wir Men -- schen sind.
}

secondVerse = \lyricmode {
  \set stanza = "2."
  Kehrt mit sei -- nem Se -- gen
  ein in je -- des Haus,
  geht auf al -- len We -- gen
  mit uns ein und aus.
}

thirdVerse = \lyricmode {
  \set stanza = "3."
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
