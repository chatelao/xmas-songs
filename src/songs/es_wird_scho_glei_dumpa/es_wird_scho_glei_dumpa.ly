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

melody = \relative c' {
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
    \new Staff {
      \new Voice = "singer" { \melody }
    }
    \new Lyrics \lyricsto "singer" \firstVerse
    \new Lyrics \lyricsto "singer" \secondVerse
  >>
  \layout { }
  \midi { }
}
