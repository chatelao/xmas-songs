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

melody = \relative c' {
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
  f2. \bar "|."
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
    \new Staff {
      \new Voice = "singer" { \melody }
    }
    \new Lyrics \lyricsto "singer" \firstVerse
    \new Lyrics \lyricsto "singer" \secondVerse
  >>
  \layout { }
  \midi { }
}
