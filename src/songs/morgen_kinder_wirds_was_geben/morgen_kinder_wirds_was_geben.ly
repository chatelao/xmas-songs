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

melody = \relative c'' {
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
    \new Staff {
      \new Voice = "singer" { \melody }
    }
    \new Lyrics \lyricsto "singer" \firstVerse
    \new Lyrics \lyricsto "singer" \secondVerse
  >>
  \layout { }
  \midi { }
}
