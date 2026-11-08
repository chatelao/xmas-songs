\version "2.24.0"

\header {
  title = "Tochter Zion, freue dich"
  composer = "Georg Friedrich Händel (1747)"
  poet = "Friedrich Heinrich Ranke (um 1820)"
  tagline = ##f
}

global = {
  \key es \major
  \time 2/2
  \tempo 2 = 60
}

harmonies = \chordmode {
  % A-Teil (Takt 1-8)
  es1 | es1 | bes2 es2 | bes1 |
  es2 bes2 | es2 bes2 | as4 es4 bes2:7 | es1 |
  % B-Teil (Takt 9-16)
  es2 bes2:7 | es2 f2:7 | bes4 f4 c2:7 | f1 |
  d1 | g1:m | c4:m g4:m d2:7 | g1:m |
  % A'-Teil (Takt 17-24)
  es1 | es1 | bes2 es2 | bes1 |
  es2 bes2 | es2 bes2 | as4 es4 bes2:7 | es1
}

soprano = \relative c'' {
  \global
  % Takt 1-4: Tochter Zion, freue dich,
  bes2 g4.( as8) |
  bes2 es,2 |
  f8( g8 as8 bes8) g2 |
  f1 |
  % Takt 5-8: jauchze laut, Jerusalem!
  g8( as8 bes8 c8) bes2 |
  es2 bes2 |
  as4( g4) f4.( es8) |
  es1 \bar "||"
  % Takt 9-12: Sieh, dein König kommt zu dir,
  g4.( as8 g4) f4 |
  es2 c'2 |
  bes4( a4) g2 |
  f1 |
  % Takt 13-16: ja, er kommt, der Friedefürst.
  d8( e8 fis8 g8) a2 |
  d2 g,2 |
  a4( g4) fis4.( g8) |
  g1 \bar "||"
  % Takt 17-24: Tochter Zion, freue dich, jauchze laut, Jerusalem!
  bes2 g4.( as8) |
  bes2 es,2 |
  f8( g8 as8 bes8) g2 |
  f1 |
  g8( as8 bes8 c8) bes2 |
  es2 bes2 |
  as4( g4) f4.( es8) |
  es1 \bar "|."
}

alto = \relative c' {
  \global
  g'2 es4.( f8) |
  g2 es2 |
  d8( es8 f8 d8) es2 |
  d1 |
  es8( f8 g8 as8) f2 |
  g2 g2 |
  es2 d4.( es8) |
  es1 \bar "||"
  es2. d4 |
  es2 es2 |
  d4( c4) e2 |
  f1 |
  d2 fis2 |
  g2 d2 |
  es4( d4) d4.( d8) |
  d1 \bar "||"
  g2 es4.( f8) |
  g2 es2 |
  d8( es8 f8 d8) es2 |
  d1 |
  es8( f8 g8 as8) f2 |
  g2 g2 |
  es2 d4.( es8) |
  es1 \bar "|."
}

tenor = \relative c' {
  \global
  es2 bes2 |
  es2 bes2 |
  bes2 bes2 |
  bes1 |
  bes2 d2 |
  bes2 es2 |
  c4( bes4) bes4.( g8) |
  g1 \bar "||"
  bes2. as4 |
  g2 a2 |
  bes4( c4) c4( bes4) |
  a1 |
  fis8( g8 a8 bes8) c2 |
  bes2 bes2 |
  c4( bes4) a4.( bes8) |
  bes1 \bar "||"
  es2 bes2 |
  es2 bes2 |
  bes2 bes2 |
  bes1 |
  bes2 d2 |
  bes2 es2 |
  c4( bes4) bes4.( g8) |
  g1 \bar "|."
}

bass = \relative c {
  \global
  es2 es2 |
  es2 g2 |
  bes,2 es2 |
  bes1 |
  es2 bes2 |
  c2 g2 |
  as4( bes4) bes4.( es8) |
  es1 \bar "||"
  es2 bes2 |
  c2 a2 |
  bes4( f'4) c2 |
  f1 |
  d2 d2 |
  g2 g2 |
  c,4( d4) d4.( g8) |
  g1 \bar "||"
  es2 es2 |
  es2 g2 |
  bes,2 es2 |
  bes1 |
  es2 bes2 |
  c2 g2 |
  as4( bes4) bes4.( es8) |
  es1 \bar "|."
}

firstVerse = \lyricmode {
  \set stanza = "1."
  Toch -- ter Zi -- on, freu -- e dich,
  jauch -- ze laut, Je -- ru -- sa -- lem!
  Sieh, dein Kö -- nig kommt zu dir,
  ja, er kommt, der Frie -- de -- fürst.
  Toch -- ter Zi -- on, freu -- e dich,
  jauch -- ze laut, Je -- ru -- sa -- lem!
}

secondVerse = \lyricmode {
  \set stanza = "2."
  Ho -- si -- an -- na, Da -- vids Sohn,
  sei ge -- seg -- net dei -- nem Volk!
  Grün -- de nun dein e -- wig Reich,
  Ho -- si -- an -- na in der Höh!
  Ho -- si -- an -- na, Da -- vids Sohn,
  sei ge -- seg -- net dei -- nem Volk!
}

thirdVerse = \lyricmode {
  \set stanza = "3."
  Ho -- si -- an -- na, Da -- vids Sohn,
  sei ge -- grü -- ßet, Kö -- nig mild!
  E -- wig steht dein Frie -- dens -- thron,
  du, des ew -- gen Va -- ters Kind.
  Ho -- si -- an -- na, Da -- vids Sohn,
  sei ge -- grü -- ßet, Kö -- nig mild!
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
