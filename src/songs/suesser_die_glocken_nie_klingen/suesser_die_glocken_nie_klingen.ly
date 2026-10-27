\version "2.24.0"

\header {
  title = "Süsser die Glocken nie klingen"
  composer = "Traditionell"
  poet = "Friedrich Wilhelm Kritzinger (1860)"
  tagline = ##f
}

global = {
  \key g \major
  \time 6/8
  \tempo 4. = 50
}

harmonies = \chordmode {
  g2. | g2. | c4. g4. | d2.:7 |
  g2. | g2. | d2.:7 | g2. |
  g2. | c2. | d2.:7 | g2. |
  g2. | g2. | d2.:7 | g2. |
}

soprano = \relative c' {
  \global
  g'4 g8 a4 a8 |
  b4. b4. |
  c4 c8 b4 b8 |
  a2. |
  g4 g8 a4 a8 |
  b4. b4. |
  a4 g8 a4 b8 |
  g2. |
  d'4 d8 c4 b8 |
  c4. a4. |
  c4 c8 b4 a8 |
  b2. |
  g4 g8 a4 a8 |
  b4. b4. |
  a4 g8 a4 b8 |
  g2. \bar "|."
}

alto = \relative c' {
  \global
  d4 d8 fis4 fis8 |
  g4. g4. |
  g4 g8 g4 g8 |
  fis2. |
  d4 d8 fis4 fis8 |
  g4. g4. |
  fis4 d8 fis4 fis8 |
  d2. |
  b'4 b8 a4 g8 |
  a4. e4. |
  a4 a8 g4 fis8 |
  g2. |
  d4 d8 fis4 fis8 |
  g4. g4. |
  fis4 d8 fis4 fis8 |
  d2. \bar "|."
}

tenor = \relative c' {
  \global
  b4 b8 d4 d8 |
  d4. d4. |
  e4 e8 d4 d8 |
  d2. |
  b4 b8 d4 d8 |
  d4. d4. |
  c4 b8 c4 d8 |
  b2. |
  g'4 g8 e4 d8 |
  e4. c4. |
  d4 d8 d4 c8 |
  d2. |
  b4 b8 d4 d8 |
  d4. d4. |
  c4 b8 c4 d8 |
  b2. \bar "|."
}

bass = \relative c {
  \global
  g'4 g8 d4 d8 |
  g4. g4. |
  c,4 c8 g'4 g8 |
  d2. |
  g4 g8 d4 d8 |
  g4. g4. |
  d4 e8 d4 d8 |
  g,2. |
  g'4 g8 c,4 g'8 |
  c,4. c4. |
  d4 d8 d4 d8 |
  g,2. |
  g'4 g8 d4 d8 |
  g4. g4. |
  d4 e8 d4 d8 |
  g,2. \bar "|."
}

firstVerse = \lyricmode {
  Süss -- er die Glo -- cken nie klin -- gen
  als zu der Weih -- nachts -- zeit,
  's_ist, als ob En -- gel -- lein sin -- gen
  wie -- der von Freud' und Leid.
  Wie sie ge -- sun -- gen in hei -- li -- ger Nacht,
  Glo -- cken mit hei -- li -- gem Klang,
  klin -- get die Er -- de ent -- lang!
}

secondVerse = \lyricmode {
  O, wenn die Glo -- cken er -- klin -- gen,
  schnell mit je -- dem Ton
  dringt ein Ge -- bet in den Him -- mel,
  hoch zu des Va -- ters Thron.
  O wie er -- freu -- et uns die -- se Ge -- stalt,
  Glo -- cken mit hei -- li -- gem Klang,
  klin -- get die Er -- de ent -- lang!
}

thirdVerse = \lyricmode {
  Klin -- get mit lieb -- li -- chem Schal -- le
  ü -- ber die Mee -- re hin -- weg,
  dass sie er -- schal -- le in al -- len
  Her -- zen am je -- di -- gen Fleck.
  Schüt -- zet die Schwa -- chen und trös -- tet die Not,
  Glo -- cken mit hei -- li -- gem Klang,
  klin -- get die Er -- de ent -- lang!
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
