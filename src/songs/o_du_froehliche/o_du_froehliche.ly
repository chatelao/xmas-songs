\version "2.24.0"

\header {
  title = "O du fröhliche"
  composer = "Sizilianische Volksweise"
  poet = "Johannes Daniel Falk (1816) / Heinrich Holzschuher (1829)"
  tagline = ##f
}

global = {
  \key d \major
  \time 4/4
  \tempo 4 = 100
}

harmonies = \chordmode {
  d2 g2 | d2 d2 | d2 g2 | d2 d2 |
  d2 d2 | g2 e2:m | a2 e2:7 | a1 |
  d2 a2:7 | d2 d2 | a2:7 d2 | a2:7 a2:7 |
  d2 g2 | d2 g2 | d2 a2:7 | d1 |
}

soprano = \relative c'' {
  \global
  a2 b2 |
  a4. g8 fis4 g4 |
  a2 b2 |
  a4. g8 fis4 g4 \bar "||" \break
  a2 a2 |
  b2 cis4 d4 |
  cis2 b2 |
  a1 \bar "||" \break
  a4. b8 a4 g4 |
  fis4. g8 a2 |
  g4. a8 g4 fis4 |
  e4. fis8 g2 |
  fis2 g2 |
  a2 b4 cis4 |
  d2 cis2 |
  d1 \bar "|."
}

alto = \relative c' {
  \global
  fis2 g2 |
  fis4. e8 d4 e4 |
  fis2 g2 |
  fis4. e8 d4 e4 |
  fis2 fis2 |
  g2 g4 f4 |
  e2 e2 |
  cis1 |
  fis4. g8 fis4 e4 |
  d4. e8 fis2 |
  e4. fis8 e4 d4 |
  cis4. d8 e2 |
  d2 e2 |
  fis2 g4 g4 |
  fis2 e2 |
  fis1 \bar "|."
}

tenor = \relative c' {
  \global
  d2 d2 |
  d4. a8 a4 a4 |
  d2 d2 |
  d4. a8 a4 a4 |
  d2 d2 |
  d2 e4 d4 |
  a2 g2 |
  e1 |
  a4. a8 a4 a4 |
  a4. a8 d2 |
  a4. a8 a4 a4 |
  a4. a8 cis2 |
  a2 b2 |
  d2 d4 e4 |
  a,2 g2 |
  a1 \bar "|."
}

bass = \relative c {
  \global
  d2 g,2 |
  d'4. d8 d4 d4 |
  d2 g,2 |
  d'4. d8 d4 d4 |
  d2 d2 |
  g2 e4 d4 |
  a'2 e2 |
  a,1 |
  d4. d8 d4 cis4 |
  d4. d8 d2 |
  cis4. cis8 cis4 d4 |
  a4. a8 a2 |
  d2 g,2 |
  d'2 g,4 e4 |
  fis2 a2 |
  d1 \bar "|."
}

firstVerse = \lyricmode {
  O du fröh -- li -- che, o du se -- li -- ge,
  gnad -- brin -- gen -- de Weih -- nachts -- zeit!
  Welt ging ver -- lo -- ren, Christ ist ge -- bo -- ren:
  Freu e, freu e dich, o Chris -- ten -- heit!
}

secondVerse = \lyricmode {
  O du fröh -- li -- che, o du se -- li -- ge,
  gnad -- brin -- gen -- de Weih -- nachts -- zeit!
  Christ ist er -- schie -- nen, uns zu ver mei -- nen:
  Freu e, freu e dich, o Chris -- ten -- heit!
}

thirdVerse = \lyricmode {
  O du fröh -- li -- che, o du se -- li -- ge,
  gnad -- brin -- gen -- de Weih -- nachts -- zeit!
  Himm -- li -- sche Hee -- re jauch -- zen dir Eh -- re:
  Freu e, freu e dich, o Chris -- ten -- heit!
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
