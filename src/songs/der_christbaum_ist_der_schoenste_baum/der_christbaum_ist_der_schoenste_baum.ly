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

melody = \relative c' {
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
    \new Staff {
      \new Voice = "singer" { \melody }
    }
    \new Lyrics \lyricsto "singer" \firstVerse
    \new Lyrics \lyricsto "singer" \secondVerse
  >>
  \layout { }
  \midi { }
}
