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

melody = \relative c' {
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
    \new Staff {
      \new Voice = "singer" { \melody }
    }
    \new Lyrics \lyricsto "singer" \firstVerse
    \new Lyrics \lyricsto "singer" \secondVerse
    \new Lyrics \lyricsto "singer" \thirdVerse
  >>
  \layout { }
  \midi { }
}
