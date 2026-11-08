\version "2.24.0"

\header {
  title = "Lasst uns froh und munter sein"
  composer = "Volksweise aus dem Hunsrück (19. Jh.)"
  poet = "Traditionell (um 1850)"
  tagline = ##f
}

global = {
  \key g \major
  \time 4/4
  \tempo 4 = 112
}

harmonies = \chordmode {
  g1 | g1 |
  d1:7 | d1:7 |
  c2 a2:m | d2:7 g2 |
  g1 | d2:7 g2 |
  g1 | d2:7 g2
}

soprano = \relative c'' {
  \global
  % Takt 1-2: Lasst uns froh und munter sein
  b4 b4 b8( c8) b8 a8 |
  g2 d2 |
  % Takt 3-4: und uns recht von Herzen freun!
  a'4 a4 a8( b8) a8 g8 |
  fis2 d2 |
  % Takt 5-6: Lustig, lustig, trallerallera!
  g4. e8 g4. e8 |
  a8 fis8 a8 fis8 b2 |
  % Takt 7-8: Bald ist Nikolausabend da,
  b8( c8) b8( a8) g8 a8 b4 |
  a4 fis4 g2 |
  % Takt 9-10: bald ist Nikolausabend da!
  b8( c8) b8( a8) g8 a8 b4 |
  a4 fis4 g2 \bar "|."
}

alto = \relative c' {
  \global
  g'4 g4 g8( a8) g8 fis8 |
  d2 b2 |
  fis'4 fis4 fis8( g8) fis8 e8 |
  d2 c2 |
  e4. c8 e4. c8 |
  fis8 d8 fis8 d8 g2 |
  g8( a8) g8( fis8) e8 fis8 g4 |
  fis4 d4 d2 |
  g8( a8) g8( fis8) e8 fis8 g4 |
  fis4 d4 d2 \bar "|."
}

tenor = \relative c' {
  \global
  d4 d4 d4 d8 c8 |
  b2 g2 |
  c4 c4 c4 c8 b8 |
  a2 fis2 |
  c'4. g8 c4. g8 |
  c8 a8 c8 a8 d2 |
  d8( d8) d8( d8) b8 c8 d4 |
  c4 a4 b2 |
  d8( d8) d8( d8) b8 c8 d4 |
  c4 a4 b2 \bar "|."
}

bass = \relative c {
  \global
  g'4 g4 g4 d4 |
  g2 g,2 |
  d'4 d4 d4 d4 |
  d2 d2 |
  c4. c8 c4. c8 |
  d8 d8 d8 d8 g2 |
  g8( g8) g8( d8) e8 d8 g4 |
  d4 d4 g,2 |
  g'8( g8) g8( d8) e8 d8 g4 |
  d4 d4 g,2 \bar "|."
}

firstVerse = \lyricmode {
  \set stanza = "1."
  Lasst uns froh und mun -- ter sein
  und uns recht von Her -- zen freun!
  Lus -- tig, lus -- tig, tral -- le -- ral -- le -- ra!
  Bald ist Ni -- ko -- laus -- a -- bend da,
  bald ist Ni -- ko -- laus -- a -- bend da!
}

secondVerse = \lyricmode {
  \set stanza = "2."
  Dann stell ich den Tel -- ler auf,
  Nik -- laus legt ge -- wiss was drauf.
  Lus -- tig, lus -- tig, tral -- le -- ral -- le -- ra!
  Bald ist Ni -- ko -- laus -- a -- bend da,
  bald ist Ni -- ko -- laus -- a -- bend da!
}

thirdVerse = \lyricmode {
  \set stanza = "3."
  Nik -- laus ist ein gu -- ter Mann,
  dem man nicht g'nug dan -- ken kann.
  Lus -- tig, lus -- tig, tral -- le -- ral -- le -- ra!
  Bald ist Ni -- ko -- laus -- a -- bend da,
  bald ist Ni -- ko -- laus -- a -- bend da!
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
