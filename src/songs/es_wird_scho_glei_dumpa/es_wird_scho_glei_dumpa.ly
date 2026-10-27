\version "2.24.0"

\header {
  title = "Es wird scho glei dumpa"
  composer = "Anton Reidinger (1884)"
  poet = "Anton Reidinger (1884)"
  tagline = ##f
}

global = {
  \key f \major
  \time 3/4
  \tempo 4 = 80
}

harmonies = \chordmode {
  f2. | f2. | c2.:7 | c2.:7 |
  f2. | g2.:m | c2. | c2. |
  f2. | f2. | c2.:7 | c2.:7 |
  f2. | g2.:m | c2.:7 | f2. |
}

soprano = \relative c' {
  \global
  f4. g8 a4 |
  f2 c4 |
  g'4. a8 bes4 |
  g2 r4 |
  a4. bes8 c4 |
  bes2 a4 |
  g4. a8 f4 |
  e2 r4 |
  f4. g8 a4 |
  f2 c4 |
  g'4. a8 bes4 |
  g2 r4 |
  a4. bes8 c4 |
  bes2 a4 |
  g4 c4 e,4 |
  f2. \bar "|."
}

alto = \relative c' {
  \global
  c4. e8 f4 |
  c2 c4 |
  e4. f8 g4 |
  e2 r4 |
  f4. g8 a4 |
  g2 f4 |
  e4. f8 d4 |
  c2 r4 |
  c4. e8 f4 |
  c2 c4 |
  e4. f8 g4 |
  e2 r4 |
  f4. g8 a4 |
  g2 f4 |
  e4 e4 c4 |
  c2. \bar "|."
}

tenor = \relative c' {
  \global
  a4. bes8 c4 |
  a2 f4 |
  c'4. c8 c4 |
  c2 r4 |
  c4. c8 c4 |
  d2 c4 |
  c4. c8 g4 |
  g2 r4 |
  a4. bes8 c4 |
  a2 f4 |
  c'4. c8 c4 |
  c2 r4 |
  c4. c8 c4 |
  d2 c4 |
  c4 g4 g4 |
  a2. \bar "|."
}

bass = \relative c {
  \global
  f4. f8 f4 |
  f2 a,4 |
  c4. f8 e4 |
  c2 r4 |
  f4. g8 a4 |
  g2 f4 |
  c4. c8 b4 |
  c2 r4 |
  f4. f8 f4 |
  f2 a,4 |
  c4. f8 e4 |
  c2 r4 |
  f4. g8 a4 |
  g2 f4 |
  c4 c4 c4 |
  f,2. \bar "|."
}

firstVerse = \lyricmode {
  Es wird scho glei dum -- pa,
  es wird scho glei Nacht,
  drum kimm i zu dir her,
  mei Hei -- land, a -- wacht.
  Wir sin -- gen a Lia -- dl
  dem Kind -- lein so klein,
  du magst ja mei Hei -- land
  und Trös -- ter gar sein.
}

secondVerse = \lyricmode {
  O Je -- sus, du Kind -- lein,
  so lieb und so mild,
  du hast mir ge -- ben -- det
  mei Seh -- nen so wild.
  Drum schlaf nun in Ru -- he,
  mein lieb -- li -- ches Kind,
  die Mut -- ter, sie wiegt dich
  im küh -- len -- den Wind.
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
