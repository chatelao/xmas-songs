\version "2.24.0"

\header {
  title = "Morgen, Kinder, wird’s was geben"
  composer = "Carl Gottlieb Hering (1809)"
  poet = "Karl Friedrich Splittegarb (1795)"
  tagline = ##f
}

global = {
  \key g \major
  \time 4/4
  \tempo 4 = 108
}

harmonies = \chordmode {
  g2 d2:7 | g2 d2:7 | c2 g2 | d2:7 g2 |
  g2 d2:7 | g2 d2:7 | c2 g2 | d2:7 g2 |
  g2 c2 | g2 d2:7 | g2 c2 | g2 d2:7 |
  g2 d2:7 | g2 d2:7 | c2 g2 | d2:7 g2 |
}

soprano = \relative c'' {
  \global
  g4 g8 g8 a4 a4 |
  b4 b4 a2 |
  c4 c4 b4 b4 |
  a4 a4 g2 |
  g4 g8 g8 a4 a4 |
  b4 b4 a2 |
  c4 c4 b4 b4 |
  a4 a4 g2 \bar "||"
  d'4 d4 c4 c4 |
  b4 b4 a2 |
  d4 d4 c4 c4 |
  b4 b4 a2 |
  g4 g8 g8 a4 a4 |
  b4 b4 a2 |
  c4 c4 b4 b4 |
  a4 a4 g2 \bar "|."
}

alto = \relative c' {
  \global
  d4 d8 d8 fis4 fis4 |
  g4 g4 fis2 |
  e4 e4 d4 d4 |
  c4 c4 b2 |
  d4 d8 d8 fis4 fis4 |
  g4 g4 fis2 |
  e4 e4 d4 d4 |
  c4 c4 b2 \bar "||"
  g'4 g4 g4 g4 |
  g4 g4 fis2 |
  g4 g4 g4 g4 |
  g4 g4 fis2 |
  d4 d8 d8 fis4 fis4 |
  g4 g4 fis2 |
  e4 e4 d4 d4 |
  c4 c4 b2 \bar "|."
}

tenor = \relative c' {
  \global
  b4 b8 b8 c4 c4 |
  d4 d4 d2 |
  g,4 g4 g4 g4 |
  fis4 fis4 g2 |
  b4 b8 b8 c4 c4 |
  d4 d4 d2 |
  g,4 g4 g4 g4 |
  fis4 fis4 g2 \bar "||"
  b4 b4 c4 c4 |
  d4 d4 d2 |
  b4 b4 c4 c4 |
  d4 d4 d2 |
  b4 b8 b8 c4 c4 |
  d4 d4 d2 |
  g,4 g4 g4 g4 |
  fis4 fis4 g2 \bar "|."
}

bass = \relative c {
  \global
  g'4 g8 g8 d4 d4 |
  g,4 g4 d'2 |
  c4 c4 g4 g4 |
  d'4 d4 g,2 |
  g'4 g8 g8 d4 d4 |
  g,4 g4 d'2 |
  c4 c4 g4 g4 |
  d'4 d4 g,2 \bar "||"
  g'4 g4 e4 e4 |
  g4 g4 d2 |
  g4 g4 e4 e4 |
  g4 g4 d2 |
  g4 g8 g8 d4 d4 |
  g,4 g4 d'2 |
  c4 c4 g4 g4 |
  d'4 d4 g,2 \bar "|."
}

firstVerse = \lyricmode {
  Mor -- gen, Kin -- der, wird's was ge -- ben,
  mor -- gen wer -- den wir uns freu'n!
  Welch ein Ju -- bel, welch ein Le -- ben
  wird in un -- srem Hau -- se sein!
  Ein -- mal wer -- den wir noch wach,
  hei, dann ist Weih -- nachts -- tag!
  Welch ein Ju -- bel, welch ein Le -- ben
  wird in un -- srem Hau -- se sein!
}

secondVerse = \lyricmode {
  Wie wird dann die Stu -- be glän -- zen
  von der vie -- len Lich -- ter Pracht!
  Schö -- ner als mit Fro -- hen Tän -- zen
  ein ge -- sun -- der Tag er -- wacht.
  Wisst ihr noch, wie vo -- riges Jahr
  es am Weih -- nachts -- abend war?
  Wie wird dann die Stu -- be glän -- zen
  von der vie -- len Lich -- ter Pracht!
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
