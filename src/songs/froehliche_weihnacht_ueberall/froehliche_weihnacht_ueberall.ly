\version "2.24.0"

\header {
  title = "Fröhliche Weihnacht überall"
  composer = "Traditionell"
  poet = "August Heinrich Hoffmann von Fallersleben (1885)"
  tagline = ##f
}

global = {
  \key g \major
  \time 2/4
  \tempo 4 = 100
}

melody = \relative c'' {
  \global
  d8 g,8 g8 b8 |
  d4. b8 |
  c8 a8 fis8 a8 |
  g2 |
  d'8 g,8 g8 b8 |
  d4. b8 |
  c8 a8 fis8 a8 |
  g2 \bar "||"
  b8 b8 b8 a8 |
  g4 d4 |
  c'8 c8 c8 b8 |
  a2 |
  b8 b8 b8 a8 |
  g4 d4 |
  a'8 a8 b8 a8 |
  g2 \bar "|."
}

firstVerse = \lyricmode {
  Fröh -- li -- che Weih -- nacht über -- all!
  Tö -- net durch die Lüf -- te fro -- her Schall.
  Fröh -- li -- che Weih -- nacht über -- all!
  Tö -- net durch die Lüf -- te fro -- her Schall.
  Weih -- nachts -- baum der Lich -- ter -- glanz
  fällt in je -- den Raum;
  sän -- gen wir ein' fro -- hen Tanz,
  schmückt den Weih -- nachts -- baum.
}

secondVerse = \lyricmode {
  Fröh -- li -- che Weih -- nacht über -- all!
  Tö -- net durch die Lüf -- te fro -- her Schall.
  Fröh -- li -- che Weih -- nacht über -- all!
  Tö -- net durch die Lüf -- te fro -- her Schall.
  Über -- all ist Weih -- nachts -- zeit,
  über -- all ist Lust;
  wer sich liebt in In -- nig -- keit,
  freut sich aus der Brust.
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
