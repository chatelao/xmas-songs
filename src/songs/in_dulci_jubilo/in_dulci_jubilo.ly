\version "2.24.0"

\header {
  title = "In dulci jubilo"
  composer = "Heinrich Seuse (14. Jh.)"
  poet = "Heinrich Seuse (14. Jh.)"
  tagline = ##f
}

global = {
  \key f \major
  \time 3/4
  \tempo 4 = 110
}

harmonies = \chordmode {
  \partial 4 s4 |
  f2. | f2. | c2. | f2. |
  f2. | f2. | c2. | f2. |
  f2. | c2. | d2.:m | f2. |
  c2. | d2.:m | c2. | d2.:m |
  c2. | d2.:m | c2. | d2.:m |
  g2.:m | c2. | f2. | f2. |
  d2.:m | c2.:7 | f2 |
}

soprano = \relative c' {
  \global
  \partial 4 f4 |
  f2 f4 |
  a2 bes4 |
  c2( d4) |
  c2 f,4 |
  f2 f4 |
  a2 bes4 |
  c2( d4) |
  c2. |
  c2 d4 |
  c2 bes4 |
  a2 g4 |
  f2 f4 |
  g2 g4 |
  a2 g4 |
  f2( e4) |
  d2 f4 |
  g2 g4 |
  a2 g4 |
  f2( e4) |
  d2. |
  d2 d4 |
  e2 e4 |
  f2. |
  c'2. |
  a2 a4 |
  g2 g4 |
  f2 \bar "|."
}

alto = \relative c' {
  \global
  \partial 4 c4 |
  c2 c4 |
  f2 f4 |
  g2. |
  a2 c,4 |
  c2 c4 |
  f2 f4 |
  g2. |
  a2. |
  a2 bes4 |
  g2 g4 |
  f2 e4 |
  c2 f4 |
  e2 e4 |
  f2 e4 |
  d2( c4) |
  a2 f'4 |
  e2 e4 |
  f2 e4 |
  d2( c4) |
  a2. |
  bes2 bes4 |
  c2 c4 |
  c2. |
  f2. |
  f2 f4 |
  e2 e4 |
  c2 \bar "|."
}

tenor = \relative c' {
  \global
  \partial 4 a4 |
  a2 a4 |
  c2 d4 |
  e2( f4) |
  f2 a,4 |
  a2 a4 |
  c2 d4 |
  e2( f4) |
  f2. |
  f2 f4 |
  e2 c4 |
  c2 bes4 |
  a2 a4 |
  c2 c4 |
  c2 bes4 |
  a2( g4) |
  f2 d'4 |
  c2 c4 |
  c2 bes4 |
  a2( g4) |
  f2. |
  f2 f4 |
  g2 g4 |
  a2. |
  a2. |
  c2 c4 |
  c2 bes4 |
  a2 \bar "|."
}

bass = \relative c {
  \global
  \partial 4 f4 |
  f2 f4 |
  f2 f4 |
  c2. |
  f2 f4 |
  f2 f4 |
  f2 f4 |
  c2. |
  f2. |
  f2 bes4 |
  c2 c,4 |
  d4 d4 c4 |
  f2 f4 |
  c2 c4 |
  d4 d4 c4 |
  d2( c4) |
  d2 d4 |
  c2 c4 |
  d4 d4 c4 |
  d2( c4) |
  d2. |
  g,2 g4 |
  c2 c4 |
  f,2. |
  f'2. |
  d2 d4 |
  c2 c4 |
  f,2 \bar "|."
}

firstVerse = \lyricmode {
  In dul -- ci ju -- bi -- lo
  nun sin -- get und seid froh!
  Un -- sers Her -- zens Won -- ne
  liegt in prae -- se -- pi -- o
  und leuch -- tet als die Son -- ne
  ma -- tris in gre -- mi -- o.
  Al -- pha es et O,
  Al -- pha es et O.
}

secondVerse = \lyricmode {
  O Je -- su par -- vu -- le,
  nach dir ist mir so weh!
  Tröst mir mein Ge -- mü -- te,
  o pu -- er op -- ti -- me,
  durch al -- le dei -- ne Gü -- te,
  o prin -- ceps glo -- ri -- ae.
  Tra -- he me post te,
  Tra -- he me post te.
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
