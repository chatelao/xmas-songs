\version "2.24.0"

\header {
  title = "Süsser die Glocken nie klingen"
  composer = "Traditionell (Thüringen, vor 1829)"
  poet = "Friedrich Wilhelm Kritzinger (1860)"
  tagline = ##f
}

global = {
  \key g \major
  \time 6/8
  \tempo 4. = 50
  \autoBeamOff
}

harmonies = \chordmode {
  g2. | g2. | d4.:7 g4. | d2. |
  d2.:7 | d4.:7 g4. | d2.:7 | g2. |
  d2. | d2.:7 | g2. | d2. |
  g2. | c2. | d2.:7 | g2. |
}

soprano = \relative c'' {
  \global
  % Teil A1 (Takt 1-4): "Süs-ser die Glo-cken nie klin-gen, als zu der Weih-nachts-zeit"
  b4 b8 a([ g]) a |
  g4. d4 d8 |
  g4 g8 a([ g]) a |
  b2. |
  % Teil A2 (Takt 5-8): "'s ist, als ob En-ge-lein sin-gen wie-der von Frie-den und Freud'"
  a4 a8 fis([ e]) fis |
  g4. d4 d8 |
  fis4 fis8 a([ g]) fis |
  g2. |
  % Teil B (Takt 9-12): "Wie sie ge-sun-gen in se-li-ger Nacht, wie sie ge-sun-gen in se-li-ger Nacht!"
  a4 a8 a([ b]) c |
  b4( a8) fis4 d8 |
  b'4 b8 b([ c]) d |
  c4( b8) a4. |
  % Teil C (Takt 13-16): "Glo-cken mit hei-li-gem Klang, klin-get die Er-de ent-lang!"
  d4 d8 b([ a]) g |
  e'4. c4 a8 |
  g4 g8 b([ a]) fis |
  g2. \bar "|."
}

alto = \relative c'' {
  \global
  g4 g8 fis([ e]) fis |
  d4. b4 b8 |
  d4 d8 fis([ e]) fis |
  g2. |
  fis4 fis8 d([ cis]) d |
  d4. b4 b8 |
  d4 d8 fis([ e]) d |
  d2. |
  fis4 fis8 fis([ g]) a |
  g4( fis8) d4 d8 |
  g4 g8 g([ a]) b |
  a4( g8) fis4. |
  g4 g8 g([ fis]) d |
  g4. e4 e8 |
  d4 d8 d([ c]) c |
  b2. \bar "|."
}

tenor = \relative c' {
  \global
  d4 d8 c([ b]) c |
  b4. g4 g8 |
  b4 b8 d4 d8 |
  d2. |
  c4 c8 a4 a8 |
  b4. g4 g8 |
  a4 a8 c([ b]) a |
  b2. |
  d4 d8 d4 d8 |
  d4. a4 fis8 |
  d'4 d8 d4 d8 |
  d4. d4. |
  b4 b8 d([ c]) b |
  c4. g4 a8 |
  b4 b8 g([ a]) a |
  g2. \bar "|."
}

bass = \relative c' {
  \global
  g4 g8 d4 d8 |
  g4. g,4 g8 |
  g'4 g8 d4 d8 |
  g2. |
  d4 d8 d4 d8 |
  g4. g,4 g8 |
  d'4 d8 d4 d8 |
  g,2. |
  d'4 d8 d4 d8 |
  d4. d4 d8 |
  g4 g8 g4 b,8 |
  d4. d4. |
  g4 g8 g4 b,8 |
  c4. c4 c8 |
  d4 d8 d4 d8 |
  g,2. \bar "|."
}

firstVerse = \lyricmode {
  \set stanza = "1."
  Süs -- ser die Glo -- cken nie klin -- gen
  als zu der Weih -- nachts -- zeit,
  's_ist, als ob En -- ge -- lein sin -- gen
  wie -- der von Frie -- den und Freud',
  wie sie ge -- sun -- gen in se -- li -- ger Nacht,
  wie sie ge -- sun -- gen in se -- li -- ger Nacht!
  Glo -- cken mit hei -- li -- gem Klang,
  klin -- get die Er -- de ent -- lang!
}

secondVerse = \lyricmode {
  \set stanza = "2."
  O, wenn die Glo -- cken er -- klin -- gen,
  schnell sie das Christ -- kind hört;
  tut sich vom Him -- mel dann schwin -- gen
  ei -- lig her -- nie -- der zur Erd'.
  Seg -- net den Va -- ter, die Mut -- ter, das Kind,
  seg -- net den Va -- ter, die Mut -- ter, das Kind.
  Glo -- cken mit hei -- li -- gem Klang,
  klin -- get die Er -- de ent -- lang!
}

thirdVerse = \lyricmode {
  \set stanza = "3."
  Klin -- get mit lieb -- li -- chem Schal -- le
  ü -- ber die Mee -- re noch weit,
  dass sich er -- freu -- en doch al -- le
  se -- li -- ger Weih -- nachts -- zeit,
  al -- le aufjauch -- zen mit ei -- nem Ge -- sang,
  al -- le aufjauch -- zen mit ei -- nem Ge -- sang!
  Glo -- cken mit hei -- li -- gem Klang,
  klin -- get die Er -- de ent -- lang!
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
      \new Lyrics \with { alignBelowContext = "upper" } \lyricsto "soprano" \firstVerse
      \new Lyrics \with { alignBelowContext = "upper" } \lyricsto "soprano" \secondVerse
      \new Lyrics \with { alignBelowContext = "upper" } \lyricsto "soprano" \thirdVerse
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
