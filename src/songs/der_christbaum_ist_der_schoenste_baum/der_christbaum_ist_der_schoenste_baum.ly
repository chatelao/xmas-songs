\version "2.24.0"

\header {
  title = "Der Christbaum ist der schönste Baum"
  composer = "Georg Eisenbach (1842)"
  poet = "Johannes Carl (1842)"
  tagline = ##f
}

global = {
  \key c \major
  \time 4/4
  \tempo 4 = 104
}

harmonies = \chordmode {
  c1 | f2 c2 | c1 | d2:7 g2 |
  c1 | f2 g2:7 | c1 | g2:7 c2 |
}

soprano = \relative c' {
  \global
  c4. e8 g4 e4 |
  f4 a4 g2 |
  c4 b4 a4 g4 |
  fis4 a4 g2 |
  c4 b4 a4 g4 |
  f4 e4 d2 |
  e4. f8 g4 c4 |
  e,4 d4 c2 \bar "|."
}

alto = \relative c' {
  \global
  c4. c8 e4 c4 |
  c4 f4 e2 |
  e4 g4 f4 e4 |
  d4 fis4 d2 |
  e4 g4 f4 e4 |
  d4 c4 b2 |
  c4. d8 e4 e4 |
  c4 b4 c2 \bar "|."
}

tenor = \relative c' {
  \global
  e4. g8 c4 g4 |
  a4 c4 c2 |
  g4 c4 c4 c4 |
  c4 c4 b2 |
  g4 c4 c4 c4 |
  a4 g4 f2 |
  g4. g8 c4 g4 |
  g4 f4 e2 \bar "|."
}

bass = \relative c {
  \global
  c4. c8 c4 c4 |
  f4 f4 c2 |
  c4 e4 f4 c4 |
  d4 d4 g,2 |
  c4 e4 f4 c4 |
  d4 e4 g,2 |
  c4. c8 c4 a4 |
  g4 g4 c2 \bar "|."
}

firstVerse = \lyricmode {
  Der Christ -- baum ist der schön -- ste Baum,
  den wir auf Er -- den ken -- nen.
  Im Gar -- ten steht er aus -- ge -- wählt,
  wo hell die Lich -- ter bren -- nen.
  Der Christ -- baum ist der schön -- ste Baum
  in un -- serm wei -- ten Raum.
}

secondVerse = \lyricmode {
  Denn al -- le Jah -- re bringt er uns
  viel Freu -- de, Lust und Se -- gen.
  Der lie -- be Gott vom Him -- mels -- zelt
  schaut auf uns al -- le nie -- der.
  Der Christ -- baum ist der schön -- ste Baum
  in un -- serm wei -- ten Raum.
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
