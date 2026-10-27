\version "2.24.0"

\header {
  title = "Leise rieselt der Schnee"
  composer = "Eduard Ebel (1895)"
  poet = "Eduard Ebel (1895)"
  tagline = ##f
}

global = {
  \key g \major
  \time 6/8
  \tempo 4. = 48
}

harmonies = \chordmode {
  g2. | g2. | c2. | g2. |
  d2.:7 | g2. | d2.:7 | g2. |
}

soprano = \relative c'' {
  \global
  b4 b8 b8( a8) b8 |
  g4. d4. |
  e4 e8 g4 e8 |
  d2. |
  a'4 a8 a8( g8) a8 |
  b4. g4. |
  a4 a8 b4 a8 |
  g2. \bar "|."
}

alto = \relative c' {
  \global
  g'4 g8 g8( fis8) g8 |
  d4. b4. |
  c4 c8 e4 c8 |
  b2. |
  fis'4 fis8 fis8( e8) fis8 |
  g4. d4. |
  fis4 fis8 g4 fis8 |
  d2. \bar "|."
}

tenor = \relative c' {
  \global
  d4 d8 d4 d8 |
  b4. g4. |
  g4 g8 c4 g8 |
  g2. |
  c4 c4 c8 c8 |
  d4. b4. |
  c4 c8 d4 c8 |
  b2. \bar "|."
}

bass = \relative c {
  \global
  g'4 g8 g4 g8 |
  g4. g,4. |
  c4 c8 c4 c8 |
  g2. |
  d'4 d8 d4 d8 |
  g4. g,4. |
  d'4 d8 d4 d8 |
  g,2. \bar "|."
}

firstVerse = \lyricmode {
  Lei -- se rie -- selt der Schnee,
  still und starr ruht der See,
  weih -- nacht -- lich glän -- zet der Wald:
  Freue dich, Christ -- kind kommt bald!
}

secondVerse = \lyricmode {
  In den Her -- zen ist's warm,
  still schweigt Kum -- mer und Harm,
  Sor -- ge des Le -- bens ver -- hallt:
  Freue dich, Christ -- kind kommt bald!
}

thirdVerse = \lyricmode {
  Bald ist hei -- li -- ge Nacht,
  Chor der En -- gel er -- wacht,
  hört nur, wie lieb -- lich es schallt:
  Freue dich, Christ -- kind kommt bald!
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
