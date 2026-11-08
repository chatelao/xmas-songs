\version "2.24.0"

\header {
  title = "Schneeflöckchen, Weißröckchen"
  composer = "Volksweise (um 1900)"
  poet = "Hedwig Haberkern (1869)"
  tagline = ##f
}

global = {
  \key g \major
  \time 3/4
  \tempo 4 = 96
  \partial 4
}

harmonies = \chordmode {
  s4 |
  g2. | d2.:7 | d2.:7 | g2. |
  g2. | d2.:7 | c2 d4:7 | g2
}

soprano = \relative c'' {
  \global
  b8( c8) |
  d4 d4 e4 |
  a,4 a4 a8( b8) |
  c4 c4 d4 |
  b2 b8( c8) |
  d4 d4 e4 |
  a,4 a4 b8( c8) |
  d4 g,4 a4 |
  g2 \bar "|."
}

alto = \relative c' {
  \global
  g'8( a8) |
  b4 b4 g4 |
  fis4 fis4 fis8( g8) |
  a4 a4 fis4 |
  g2 g8( a8) |
  b4 b4 g4 |
  fis4 fis4 g8( a8) |
  b4 e,4 fis4 |
  d2 \bar "|."
}

tenor = \relative c' {
  \global
  d4 |
  d4 d4 c4 |
  c4 c4 c4 |
  d4 d4 d4 |
  d2 d4 |
  d4 d4 c4 |
  c4 c4 d4 |
  d4 c4 c4 |
  b2 \bar "|."
}

bass = \relative c {
  \global
  g'4 |
  g4 g4 c,4 |
  d4 d4 d4 |
  d4 d4 d4 |
  g2 g4 |
  g4 g4 c,4 |
  d4 d4 g4 |
  b,4 c4 d4 |
  g,2 \bar "|."
}

firstVerse = \lyricmode {
  \set stanza = "1."
  Schnee -- flöck -- chen, Weiß -- röck -- chen,
  wann kommst du ge -- schneit?
  Du wohnst in den Wol -- ken,
  dein Weg ist so weit.
}

secondVerse = \lyricmode {
  \set stanza = "2."
  Komm, setz dich ans Fen -- ster,
  du lieb -- li -- cher Stern,
  malst Blu -- men und Blät -- ter,
  wir ha -- ben dich gern.
}

thirdVerse = \lyricmode {
  \set stanza = "3."
  Schnee -- flöck -- chen, du deckst uns
  die Blü -- me -- lein zu,
  dann schla -- fen sie si -- cher
  in himm -- li -- scher Ruh.
}

\score {
  <<
    \new ChordNames {
      \set chordChanges = ##t
      \harmonies
    }
    \new ChoirStaff <<
      \new Staff = "upper" \with { instrumentName = "S / A" } <<
        \clef treble
        \new Voice = "soprano" { \voiceOne \soprano }
        \new Voice = "alto" { \voiceTwo \alto }
      >>
      \new Lyrics \lyricsto "soprano" \firstVerse
      \new Lyrics \lyricsto "soprano" \secondVerse
      \new Lyrics \lyricsto "soprano" \thirdVerse
      \new Staff = "lower" \with { instrumentName = "T / B" } <<
        \clef "treble_8"
        \new Voice = "tenor" { \voiceOne \tenor }
        \new Voice = "bass" { \voiceTwo \bass }
      >>
    >>
  >>
  \layout { }
  \midi { }
}
