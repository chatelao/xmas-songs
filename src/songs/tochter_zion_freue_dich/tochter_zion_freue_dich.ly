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

melody = \relative c' {
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
  sei ge -- grüs -- set, Kö -- nig mild!
  E -- wig steht dein Frie dens -- thron,
  du des e -- wi -- gen Va -- ters Kind.
  Ho -- si an -- na, Kö -- nigs -- sohn,
  sei ge -- grüs -- set, Kö -- nig mild!
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
