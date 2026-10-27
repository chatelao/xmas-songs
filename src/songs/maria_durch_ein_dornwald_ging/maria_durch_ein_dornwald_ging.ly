\version "2.24.0"

\header {
  title = "Maria durch ein Dornwald ging"
  composer = "Traditionell (Eichsfeld)"
  poet = "Traditionelles Volkslied (16. Jh.)"
  tagline = ##f
}

global = {
  \key g \minor
  \time 4/4
  \tempo 4 = 96
}

harmonies = \chordmode {
  g2:m g4:m f4 | g2:m d2:7 | g4:m g4:m d2 | g1:m |
  g2:m g4:m f4 | g2:m d2:7 | g4:m g4:m d2 | g2.:m
  g4:m | c4:m c4:m g2:m | g1:m | c4:m c4:m g2:m | g2.:m
  g4:m | g2:m d2 | g2:m c2:m | g4:m c4:m g4:m d4:7 | g1:m |
}

soprano = \relative c' {
  \global
  d4 g4 g4 a4 |
  bes2 a2 |
  g4 g4 fis4 fis4 |
  g2. d4 |
  d4 g4 g4 a4 |
  bes2 a2 |
  g4 g4 fis4 fis4 |
  g2. \bar "||"
  bes4 |
  c4 c4 d4 d4 |
  bes2. g4 |
  c4 c4 d4 d4 |
  bes2. \bar "||"
  d,4 |
  g4 g4 a4 a4 |
  bes2 c2 |
  d4 c4 bes4 a4 |
  g1 \bar "|."
}

alto = \relative c' {
  \global
  d4 d4 d4 f4 |
  g2 fis2 |
  d4 d4 d4 d4 |
  d2. d4 |
  d4 d4 d4 f4 |
  g2 fis2 |
  d4 d4 d4 d4 |
  d2. \bar "||"
  g4 |
  g4 g4 g4 g4 |
  g2. g4 |
  g4 g4 g4 g4 |
  g2. \bar "||"
  d4 |
  d4 d4 fis4 fis4 |
  g2 g2 |
  f4 g4 g4 fis4 |
  d1 \bar "|."
}

tenor = \relative c' {
  \global
  bes4 bes4 bes4 c4 |
  d2 d2 |
  bes4 bes4 a4 a4 |
  bes2. bes4 |
  bes4 bes4 bes4 c4 |
  d2 d2 |
  bes4 bes4 a4 a4 |
  bes2. \bar "||"
  d4 |
  c4 c4 bes4 bes4 |
  d2. d4 |
  c4 c4 bes4 bes4 |
  d2. \bar "||"
  bes4 |
  bes4 bes4 d4 d4 |
  d2 c2 |
  d4 e4 d4 c4 |
  b1 \bar "|."
}

bass = \relative c {
  \global
  g'4 g4 g4 f4 |
  g2 d2 |
  g4 g4 d4 d4 |
  g,2. g'4 |
  g4 g4 g4 f4 |
  g2 d2 |
  g4 g4 d4 d4 |
  g,2. \bar "||"
  g'4 |
  c,4 c4 g'4 g4 |
  g2. g4 |
  c,4 c4 g'4 g4 |
  g2. \bar "||"
  g4 |
  g4 g4 d4 d4 |
  g2 c,2 |
  bes4 c4 d4 d4 |
  g,1 \bar "|."
}

firstVerse = \lyricmode {
  Ma -- ria durch ein Dorn -- wald ging,
  Ky -- rie e -- lei -- son.
  Ma -- ria durch ein Dorn -- wald ging,
  der hat in sie -- ben Jah -- ren kein
  Laub ge -- tra -- gen.
  Je -- sus und Ma -- ri -- a.
}

secondVerse = \lyricmode {
  Was trug Ma -- ria un -- ter ihrem Her -- zen?
  Ky -- rie e -- lei -- son.
  Ein klei -- nes Kind -- lein ohne Schmer -- zen,
  das trug Ma -- ria un -- ter ihrem
  Her -- zen.
  Je -- sus und Ma -- ri -- a.
}

thirdVerse = \lyricmode {
  Da fra -- gen die Dornen gar man -- chen Strauch:
  Ky -- rie e -- lei -- son.
  Da trug der Dorn -- wald Ro -- sen auch,
  als das Kind -- lein durch den Wald ge --
  tra -- gen ward.
  Je -- sus und Ma -- ri -- a.
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
