\version "2.24.0"

\header {
  title = "Was soll das bedeuten"
  composer = "Schlesische Volksweise"
  poet = "Traditionell aus Schlesien (Aufgezeichnet 1842)"
  tagline = ##f
}

global = {
  \key g \major
  \time 2/4
  \tempo 4 = 88
  \partial 8
}

harmonies = \chordmode {
  s8 |
  g2 | d2:7 | g2 | d2 |
  g2 | d2:7 | g4 d4:7 | g2 |
  d2 | g4 d4 | d2 | g4 d4 |
  g2 | c4 a4:m | g4 d4:7 | g4.
}

soprano = \relative c' {
  \global
  d8 |
  g8 g8 a8 a8 |
  b16( c16) d8 a8. b16 |
  c8 b8 a8 g8 |
  a8 fis8 d8 d8 |
  g8 g8 a8 a8 |
  b16( c16) d8 a8. b16 |
  c8 b8 a8 a8 |
  g4 r8 a8 |
  a8 fis8 d8 e16( fis16) |
  g8 b8 a8 a8 |
  a8 fis8 d8 e16( fis16) |
  g8 b8 a8 b16( c16) |
  d8 d8 b8 g8 |
  e'8 e8 c8 a8 |
  d8. c16 b8 a8 |
  g4 r8 \bar "|."
}

alto = \relative c' {
  \global
  d8 |
  d8 d8 fis8 fis8 |
  g8 g8 fis8. g16 |
  a8 g8 fis8 e8 |
  fis8 d8 d8 d8 |
  d8 d8 fis8 fis8 |
  g8 g8 fis8. g16 |
  a8 g8 g8 fis8 |
  g4 r8 fis8 |
  fis8 d8 d8 c8 |
  b8 g'8 fis8 fis8 |
  fis8 d8 d8 c8 |
  b8 g'8 fis8 g8 |
  g8 g8 g8 d8 |
  g8 g8 e8 e8 |
  g8. a16 g8 fis8 |
  d4 r8 \bar "|."
}

tenor = \relative c' {
  \global
  b8 |
  b8 b8 d8 d8 |
  d8 d8 d8. d16 |
  d8 d8 d8 b8 |
  d8 a8 fis8 fis8 |
  b8 b8 d8 d8 |
  d8 d8 d8. d16 |
  e8 d8 d8 c8 |
  b4 r8 d8 |
  d8 a8 fis8 a8 |
  g8 d'8 d8 d8 |
  d8 a8 fis8 a8 |
  g8 d'8 d8 d8 |
  b8 b8 d8 b8 |
  c8 c8 a8 c8 |
  b8. e16 d8 c8 |
  b4 r8 \bar "|."
}

bass = \relative c' {
  \global
  g8 |
  g8 g8 d8 d8 |
  g8 b8 d8. g,16 |
  fis8 g8 d8 e8 |
  d8 d8 d8 c8 |
  b8 g'8 d8 d8 |
  g8 b8 d8. g,16 |
  c,8 d8 d8 d8 |
  g4 r8 d8 |
  d8 d8 d8 d8 |
  g8 g8 d8 d8 |
  d8 d8 d8 d8 |
  g8 g8 d8 g8 |
  g8 g8 g8 g8 |
  c,8 c8 c8 c8 |
  d8. c16 d8 d8 |
  g4 r8 \bar "|."
}

firstVerse = \lyricmode {
  \set stanza = "1."
  Was soll das be -- deu -- ten, es ta -- get ja schon?
  Ich weiß ja, es geht erst um Mit -- ter -- nacht 'rum.
  Schaut nur da -- her! Schaut nur da -- her!
  Wie glän -- zen die Ster -- ne je län -- ger, je mehr!
}

secondVerse = \lyricmode {
  \set stanza = "2."
  Treibt eilends zu -- sam -- men die Schäf -- lein im Grund!
  Ver -- las -- set die Her -- de nur ei -- ne Halb -- stund'!
  Tu's G'schirr -- lein weg, tu's G'schirr -- lein weg!
  Ich geh' mit euch al -- len und zeig' euch den Weg.
}

thirdVerse = \lyricmode {
  \set stanza = "3."
  Ich hab' nur ein we -- nig von wei -- tem ge -- guckt,
  da hat mir mein Herz schon vor Freu -- den ge -- juckt.
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
