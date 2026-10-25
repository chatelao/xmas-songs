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

melody = \relative c'' {
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
