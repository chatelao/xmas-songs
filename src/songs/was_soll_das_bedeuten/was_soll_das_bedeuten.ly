\version "2.24.0"

\header {
  title = "Was soll das bedeuten"
  composer = "Schlesische Volksweise (1842)"
  poet = "Traditionell aus Schlesien (Aufgezeichnet 1842)"
  tagline = ##f
}

global = {
  \key g \major
  \time 3/4
  \tempo 4 = 108
  \partial 4
}

harmonies = \chordmode {
  s4 |
  g2. | d2.:7 | g2. | d2. |
  g2. | d2.:7 | g2. | d2. |
  d2.:7 | g2. | d2.:7 | g2. |
  g2. | d2.:7 | g2 d4:7 | g2
}

soprano = \relative c'' {
  \global
  g8( a8) |
  b4 b4 a8( b8) |
  c4 c4 b8( c8) |
  d4 d4 c8( b8) |
  a2 g8( a8) |
  b4 b4 a8( b8) |
  c4 c4 b8( c8) |
  d4 d4 c8( b8) |
  a2. |
  a4 a8( b8) c8( a8) |
  b2. |
  a4 a8( b8) c8( a8) |
  b2 g8( a8) |
  b4 b4 a8( b8) |
  c8( b8) a4 b8( c8) |
  d8( c8) b4 a4 |
  g2 \bar "|."
}

alto = \relative c' {
  \global
  d8( fis8) |
  g4 g4 fis8( g8) |
  a4 a4 g8( a8) |
  b4 b4 a8( g8) |
  fis2 d8( fis8) |
  g4 g4 fis8( g8) |
  a4 a4 g8( a8) |
  b4 b4 a8( g8) |
  fis2. |
  fis4 fis8( g8) a8( fis8) |
  g2. |
  fis4 fis8( g8) a8( fis8) |
  g2 d8( fis8) |
  g4 g4 fis8( g8) |
  a8( g8) fis4 g8( a8) |
  b8( a8) g4 fis4 |
  d2 \bar "|."
}

tenor = \relative c' {
  \global
  b8( d8) |
  d4 d4 d4 |
  d4 d4 d4 |
  d4 d4 d4 |
  d2 b8( d8) |
  d4 d4 d4 |
  d4 d4 d4 |
  d4 d4 d4 |
  d2. |
  d4 d4 d4 |
  d2. |
  d4 d4 d4 |
  d2 b8( d8) |
  d4 d4 d4 |
  d4 d4 d4 |
  d4 d4 c4 |
  b2 \bar "|."
}

bass = \relative c {
  \global
  g'8( d8) |
  g4 g4 d4 |
  d4 d4 g4 |
  g4 g4 d4 |
  d2 g8( d8) |
  g4 g4 d4 |
  d4 d4 g4 |
  g4 g4 d4 |
  d2. |
  d4 d4 d4 |
  g2. |
  d4 d4 d4 |
  g2 g8( d8) |
  g4 g4 d4 |
  d4 d4 g4 |
  b,4 d4 d4 |
  g,2 \bar "|."
}

firstVerse = \lyricmode {
  \set stanza = "1."
  Was soll das be -- deu -- ten, es ta -- get ja schon?
  Ich weiß wohl, es geht erst um Mit -- ter -- nacht 'rum.
  Schaut nur da -- her! Schaut nur da -- her!
  Wie glän -- zen die Stern -- lein je län -- ger, je mehr!
}

secondVerse = \lyricmode {
  \set stanza = "2."
  Treibt ei -- lends zu -- sam -- men die Schäf -- lein im Grund!
  Ver -- las -- set die Her -- de nur ei -- ne Halb -- stund'!
  Tu's G'schirr -- lein weg, tu's G'schirr -- lein weg!
  Ich geh' mit euch al -- len und zeig' euch den Weg.
}

thirdVerse = \lyricmode {
  \set stanza = "3."
  Ich hab' nur ein we -- nig von wei -- tem ge -- guckt,
  da hat mir mein Herz schon vor Freu -- den ge -- hupft:
  Ein schö -- nes Kind, ein schö -- nes Kind
  liegt dort in der Krip -- pe bei E -- sel und Rind.
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
