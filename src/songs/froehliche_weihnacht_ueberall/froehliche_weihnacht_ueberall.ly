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

harmonies = \chordmode {
  g2 | g2 | d2:7 | g2 |
  g2 | g2 | d2:7 | g2 |
  g2 | g2 | c2 | d2 |
  g2 | g2 | d2:7 | g2 |
}

soprano = \relative c'' {
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

alto = \relative c' {
  \global
  b'8 d,8 d8 g8 |
  b4. g8 |
  a8 f8 d8 f8 |
  d2 |
  b'8 d,8 d8 g8 |
  b4. g8 |
  a8 f8 d8 f8 |
  d2 \bar "||"
  g8 g8 g8 f8 |
  d4 d4 |
  g8 g8 g8 g8 |
  fis2 |
  g8 g8 g8 f8 |
  d4 d4 |
  fis8 fis8 g8 fis8 |
  d2 \bar "|."
}

tenor = \relative c' {
  \global
  d8 b8 b8 d8 |
  d4. d8 |
  d8 c8 a8 c8 |
  b2 |
  d8 b8 b8 d8 |
  d4. d8 |
  d8 c8 a8 c8 |
  b2 \bar "||"
  d8 d8 d8 c8 |
  b4 b4 |
  e8 e8 e8 d8 |
  d2 |
  d8 d8 d8 c8 |
  b4 b4 |
  c8 c8 d8 c8 |
  b2 \bar "|."
}

bass = \relative c {
  \global
  g'8 g8 g8 g8 |
  g4. g8 |
  d8 d8 d8 d8 |
  g,2 |
  g'8 g8 g8 g8 |
  g4. g8 |
  d8 d8 d8 d8 |
  g,2 \bar "||"
  g'8 g8 g8 g8 |
  g4 g,4 |
  c8 c8 c8 c8 |
  d2 |
  g8 g8 g8 g8 |
  g4 g,4 |
  d'8 d8 d8 d8 |
  g,2 \bar "|."
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
