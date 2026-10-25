\version "2.24.0"

\header {
  title = "Zu Bethlehem geboren"
  composer = "Traditionell (1638)"
  poet = "Friedrich Spee (1637)"
  tagline = ##f
}

global = {
  \key f \major
  \time 6/8
  \tempo 4. = 50
}

melody = \relative c' {
  \global
  f4 f8 g4 g8 |
  a4. f4. |
  bes4 bes8 a4 a8 |
  g2. |
  f4 f8 g4 g8 |
  a4. f4. |
  g4 f8 e4 e8 |
  f2. |
  c'4 c8 d4 d8 |
  c4. a4. |
  bes4 bes8 a4 a8 |
  g2. |
  f4 f8 g4 g8 |
  a4. f4. |
  g4 f8 e4 e8 |
  f2. \bar "|."
}

firstVerse = \lyricmode {
  Zu Beth -- le -- hem ge -- bo -- ren
  ist uns ein Kind -- lein klein,
  das hab ich aus -- er -- ko -- ren,
  soll mein Ei -- gen sein.
  Eia, eia, soll mein Ei -- gen sein!
}

secondVerse = \lyricmode {
  In In -- nig -- keit um -- fan -- gen
  soll es mein Her -- ze sein,
  nach ihm steht mein Ver -- lan -- gen,
  ihm er -- geb ich mich rein.
  Eia, eia, ihm er -- geb ich mich rein!
}

thirdVerse = \lyricmode {
  Das Kind -- lein muss ich lie -- ben,
  wie koennt ich 's las -- sen stehn?
  Kein Lei -- den soll mich trü -- ben,
  will stets zu ihm nur gehn.
  Eia, eia, will stets zu ihm nur gehn!
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
