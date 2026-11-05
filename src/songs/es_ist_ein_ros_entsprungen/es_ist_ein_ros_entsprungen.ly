\version "2.24.0"

\header {
  title = "Es ist ein Ros entsprungen"
  composer = "Michael Praetorius (1609)"
  poet = "Speyerer Gesangbuch (1599)"
  tagline = ##f
}

global = {
  \key f \major
  \time 4/4
  \tempo 4 = 100
}

% Akkorde exakt abgeleitet aus dem vierstimmigen Satz von Praetorius
harmonies = \chordmode {
  % Stollen 1
  f1 | bes2 f2 | d2:m c4 bes4 | c2 d2:m | g2:m7 c2 | bes2 f2 |
  % Stollen 2
  f1 | bes2 f2 | d2:m c4 bes4 | c2 d2:m | g2:m7 c2 | bes2 f2 |
  % Abgesang
  f4 d2:m g4:m | c2:7 a2 | d4:m g4 c2 |
  f2 bes4 f4 | d2:m c4 bes4 | c2 d2:m | g2:m7 c2 | bes2 f2 |
}

soprano = \relative c'' {
  \global
  % Stollen 1: "Es ist ein Ros entsprungen aus einer Wurzel zart,"
  c2 c4 c4 |
  d4 c4 c2 |
  a2 g2 |
  g2 f4( e4 ~ |
  \time 6/4 e4) d2 c4 d2 |
  \time 4/4 c1 \bar "||"
  
  % Stollen 2: "wie uns die Alten sungen, von Jesse kam die Art"
  c'2 c4 c4 |
  d4 c4 c2 |
  a2 g2 |
  g2 f4( e4 ~ |
  \time 6/4 e4) d2 c4 d2 |
  \time 4/4 c1 \bar "||"
  
  % Abgesang: "und hat ein Blümlein 'bracht mitten im kalten Winter, wohl zu der halben Nacht."
  r4 a4 g4 e4 |
  f4 d4 c2 |
  r4 c'4 c4 c4 |
  d4 c4 c2 |
  a2 g2 |
  g2 f4( e4 ~ |
  \time 6/4 e4) d2 c4 d2 |
  \time 4/4 c1 \bar "|."
}

alto = \relative c' {
  \global
  % Stollen 1
  a'2 a4 f4 |
  f4 f4 e2 |
  f2 e4 d4 |
  e2 d4( c4 ~ |
  \time 6/4 c4) c4( b4) c4 b2 |
  \time 4/4 c1 \bar "||"
  
  % Stollen 2
  a'2 a4 f4 |
  f4 f4 e2 |
  f2 e4 d4 |
  e2 d4( c4 ~ |
  \time 6/4 c4) c4( b4) c4 b2 |
  \time 4/4 c1 \bar "||"
  
  % Abgesang
  r4 f4 f4 d4 |
  c4 bes!4 a2 |
  r4 f'4 d4 e4 |
  f4 f4 f2 |
  f2 e4 d4 |
  e2 d4( c4 ~ |
  \time 6/4 c4) c4( b4) c4 b2 |
  \time 4/4 c1 \bar "|."
}

tenor = \relative c' {
  \global
  % Stollen 1
  c2 c4 a4 |
  bes4 a4 g2 |
  a2 c4 f,4 |
  c'2 a4( a4 ~ |
  \time 6/4 a4) f4 g2 f2 |
  \time 4/4 e4( d4 e2) \bar "||"
  
  % Stollen 2
  c'2 c4 a4 |
  bes4 a4 g2 |
  a2 c4 f,4 |
  c'2 a4( a4 ~ |
  \time 6/4 a4) f4 g2 f2 |
  \time 4/4 e4( d4 e2) \bar "||"
  
  % Abgesang
  r4 c'4 bes4 bes4 |
  a4 g4 ^\markup { \tiny "Original: cis im A" } e2 |
  r4 a4 g4 g4 |
  bes4 f4 a2 |
  a2 c4 f,4 |
  c'2 a4( a4 ~ |
  \time 6/4 a4) f4 g2 f2 |
  \time 4/4 e4( d4 e2) \bar "|."
}

bass = \relative c {
  \global
  % Stollen 1
  f2 f4 f4 |
  bes,4 f'4 c2 |
  d2 c4 bes4 |
  c2 d4( a4 ~ |
  \time 6/4 a4) bes4 g4 a4 g2 |
  \time 4/4 c2( f,2) \bar "||"
  
  % Stollen 2
  f'2 f4 f4 |
  bes,4 f'4 c2 |
  d2 c4 bes4 |
  c2 d4( a4 ~ |
  \time 6/4 a4) bes4 g4 a4 g2 |
  \time 4/4 c2( f,2) \bar "||"
  
  % Abgesang
  r4 f4 d4 g4 |
  a4 bes4 a2 |
  r4 d,4 g4 c,4 |
  bes4 d4 f2 |
  d2 c4 bes4 |
  c2 d4( a4 ~ |
  \time 6/4 a4) bes4 g4 a4 g2 |
  \time 4/4 c2( f,2) \bar "|."
}

firstVerse = \lyricmode {
  Es ist ein Ros ent -- sprun -- gen
  aus ei -- ner Wur -- zel zart,
  wie uns die Al -- ten sun -- gen,
  von Jes -- se kam die Art
  und hat ein Blüm -- lein 'bracht
  mit -- ten im kal -- ten Win -- ter,
  wohl zu der hal -- ben Nacht.
}

secondVerse = \lyricmode {
  Das Rös -- lein, das ich mei -- ne,
  da -- von I -- sai -- as sagt,
  hat uns ge -- bracht al -- lei -- ne
  die rei -- ne Magd Ma -- ri -- a.
  Aus Got -- tes ew' -- gem Rat
  hat sie ein Kind ge -- bo -- ren
  und blieb ein rei -- ne Magd.
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
      \new Lyrics \lyricsto "soprano" \firstVerse
      \new Lyrics \lyricsto "soprano" \secondVerse
      \new Staff \with { instrumentName = "T / B" } <<
        \clef "treble_8"
        \new Voice = "tenor" { \voiceOne \tenor }
        \new Voice = "bass" { \voiceTwo \bass }
      >>
    >>
  >>
  \layout { }
  \midi { }
}
