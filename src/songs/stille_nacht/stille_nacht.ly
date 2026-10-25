\version "2.24.0"

\header {
  title = "Stille Nacht, heilige Nacht"
  composer = "Franz Xaver Gruber (1818)"
  poet = "Joseph Mohr (1816)"
  tagline = ##f
}

global = {
  \key bes \major
  \time 6/8
  \tempo 4. = 44
}

melody = \relative c' {
  \global
  f4.( g8 f4) d2.
  f4.( g8 f4) d2.
  c'2 c4 a2.
  bes2. bes2.
  g2 g4 bes2 g4
  f4.( g8 f4) d2.
  g2 g4 bes2 g4
  f4.( g8 f4) d2.
  c'2 c4 e2 c4
  a2. f2.
  d'2. bes2.
  f2. d2.
  bes2. \bar "|."
}

firstVerse = \lyricmode {
  Stil -- le Nacht, hei -- li -- ge Nacht!
  Al -- les schläft, ein -- sam wacht
  Nur das trau -- te, hoch -- hei -- li -- ge Paar.
  Hol -- der Kna -- be im lo -- cki -- gen Haar,
  Schlaf in hum -- mlis -- cher Ruh,
  Schlaf in hum -- mlis -- cher Ruh!
}

secondVerse = \lyricmode {
  Stil -- le Nacht, hei -- li -- ge Nacht!
  Got -- tes Sohn, o wie lacht
  Lieb aus dei -- nem gött -- li -- chen Mund,
  Da uns schlägt die ret -- ten -- de Stund,
  Chris -- tus, der Ret -- ter, ist da,
  Chris -- tus, der Ret -- ter, ist da!
}

thirdVerse = \lyricmode {
  Stil -- le Nacht, hei -- li -- ge Nacht!
  Hir -- ten erst kund -- ge -- macht
  Durch der En -- gel Hal -- le -- lu -- ja,
  Tönt es laut von fern und nah:
  Chris -- tus, der Ret -- ter, ist da,
  Chris -- tus, der Ret -- ter, ist da!
}

\score {
  <<
    \new Staff {
      \new Voice = "singer" { \melody }
    }
    \new Lyrics \lyricsto "singer" \firstVerse
    \new Lyrics \lyricsto "singer" \secondVerse
    \new Lyrics \lyricsto "singer" \thirdVerse
  >>
  \layout { }
  \midi { }
}
