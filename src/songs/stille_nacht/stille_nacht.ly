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
  f2.:7 | f2.:7 | bes2. | bes2. |
  es2.  | es2.  | bes2. | bes2. |
  es2.  | es2.  | bes2. | bes2. |
  f2.:7 | f2.:7 | bes2. | bes2.:/d |
  bes2.:/f | f2.:7 | bes2. | bes2. |
}

soprano = \relative c' {
  \global
  f4.( g8) f4 | d2. |
  f4. g8 f4 | d2. |
  c'2 c4 | a2. |
  bes2 bes4 | f2. |
  g2 g4 | bes4. a8 g4 |
  f4. g8 f4 | d2. |
  g2 g4 | bes4. a8 g4 |
  f4. g8 f4 | d2. |
  c'2 c4 | es4. c8 a4 |
  bes2.( | d2.) |
  bes4.( f8) d4 | f4. es8 c4 |
  bes2.~ | bes2 r4 \bar "|."
}

alto = \relative c' {
  \global
  d4.( es8) d4 | bes2. |
  d4. es8 d4 | bes2. |
  es2 es4 | c2. |
  d2 d4 | d2. |
  es2 es4 | g4. f8 es4 |
  d4. es8 d4 | bes2. |
  es2 es4 | g4. f8 es4 |
  d4. es8 d4 | bes2. |
  es2 es4 | c4. es8 c4 |
  d2.( | f2.) |
  d4.( d8) bes4 | a4. a8 a4 |
  bes2.~ | bes2 r4 \bar "|."
}

tenor = \relative c' {
  \global
  bes2 bes4 | f2. |
  bes2 bes4 | f2. |
  a2 a4 | f2. |
  f2 f4 | bes2. |
  bes2 bes4 | es2 bes4 |
  bes2 bes4 | f2. |
  bes2 bes4 | es2 bes4 |
  bes2 bes4 | f2. |
  a2 a4 | a2 f4 |
  f2.( | bes2.) |
  f4.( bes8) f4 | f4. c8 es4 |
  d2.~ | d2 r4 \bar "|."
}

bass = \relative c' {
  \global
  bes,2 bes4 | bes2. |
  bes2 bes4 | bes2. |
  f'2 f4 | f2. |
  bes,2 bes4 | bes2. |
  es2 es4 | es2 es4 |
  bes2 bes4 | bes2. |
  es2 es4 | es2 es4 |
  bes2 bes4 | bes2. |
  f'2 f4 | f2 f4 |
  bes,2.( | d2.) |
  f2 f4 | f,2 f4 |
  bes2.~ | bes2 r4 \bar "|."
}

firstVerse = \lyricmode {
  \set stanza = "1."
  Stil -- le Nacht, hei -- li -- ge Nacht!
  Al -- les schläft, ein -- sam wacht
  nur das trau -- te, hoch -- hei -- li -- ge Paar.
  Hol -- der Kna -- be im lok -- ki -- gen Haar,
  schlaf in himm -- li -- scher Ruh,
  schlaf in himm -- li -- scher Ruh!
}

secondVerse = \lyricmode {
  \set stanza = "2."
  Stil -- le Nacht, hei -- li -- ge Nacht!
  Got -- tes Sohn, o wie lacht
  Lieb aus dei -- _ nem gött -- li -- chen Mund,
  da uns schlägt _ die ret -- ten -- de Stund,
  Christ, der Ret -- ter, ist da,
  Christ, der Ret -- ter, ist da!
}

thirdVerse = \lyricmode {
  \set stanza = "3."
  Stil -- le Nacht, hei -- li -- ge Nacht!
  Hir -- ten erst kund -- ge -- macht
  durch der En -- _ gel Hal -- le -- lu -- ja,
  tönt es laut _ von fern _ und nah:
  Christ, der Ret -- ter, ist da,
  Christ, der Ret -- ter, ist da!
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
