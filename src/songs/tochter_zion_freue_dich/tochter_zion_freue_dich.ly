\version "2.24.0"

\header {
  title = "Tochter Zion, freue dich"
  composer = "Georg Friedrich Händel (1747)"
  poet = "Friedrich Heinrich Ranke (1820)"
  tagline = ##f
}

global = {
  \key es \major
  \time 2/2
  \tempo 2 = 60
}

harmonies = \chordmode {
  es1 | f2:m es2 | bes2:7 f2:m7 | es1 |
  es1 | as2 es2 | bes2:7 bes2:7 | es1 |
  es2 as2 | f2:m es2 | bes2:7 bes2:7 | es1 |
  es1 | f2:m es2 | bes2:7 f2:m7 | es1 |
}

soprano = \relative c' {
  \global
  es2 f4 g4 |
  as2 g2 |
  f4 es4 f4 g4 |
  es1 |
  g2 as4 bes4 |
  c2 bes2 |
  as4 g4 as4 bes4 |
  g1 |
  bes2 c4 bes4 |
  as2 g2 |
  f4 g4 as4 bes4 |
  g1 |
  es2 f4 g4 |
  as2 g2 |
  f4 es4 f4 g4 |
  es1 \bar "|."
}

alto = \relative c' {
  \global
  bes2 d4 es4 |
  f2 es2 |
  d4 es4 d4 d4 |
  bes1 |
  es2 f4 g4 |
  as2 g2 |
  f4 es4 f4 f4 |
  es1 |
  g2 as4 g4 |
  f2 es2 |
  d4 es4 f4 f4 |
  es1 |
  bes2 d4 es4 |
  f2 es2 |
  d4 es4 d4 d4 |
  bes1 \bar "|."
}

tenor = \relative c' {
  \global
  g2 bes4 bes4 |
  bes2 bes2 |
  bes4 g4 bes4 bes4 |
  g1 |
  bes2 bes4 es4 |
  es2 es2 |
  bes4 bes4 bes4 d4 |
  bes1 |
  es2 es4 es4 |
  c2 bes2 |
  bes4 bes4 bes4 d4 |
  bes1 |
  g2 bes4 bes4 |
  bes2 bes2 |
  bes4 g4 bes4 bes4 |
  g1 \bar "|."
}

bass = \relative c {
  \global
  es2 bes4 es4 |
  d2 es2 |
  bes4 c4 bes4 bes4 |
  es1 |
  es2 d4 es4 |
  as,2 es'2 |
  d4 es4 bes4 bes4 |
  es1 |
  es2 as,4 es'4 |
  f2 es2 |
  bes4 bes4 bes4 bes4 |
  es1 |
  es2 bes4 es4 |
  d2 es2 |
  bes4 c4 bes4 bes4 |
  es,1 \bar "|."
}

firstVerse = \lyricmode {
  Toch -- ter Zi -- on, freu e dich,
  jauch -- ze hoch, Je -- ru -- sa -- lem!
  Sieh, dein Kö -- nig kommt zu dir,
  ja, er kommt, der Frie -- de -- fürst.
  Toch -- ter Zi -- on, freu e dich,
  jauch -- ze hoch, Je -- ru -- sa -- lem!
}

secondVerse = \lyricmode {
  Ho -- si an -- na, Da -- vids Sohn,
  sei ge -- seg -- net dei -- nem Volk!
  Grün -- de nun dein e -- wig Reich,
  Ho -- si an -- na in der Höh'!
  Ho -- si an -- na, Da -- vids Sohn,
  sei ge -- seg -- net dei -- nem Volk!
}

thirdVerse = \lyricmode {
  Ho -- si an -- na, Kö -- nigs -- sohn,
  sei ge -- grues -- set, Kö -- nig mild!
  E -- wig steht dein Frie dens -- thron,
  du des e -- wi -- gen Va -- ters Kind.
  Ho -- si an -- na, Kö -- nigs -- sohn,
  sei ge -- grues -- set, Kö -- nig mild!
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
