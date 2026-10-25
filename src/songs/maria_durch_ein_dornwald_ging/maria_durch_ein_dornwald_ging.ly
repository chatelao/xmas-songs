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

melody = \relative c' {
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
