\version "2.24.0"

\header {
  title = "Kommet, ihr Hirten"
  composer = "Böhmische Volksweise (Olmütz 1847)"
  poet = "Carl Riedel (1870)"
  tagline = ##f
}

global = {
  \key f \major
  \time 3/4
  \tempo 4 = 108
}

harmonies = \chordmode {
  f2. | bes2 f4 | f2 c4:7 | f2. |
  f2. | bes2 f4 | f2 c4:7 | f2. |
  f2. | bes2. | f2. | c2. |
  f2. | bes2. | f2. | c2. |
  bes2 c4:7 | f2.
}

soprano = \relative c'' {
  \global
  % Stollen 1 (Takt 1-4)
  c4 c4 a4 |
  d4 bes4 c4 |
  a4 f4 g4 |
  a2. |
  % Stollen 2 (Takt 5-8)
  c4 c4 a4 |
  d4 bes4 c4 |
  a4 f4 g4 |
  f2. |
  % Abgesang (Takt 9-18)
  f4 a4 c4 |
  d2 bes4 |
  a4 f4 a4 |
  g2 c,4 |
  f4 a4 c4 |
  d2 bes4 |
  a4 f4 a4 |
  g2 c,4 |
  d'4 bes4 g4 |
  f2. \bar "|."
}

alto = \relative c' {
  \global
  f4 f4 f4 |
  f4 f4 f4 |
  f4 c4 e4 |
  f2. |
  f4 f4 f4 |
  f4 f4 f4 |
  f4 c4 e4 |
  c2. |
  c4 f4 f4 |
  f2 f4 |
  f4 c4 f4 |
  e2 c4 |
  c4 f4 f4 |
  f2 f4 |
  f4 c4 f4 |
  e2 c4 |
  f4 f4 e4 |
  c2. \bar "|."
}

tenor = \relative c' {
  \global
  a4 a4 c4 |
  bes4 d4 c4 |
  c4 a4 c4 |
  c2. |
  a4 a4 c4 |
  bes4 d4 c4 |
  c4 a4 bes4 |
  a2. |
  a4 c4 a4 |
  bes2 d4 |
  c4 a4 c4 |
  c2 g4 |
  a4 c4 a4 |
  bes2 d4 |
  c4 a4 c4 |
  c2 g4 |
  bes4 d4 bes4 |
  a2. \bar "|."
}

bass = \relative c {
  \global
  f4 f4 f4 |
  bes,4 d4 f4 |
  f4 a,4 c4 |
  f2. |
  f4 f4 f4 |
  bes,4 d4 f4 |
  f4 c4 c4 |
  f2. |
  f4 f4 f4 |
  bes,2 d4 |
  f4 f4 f4 |
  c2 c4 |
  f4 f4 f4 |
  bes,2 d4 |
  f4 f4 f4 |
  c2 c4 |
  bes4 d4 c4 |
  f2. \bar "|."
}

firstVerse = \lyricmode {
  \set stanza = "1."
  Kom -- met, ihr Hir -- ten, ihr Män -- ner und Fraun,
  kom -- met, das lieb -- li -- che Kind -- lein zu schaun!
  Chris -- tus, der Herr, ist heu -- te ge -- bo -- ren,
  den Gott zum Hei -- land euch hat er -- ko -- ren.
  Fürch -- tet euch nicht!
}

secondVerse = \lyricmode {
  \set stanza = "2."
  Las -- set uns se -- hen in Beth -- le -- hems Stall,
  was uns ver -- hei -- ßen der himm -- li -- sche Schall!
  Was wir dort fin -- den, las -- set uns kün -- den,
  las -- set uns prei -- sen in from -- men Wei -- sen:
  Hal -- le -- lu -- ja!
}

thirdVerse = \lyricmode {
  \set stanza = "3."
  Wahr -- lich, die En -- gel ver -- kün -- di -- gen heut
  Beth -- le -- hems Hir -- ten -- volk gar gro -- ße Freud:
  Nun soll es wer -- den Frie -- de auf Er -- den,
  den Men -- schen al -- len ein Wohl -- ge -- fal -- len:
  Eh -- re sei Gott!
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
