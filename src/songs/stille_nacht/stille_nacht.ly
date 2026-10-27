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

harmonies = \chordmode {
  bes2. | bes2. | bes2. | bes2. |
  f2. | bes2. | es2. | bes2. |
  es2. | bes2. | f2.:7 | bes2. |
  f2.:7 | bes2. |
}

soprano = \relative c' {
  \global
  f4.( g8 f4) d2. |
  f4.( g8 f4) d2. |
  c'2 c4 a2. |
  bes2. bes2. |
  g2 g4 bes2 g4 |
  f4.( g8 f4) d2. |
  g2 g4 bes2 g4 |
  f4.( g8 f4) d2. |
  c'2 c4 e2 c4 |
  a2. f2. |
  d'2. bes2. |
  f2. d2. |
  bes2. \bar "|."
}

alto = \relative c' {
  \global
  d4.( e8 d4) bes2. |
  d4.( e8 d4) bes2. |
  f'2 f4 f2. |
  f2. f2. |
  es2 es4 g2 es4 |
  d4.( e8 d4) bes2. |
  es2 es4 g2 es4 |
  d4.( e8 d4) bes2. |
  f'2 f4 g2 g4 |
  f2. d2. |
  f2. f2. |
  d2. bes2. |
  d2. \bar "|."
}

tenor = \relative c' {
  \global
  bes4.( bes8 bes4) f2. |
  bes4.( bes8 bes4) f2. |
  a2 a4 c2. |
  d2. d2. |
  bes2 bes4 d2 bes4 |
  bes4.( bes8 bes4) f2. |
  bes2 bes4 d2 bes4 |
  bes4.( bes8 bes4) f2. |
  a2 a4 c2 a4 |
  c2. a2. |
  bes2. d2. |
  bes2. f2. |
  f2. \bar "|."
}

bass = \relative c {
  \global
  bes2. bes2. |
  bes2. bes2. |
  f'2 f4 f2. |
  bes,2. bes2. |
  es2 es4 es2 es4 |
  bes2. bes2. |
  es2 es4 es2 es4 |
  bes2. bes2. |
  f'2 f4 c2 c4 |
  f2. f2. |
  bes,2. bes2. |
  bes2. bes2. |
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
