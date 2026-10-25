\version "2.24.0"

\header {
  title = "Jingle Bells"
  composer = "James Lord Pierpont (1857)"
  poet = "James Lord Pierpont"
  tagline = ##f
}

global = {
  \key g \major
  \time 4/4
  \tempo 4 = 120
}

melody = \relative c'' {
  \global
  d4 b4 a4 g4 |
  d1 |
  d'4 b4 a4 g4 |
  e1 |
  e'4 c4 b4 a4 |
  fis1 |
  d'4 d4 c4 a4 |
  b1 |
  d4 b4 a4 g4 |
  d1 |
  d'4 b4 a4 g4 |
  e1 |
  e'4 c4 b4 a4 |
  d4 d4 d4 d4 |
  e4 d4 c4 a4 |
  g1 \bar "||"
  b4 b4 b2 |
  b4 b4 b2 |
  b4 d4 g,4. a8 |
  b1 |
  c4 c4 c4. c8 |
  c4 b4 b4 b8 b8 |
  b4 a4 a4 b4 |
  a2 d2 |
  b4 b4 b2 |
  b4 b4 b2 |
  b4 d4 g,4. a8 |
  b1 |
  c4 c4 c4. c8 |
  c4 b4 b4 b8 b8 |
  d4 d4 c4 a4 |
  g1 \bar "|."
}

firstVerse = \lyricmode {
  Durch den wei -- ssen Schnee
  in ei -- nem of -- fnen Schlitten,
  über die Fel -- der gal -- op -- pie -- ren wir,
  la -- chend den gan -- zen Weg.
  Glocken an Pfer -- de -- schwanzen rin -- gen,
  ma -- chen die Geis -- ter hell,
  was für ein Spass es ist zu rei -- ten und zu sin -- gen
  ein Schlitten -- lied heu -- te Nacht!
  Jin -- gle Bells, Jin -- gle Bells,
  jin -- gle all the way!
  O what fun it is to ride
  in a one-horse o -- pen sleigh, hey!
  Jin -- gle Bells, Jin -- gle Bells,
  jin -- gle all the way!
  O what fun it is to ride
  in a one-horse o -- pen sleigh!
}

secondVerse = \lyricmode {
  Ein Tag oder zwei zu -- vor
  dachte ich, ich ma -- che ei -- ne Fahrt,
  und bald war Fräu -- lein Fan -- ny Bright
  an mei -- ner Sei -- te sit -- zend.
  Das Pferd war ma -- ger und schlank,
  Misch -- geschick schien sein Los,
  wir rie -- ten in ei -- ne Ver -- we -- hung
  und wir, wir wur -- den um -- ge -- wor -- fen.
  Jin -- gle Bells, Jin -- gle Bells,
  jin -- gle all the way!
  O what fun it is to ride
  in a one-horse o -- pen sleigh, hey!
  Jin -- gle Bells, Jin -- gle Bells,
  jin -- gle all the way!
  O what fun it is to ride
  in a one-horse o -- pen sleigh!
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
