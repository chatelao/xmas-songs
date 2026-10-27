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

harmonies = \chordmode {
  f2. | f2. | g2.:m | c2. |
  f2. | f2. | c2.:7 | f2. |
  f2. | f2. | g2.:m | c2. |
  f2. | f2. | c2.:7 | f2. |
}

soprano = \relative c' {
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

alto = \relative c' {
  \global
  c4 c8 e4 e8 |
  f4. c4. |
  d4 d8 f4 f8 |
  e2. |
  c4 c8 e4 e8 |
  f4. c4. |
  e4 d8 c4 c8 |
  c2. |
  f4 f8 f4 f8 |
  f4. f4. |
  d4 d8 f4 f8 |
  e2. |
  c4 c8 e4 e8 |
  f4. c4. |
  e4 d8 c4 c8 |
  c2. \bar "|."
}

tenor = \relative c' {
  \global
  a4 a8 c4 c8 |
  c4. a4. |
  f4 g8 a4 d8 |
  c2. |
  a4 a8 c4 c8 |
  c4. a4. |
  c4 a8 g4 g8 |
  a2. |
  a4 a8 bes4 bes8 |
  a4. c4. |
  f,4 g8 a4 d8 |
  c2. |
  a4 a8 c4 c8 |
  c4. a4. |
  c4 a8 g4 g8 |
  a2. \bar "|."
}

bass = \relative c {
  \global
  f4 f8 c4 c8 |
  f4. f,4. |
  g4 g8 d'4 d8 |
  c2. |
  f4 f8 c4 c8 |
  f4. f,4. |
  c'4 d8 c4 c8 |
  f,2. |
  f'4 f8 bes,4 bes8 |
  f4. f4. |
  g4 g8 d'4 d8 |
  c2. |
  f4 f8 c4 c8 |
  f4. f,4. |
  c'4 d8 c4 c8 |
  f,2. \bar "|."
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
