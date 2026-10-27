\version "2.24.0"

\header {
  title = "Macht hoch die Tür"
  composer = "Freylinghausensches Gesangbuch (1704)"
  poet = "Georg Weissel (1623)"
  tagline = ##f
}

global = {
  \key f \major
  \time 6/4
  \tempo 4 = 120
}

harmonies = \chordmode {
  f1. | f2. f2. | bes2. c2.:7 | f1. |
  f1. | f2. f2. | bes2. c2.:7 | f1. |
  f2. bes2. | f2. f2. | f2. bes2. | f2. f2. |
  f1. | f2. c2. | bes2. c2.:7 | f1. |
}

soprano = \relative c' {
  \global
  f2 g4 a2 bes4 |
  c2. a2. |
  bes2 bes4 a2 g4 |
  f2. r2. \bar "||"
  f2 g4 a2 bes4 |
  c2. a2. |
  bes2 bes4 a2 g4 |
  f2. r2. \bar "||"
  c'2 c4 d2 d4 |
  c2. a2. |
  c2 c4 d2 d4 |
  c2. a2. |
  f2 g4 a2 bes4 |
  c2( d4) c2. |
  bes2 a4 g2 g4 |
  f2. r2. \bar "|."
}

alto = \relative c' {
  \global
  c2 e4 f2 f4 |
  f2. f2. |
  f2 f4 f2 e4 |
  c2. r2. \bar "||"
  c2 e4 f2 f4 |
  f2. f2. |
  f2 f4 f2 e4 |
  c2. r2. \bar "||"
  f2 f4 f2 f4 |
  f2. f2. |
  f2 f4 f2 f4 |
  f2. f2. |
  c2 e4 f2 f4 |
  f2. f2. |
  f2 f4 e2 e4 |
  c2. r2. \bar "|."
}

tenor = \relative c' {
  \global
  a2 c4 c2 d4 |
  a2. c2. |
  d2 d4 c2 bes4 |
  a2. r2. \bar "||"
  a2 c4 c2 d4 |
  a2. c2. |
  d2 d4 c2 bes4 |
  a2. r2. \bar "||"
  a2 a4 bes2 bes4 |
  a2. c2. |
  a2 a4 bes2 bes4 |
  a2. c2. |
  a2 c4 c2 d4 |
  a2( bes4) a2. |
  d2 c4 c2 bes4 |
  a2. r2. \bar "|."
}

bass = \relative c {
  \global
  f2 c4 f2 bes,4 |
  f'2. f2. |
  bes,2 bes4 c2 c4 |
  f2. r2. \bar "||"
  f2 c4 f2 bes,4 |
  f'2. f2. |
  bes,2 bes4 c2 c4 |
  f2. r2. \bar "||"
  f2 f4 bes,2 bes4 |
  f'2. f2. |
  f2 f4 bes,2 bes4 |
  f'2. f2. |
  f2 c4 f2 bes,4 |
  f'2. f2. |
  bes,2 f'4 c2 c4 |
  f,2. r2. \bar "|."
}

firstVerse = \lyricmode {
  Macht hoch die Tür, das Tor macht weit;
  es kommt der Herr der Herr -- lich -- keit,
  ein Kö -- nig al -- ler Kö -- nig -- reich,
  ein Hei -- land al -- ler Welt zu -- gleich,
  der Heil und Le -- ben mit sich bringt;
  wes -- we -- gen jauchzt, mit Freu -- den singt:
  Ge -- prei -- set sei mein Gott,
  mein Schöp -- fer reich von Rat.
}

secondVerse = \lyricmode {
  Er ist ge -- recht, ein Ret -- ter wert;
  Sanft -- mu -- tig -- keit ist sein Ge -- fährte,
  sein Kö -- nigs -- kron ist Hei -- lig -- keit,
  sein Zep -- ter ist Barm -- her -- zig -- keit;
  all un -- sre Not zum End er bringt,
  wes -- we -- gen jauchzt, mit Freu -- den singt:
  Ge -- prei -- set sei mein Gott,
  mein Hei -- land trost -- ver -- leiht.
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
  >>
  \layout { }
  \midi { }
}
