\version "2.24.0"

\header {
  title = "Fröhliche Weihnacht überall"
  composer = "Traditionell (19. Jh.)"
  poet = "Heinrich Liebhart (1882) / Hoffmann von Fallersleben"
  tagline = ##f
}

global = {
  \key f \major
  \time 2/4
  \tempo 4 = 100
}

harmonies = \chordmode {
  % Refrain (Takt 1-20)
  f2 | f2 | c2:7 | f2 |
  f2 | f2 | c2:7 | f2 |
  c2:7 | f2 | bes4 f4 | c2:7 |
  f2 | f2 | c2:7 | f2 |
  f2 | f2 | c2:7 | f2 |
  % Strophe (Takt 21-28)
  d4:m g4:m | d4:m a4 | d4:m g4:m | a2 |
  d4:m g4:m | d4:m a4 | d4:m a4:7 | d2:m
}

soprano = \relative c'' {
  \global
  % Refrain A (Takt 1-8)
  c8( bes8) a8 bes8 |
  c4 a4 |
  g8( a8) bes8( g8) |
  c4( a4) |
  c8 bes8 a8 bes8 |
  c4 a4 |
  g8( c8) e,8( g8) |
  f2 |
  % Zwischenspiel / Mittelteil Refrain (Takt 9-12)
  g8 a8 bes4 |
  a8 bes8 c4 |
  d8 c8 bes8 a8 |
  g8 f8 g4 |
  % Refrain A' (Takt 13-20)
  c8( bes8) a8 bes8 |
  c4 a4 |
  g8( a8) bes8( g8) |
  c4( a4) |
  c8 bes8 a8 bes8 |
  c4 a4 |
  g8( c8) e,8( g8) |
  f2 \bar "||"
  % Strophe (Takt 21-28)
  a8 a8 g8 g8 |
  f8 f8 e4 |
  d8 e8 f8 g8 |
  a2 |
  a8 a8 g8 g8 |
  f8 f8 e4 |
  d8 f8 e8 cis8 |
  d2 \bar "|."
}

alto = \relative c' {
  \global
  f8( g8) f8 g8 |
  a4 f4 |
  e8( f8) g8( e8) |
  f2 |
  f8 g8 f8 g8 |
  a4 f4 |
  e4 c4 |
  c2 |
  e8 f8 g4 |
  f8 g8 a4 |
  bes8 a8 g8 f8 |
  e8 d8 e4 |
  f8( g8) f8 g8 |
  a4 f4 |
  e8( f8) g8( e8) |
  f2 |
  f8 g8 f8 g8 |
  a4 f4 |
  e4 c4 |
  c2 \bar "||"
  f8 f8 e8 e8 |
  d8 d8 cis4 |
  d8 cis8 d8 e8 |
  cis2 |
  f8 f8 e8 e8 |
  d8 d8 cis4 |
  d8 d8 cis8 a8 |
  a2 \bar "|."
}

tenor = \relative c' {
  \global
  a8( bes8) c8 bes8 |
  a4 c4 |
  c4 c8 c8 |
  a4( c4) |
  a8 bes8 c8 bes8 |
  a4 c4 |
  c4 bes4 |
  a2 |
  c8 c8 c4 |
  c8 c8 c4 |
  bes8 c8 d8 c8 |
  c8 a8 c4 |
  a8( bes8) c8 bes8 |
  a4 c4 |
  c4 c8 c8 |
  a4( c4) |
  a8 bes8 c8 bes8 |
  a4 c4 |
  c4 bes4 |
  a2 \bar "||"
  d8 d8 bes8 bes8 |
  a8 a8 a4 |
  a8 a8 a8 bes8 |
  a2 |
  d8 d8 bes8 bes8 |
  a8 a8 a4 |
  a8 a8 g8 e8 |
  fis2 \bar "|."
}

bass = \relative c {
  \global
  f4 f8 f8 |
  f4 f4 |
  c4 c8 c8 |
  f2 |
  f8 f8 f8 f8 |
  f4 f4 |
  c4 c4 |
  f2 |
  c8 c8 e4 |
  f8 f8 f4 |
  bes,8 f'8 g8 f8 |
  c8 c8 c4 |
  f4 f8 f8 |
  f4 f4 |
  c4 c8 c8 |
  f2 |
  f8 f8 f8 f8 |
  f4 f4 |
  c4 c4 |
  f2 \bar "||"
  d8 d8 g8 g8 |
  d8 d8 a4 |
  d8 a8 d8 g8 |
  a2 |
  d,8 d8 g8 g8 |
  d8 d8 a4 |
  d8 d8 a8 a8 |
  d2 \bar "|."
}

firstVerse = \lyricmode {
  \set stanza = "1."
  Fröh -- li -- che Weih -- nacht ü -- ber -- all!
  Tö -- net durch die Lüf -- te fro -- her Schall.
  Weih -- nachts -- ton, Weih -- nachts -- baum,
  Weih -- nachts -- duft in je -- dem Raum!
  Fröh -- li -- che Weih -- nacht ü -- ber -- all!
  Tö -- net durch die Lüf -- te fro -- her Schall.
  Da -- rum al -- le stim -- met ein
  in den Ju -- bel -- ton;
  denn es kommt das Licht der Welt
  von des Va -- ters Thron.
}

secondVerse = \lyricmode {
  \set stanza = "2."
  Fröh -- li -- che Weih -- nacht ü -- ber -- all!
  Tö -- net durch die Lüf -- te fro -- her Schall.
  Weih -- nachts -- ton, Weih -- nachts -- baum,
  Weih -- nachts -- duft in je -- dem Raum!
  Fröh -- li -- che Weih -- nacht ü -- ber -- all!
  Tö -- net durch die Lüf -- te fro -- her Schall.
  Licht auf dunk -- lem Le -- bens -- weg,
  un -- ser Licht bist du;
  denn du führst, die dir ver -- traun,
  ein zur sel' -- gen Ruh.
}

thirdVerse = \lyricmode {
  \set stanza = "3."
  Fröh -- li -- che Weih -- nacht ü -- ber -- all!
  Tö -- net durch die Lüf -- te fro -- her Schall.
  Weih -- nachts -- ton, Weih -- nachts -- baum,
  Weih -- nachts -- duft in je -- dem Raum!
  Fröh -- li -- che Weih -- nacht ü -- ber -- all!
  Tö -- net durch die Lüf -- te fro -- her Schall.
  Was wir an -- dern je ge -- tan,
  sei ge -- tan für dich,
  dass be -- ken -- nen je -- der muss:
  Christ -- kind kam für mich.
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
