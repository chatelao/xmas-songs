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
  \tempo 4. = 44
}

harmonies = \chordmode {
  g4. d4.:7 | g2. |
  c4. a4.:7 | d2. |
  d2.:7 | g2. |
  a4.:m d4.:7 | g2.
}

soprano = \relative c'' {
  \global
  b4 b8 a8 b8 a8 |
  g2. |
  g4 e8 g8 fis8 e8 |
  d2. |
  a'8 gis8 a8 c8 b8 a8 |
  g2. |
  a8. e16 e8 fis8 e8 fis8 |
  g2. \bar "|."
}

alto = \relative c' {
  \global
  g'4 g8 fis8 g8 fis8 |
  d2. |
  e4 c8 e8 d8 cis8 |
  d2. |
  fis8 f8 fis8 a8 g8 fis8 |
  d2. |
  c8. c16 c8 d8 c8 d8 |
  d2. \bar "|."
}

tenor = \relative c' {
  \global
  d4 d8 c8 d8 c8 |
  b2. |
  c4 g8 a8 a8 g8 |
  fis2. |
  c'8 b8 c8 d8 d8 c8 |
  b2. |
  e,8. a16 a8 a8 a8 c8 |
  b2. \bar "|."
}

bass = \relative c {
  \global
  g'4 g8 d8 d8 d8 |
  g2. |
  c,4 c8 cis8 a8 a8 |
  d2. |
  d8 d8 d8 d8 d8 d8 |
  g2. |
  c,8. c16 c8 d8 d8 d8 |
  g,2. \bar "|."
}

firstVerse = \lyricmode {
  \set stanza = "1."
  Lei -- se rie -- selt der Schnee,
  still und starr ruht der See,
  weih -- nacht -- lich glän -- zet der Wald:
  Freu -- e dich, Christ -- kind kommt bald!
}

secondVerse = \lyricmode {
  \set stanza = "2."
  In den Her -- zen ist's warm,
  still schweigt Kum -- mer und Harm,
  Sor -- ge des Le -- bens ver -- hallt:
  Freu -- e dich, Christ -- kind kommt bald!
}

thirdVerse = \lyricmode {
  \set stanza = "3."
  Bald ist hei -- li -- ge Nacht,
  Chor der En -- gel er -- wacht,
  hört nur, wie lieb -- lich es schallt:
  Freu -- e dich, Christ -- kind kommt bald!
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
