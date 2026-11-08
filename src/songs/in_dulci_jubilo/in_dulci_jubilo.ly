\version "2.24.0"

\header {
  title = "In dulci jubilo"
  composer = "Traditionell (14. Jh.)"
  poet = "Heinrich Seuse zugeschrieben (um 1328)"
  tagline = ##f
}

global = {
  \key f \major
  \time 3/4
  \tempo 4 = 116
  \partial 4
}

harmonies = \chordmode {
  s4 |
  f2. | f2. | c2. | f2. |
  f2. | f2. | c2. | f2. |
  f2 d4:m | c2 g4:m | d2:m c4 | f2. |
  c2. | f2 c4 | d2:m g4:m | a2:m d4:m |
  f2 bes4 | f2 g4:m | d2:m c4 | f2. |
  c2. | f2 c4 | d2:m a4:7 | d2.:m |
  g2.:m | c2. | f2. | f2. |
  d2.:m | g2:m c4:7 | f2
}

soprano = \relative c' {
  \global
  f4 |
  f2 f4 |
  a2 bes4 |
  c2( d4 |
  c2) c4 |
  f,2 f4 |
  a2 bes4 |
  c2( d4 |
  c2.) |
  c2 d4 |
  c2 bes4 |
  a2( g4) |
  f2 f4 |
  g2 g4 |
  a2 g4 |
  f2( g4 |
  a2) a4 |
  c2 d4 |
  c2 bes4 |
  a2( g4) |
  f2 f4 |
  g2 g4 |
  a2 g4 |
  f2( e4 |
  d2.) |
  d2 d4 |
  e2 e4 |
  f2.( |
  c'2.) |
  a2 a4 |
  g2 g4 |
  f2 \bar "|."
}

alto = \relative c' {
  \global
  c4 |
  c2 c4 |
  f2 f4 |
  e2( f4 |
  e2) e4 |
  c2 c4 |
  f2 f4 |
  e2( f4 |
  e2.) |
  f2 f4 |
  e2 d4 |
  c2( e4) |
  c2 c4 |
  e2 e4 |
  f2 e4 |
  d2.( |
  e2) f4 |
  f2 f4 |
  f2 d4 |
  c2( e4) |
  c2 c4 |
  e2 e4 |
  f2 e4 |
  d2( cis4 |
  d2.) |
  bes2 bes4 |
  c2 c4 |
  c2.( |
  f2.) |
  f2 f4 |
  d2 e4 |
  c2 \bar "|."
}

tenor = \relative c' {
  \global
  a4 |
  a2 a4 |
  c2 d4 |
  c2( bes4 |
  g2) g4 |
  a2 a4 |
  c2 d4 |
  c2( bes4 |
  a2.) |
  a2 a4 |
  g2 g4 |
  f2( c'4) |
  a2 a4 |
  c2 c4 |
  c2 c4 |
  a2( bes4 |
  c2) d4 |
  a2 bes4 |
  a2 g4 |
  f2( c'4) |
  a2 a4 |
  c2 c4 |
  c2 bes4 |
  a2( g4 |
  fis2.) |
  g2 g4 |
  g2 g4 |
  a2.( |
  a2.) |
  d2 c4 |
  bes2 bes4 |
  a2 \bar "|."
}

bass = \relative c {
  \global
  f4 |
  f2 f4 |
  f2 d4 |
  c2( bes4 |
  c2) c4 |
  f2 f4 |
  f2 d4 |
  c2( bes4 |
  f'2.) |
  f2 d4 |
  e2 g4 |
  f2( c4) |
  f2 f4 |
  c2 c4 |
  f2 c4 |
  d2( bes4 |
  a2) d4 |
  f2 bes,4 |
  f'2 g4 |
  f2( c4) |
  f2 f4 |
  c2 c4 |
  f2 c4 |
  d2( a4 |
  d2.) |
  g,2 g4 |
  c2 c4 |
  f2.( |
  f2.) |
  d2 f4 |
  bes,2 c4 |
  f2 \bar "|."
}

firstVerse = \lyricmode {
  \set stanza = "1."
  In dul -- ci ju -- bi -- lo,
  nun sin -- get und seid froh!
  Un -- sers Her -- zens Won -- ne
  liegt in prae -- se -- pi -- o
  und leuch -- tet wie die Son -- ne
  ma -- tris in gre -- mi -- o.
  Al -- pha es et O,
  Al -- pha es et O!
}

secondVerse = \lyricmode {
  \set stanza = "2."
  O Je -- su par -- vu -- le,
  nach dir ist mir so weh!
  Tröst mir mein Ge -- mü -- te,
  o pu -- er op -- ti -- me,
  durch al -- le dei -- ne Gü -- te,
  o prin -- ceps glo -- ri -- ae.
  Tra -- he me post te,
  tra -- he me post te!
}

thirdVerse = \lyricmode {
  \set stanza = "3."
  U -- bi sunt gau -- di -- a?
  Nir -- gends _ mehr denn da,
  wo die En -- gel sin -- gen
  no -- _ va can -- ti -- ca,
  und _ die Glöck -- lein klin -- gen
  in re -- gis cu -- ri -- a.
  E -- ja, wärn wir da,
  e -- ja, wärn wir da!
}

\score {
  <<
    \new ChordNames {
      \set chordChanges = ##t
      \harmonies
    }
    \new ChoirStaff <<
      \new Staff = "upper" \with { instrumentName = "S / A" } <<
        \clef treble
        \new Voice = "soprano" { \voiceOne \soprano }
        \new Voice = "alto" { \voiceTwo \alto }
      >>
      \new Lyrics \lyricsto "soprano" \firstVerse
      \new Lyrics \lyricsto "soprano" \secondVerse
      \new Lyrics \lyricsto "soprano" \thirdVerse
      \new Staff = "lower" \with { instrumentName = "T / B" } <<
        \clef "treble_8"
        \new Voice = "tenor" { \voiceOne \tenor }
        \new Voice = "bass" { \voiceTwo \bass }
      >>
    >>
  >>
  \layout { }
  \midi { }
}
