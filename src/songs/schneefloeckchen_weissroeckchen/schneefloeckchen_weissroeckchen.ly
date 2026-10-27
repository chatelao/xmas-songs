\version "2.24.0"

\header {
  title = "Schneeflöckchen, Weissröckchen"
  composer = "Traditionell"
  poet = "Hedwig Haberkern (1869)"
  tagline = ##f
}

global = {
  \key g \major
  \time 3/4
  \tempo 4 = 96
}

harmonies = \chordmode {
  g2. | c2. | g2. | d2.:7 |
  g2. | c2. | g4 d2:7 | g2. |
}

soprano = \relative c'' {
  \global
  d4 b4 g4 |
  e2 a4 |
  d4 b4 g4 |
  a2. |
  d4 b4 g4 |
  e2 a4 |
  g4 fis4 a4 |
  g2. \bar "|."
}

alto = \relative c' {
  \global
  b'4 g4 d4 |
  c2 e4 |
  b'4 g4 d4 |
  fis2. |
  b4 g4 d4 |
  c2 e4 |
  d4 d4 fis4 |
  d2. \bar "|."
}

tenor = \relative c' {
  \global
  d4 d4 b4 |
  g2 c4 |
  d4 d4 b4 |
  c2. |
  d4 d4 b4 |
  g2 c4 |
  b4 a4 c4 |
  b2. \bar "|."
}

bass = \relative c {
  \global
  g'4 g4 g4 |
  c,2 c4 |
  g'4 g4 g4 |
  d2. |
  g4 g4 g4 |
  c,2 c4 |
  d4 d4 d4 |
  g,2. \bar "|."
}

firstVerse = \lyricmode {
  Schnee -- flöck -- chen, Weiss -- röck -- chen,
  wann kommst du ge -- schneit?
  Du wohnst in den Wol -- ken,
  dein Weg ist so weit.
}

secondVerse = \lyricmode {
  Komm setz dich ans Fen -- ster,
  du lieb -- li -- cher Gast,
  du bringst uns den Win -- ter,
  machst Freu -- de uns fast.
}

thirdVerse = \lyricmode {
  Schnee -- flöck -- chen, du deckst uns
  die Blüm -- lein be -- schirmt,
  dann schla -- fen sie si -- cher,
  wenn's wet -- tert und stürmt.
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
