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
  \partial 4
}

harmonies = \chordmode {
  \partial 4 f4 |
  c2 g4:m/bes a2:m d4:m |
  g2:m c4 f2 f4 |
  bes2 f4:/a g2:m c4 |
  d2.:m c2 a4:m |
  bes2 g4:m c2 a4 |
  d2:m g4 c2 c4 |
  g2:m a4:7 d2:m a4:m |
  bes2 g4:m a2 a4 |
  bes2 g4:m a2:7 d4:m |
  g2:m c4:7 f2 f4 |
  bes2 f4 g2:m d4:m |
  g2:m c4:7 f2 c4 |
  d2:m a4:m bes2 f4 |
  g2:m c4:7 f2 c4 |
  d2:m a4:m bes2 f4 |
  g2:m c4:7 f2 \bar "|."
}

soprano = \relative c'' {
  \global
  % 1. Macht hoch die Tür, die Tor macht weit;
  a4 | g2 f4 e2 d4 | c( d) e f2
  % 2. es kommt der Herr der Herrlichkeit,
  f4 | bes2 a4 g2 a4 | f( e) d c2
  % 3. ein König aller Königreich,
  g'4 | f2 bes4 a2 c4 | d( c) b c2
  % 4. ein Heiland aller Welt zugleich,
  g4 | bes2 a4 f2 a4 | g( f) g a2
  % 5. der Heil und Leben mit sich bringt;
  a4 | d2 bes4 a2 f4 | bes( a) g f2
  % 6. derhalben jauchzt, mit Freuden singt:
  a4 | d2 c4 bes2 a4 | bes( a) g f2
  % 7. Gelobet sei mein Gott,
  c'4 | a2 c4 d( c bes) | bes( a g) a2
  % 8. mein Schöpfer reich von Rat!
  c4 | a2 c4 d( c bes) | bes( a g) f2 \bar "|."
}

alto = \relative c' {
  \global
  f4 | e2 d4 c2 d4 | bes2 c4 c2
  f4 | f2 f4 d( e) f | d( c) b c2
  e4 | d2 g4 e( f) e | f( e) d e2
  e4 | d2 cis4 d2 f4 | d2 d4 cis2
  e4 | f2 g4 e2 d4 | d( f) e f2
  f4 | f2 f4 d2 d4 | d( f) e f2
  f4 | f2 f4 f2( f4) | d( f e) f2
  f4 | f2 f4 f2( f4) | d( f e) c2 \bar "|."
}

tenor = \relative c' {
  \global
  c4 | c2 bes4 a2 a4 | g2 g4 a2
  a4 | d2 c4 bes2 c4 | a2 g4 e2
  c'4 | bes2 d4 c2 a4 | a2 g4 g2
  c4 | g2 e4 a2 c4 | bes( a) bes e,2
  cis'4 | d2 d4 cis2 a4 | g( c) bes a2
  c4 | bes2 a4 g2 f4 | g( c) bes a2
  a4 | a2 c4 bes( a d) | g,( c c) c2
  a4 | a2 c4 bes( a d) | g,( c bes) a2 \bar "|."
}

bass = \relative c {
  \global
  f4 | c2 bes4 a2 d4 | g,2 c4 f2
  d4 | bes2 f'4 g2 f4 | d( e) f c2
  c4 | d2 g4 a2 a,4 | d( e) f c2
  c4 | g'2 a4 d,2 f4 | g( d) g, a2
  a'4 | d,2 g4 a2 d,4 | g( f) c f2
  f4 | bes,2 f'4 g2 d4 | g( f) c f2
  f4 | d2 a4 bes( c d) | g,( a bes) f'2
  f4 | d2 a4 bes( c d) | g,( c c) f2 \bar "|."
}

firstVerse = \lyricmode {
  \set stanza = "1."
  Macht hoch die Tür, die Tor macht weit;
  es kommt der Herr der Herr -- lich -- keit,
  ein Kö -- nig al -- ler Kö -- nig -- reich,
  ein Hei -- land al -- ler Welt zu -- gleich,
  der Heil und Le -- ben mit sich bringt;
  der -- hal -- ben jauchzt, mit Freu -- den singt:
  Ge -- lo -- bet sei mein Gott,
  mein Schöp -- fer reich von Rat!
}

secondVerse = \lyricmode {
  \set stanza = "2."
  Er ist ge -- recht, ein Hel -- fer wert;
  Sanft -- mü -- tig -- keit ist sein Ge -- fährt,
  sein Kö -- nigs -- kron ist Hei -- lig -- keit,
  sein Zep -- ter ist Barm -- her -- zig -- keit;
  all un -- sre Not zum End er bringt,
  der -- hal -- ben jauchzt, mit Freu -- den singt:
  Ge -- lo -- bet sei mein Gott,
  mein Hei -- land groß von Tat!
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
