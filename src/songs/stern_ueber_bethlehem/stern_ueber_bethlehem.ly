\version "2.24.0"

\header {
  title = "Stern über Bethlehem"
  composer = "Alfred Hans Zoller (1964)"
  poet = "Alfred Hans Zoller (1964)"
  tagline = ##f
}

global = {
  \key e \minor
  \time 4/4
  \tempo 4 = 110
}

harmonies = \chordmode {
  e2:m d2 | e1:m | a2:m b2:7 | e1:m |
  c2 g2 | a2:m b2:7 | e2:m b2:7 | e1:m |
}

soprano = \relative c' {
  \global
  e4 e4 e4 fis4 |
  g2 e2 |
  a4 a4 a4 b4 |
  g1 |
  c4 c4 c4 b4 |
  a2 fis2 |
  b4 b4 a4 g4 |
  e1 \bar "|."
}

alto = \relative c' {
  \global
  b4 b4 c4 d4 |
  e2 b2 |
  e4 e4 fis4 fis4 |
  e1 |
  g4 g4 g4 g4 |
  e2 d2 |
  g4 g4 fis4 e4 |
  b1 \bar "|."
}

tenor = \relative c' {
  \global
  g4 g4 g4 a4 |
  b2 g2 |
  c4 c4 c4 d4 |
  b1 |
  e4 e4 e4 d4 |
  c2 b2 |
  b4 b4 c4 b4 |
  g1 \bar "|."
}

bass = \relative c {
  \global
  e4 e4 c4 d4 |
  e2 e2 |
  a,4 a4 d4 b4 |
  e1 |
  c4 c4 c4 g'4 |
  a,2 b2 |
  e4 e4 a,4 b4 |
  e,1 \bar "|."
}

firstVerse = \lyricmode {
  Stern über Beth -- le -- hem, zeig uns den Weg,
  führ uns nach Beth -- le -- hem, zeig uns den Weg.
  Lass uns den Stai -- er sehn, lass uns das Kind ver -- stehn,
  stern über Beth -- le -- hem, zeig uns den Weg.
}

secondVerse = \lyricmode {
  Stern über Beth -- le -- hem, bleib nicht stehn,
  du sollst den Weg uns vor -- an -- gehn.
  Führ uns zum Stall hin -- zu, gib un -- sren Her -- zen Ruh,
  stern über Beth -- le -- hem, bleib nicht stehn.
}

thirdVerse = \lyricmode {
  Stern über Beth -- le -- hem, wir sind am Ziel,
  denn die -- ser Gar -- ten be -- deu -- tet uns viel.
  Wir se -- hen das Kind und wir sin -- gen vor Freud,
  stern über Beth -- le -- hem, wir sind am Ziel.
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
