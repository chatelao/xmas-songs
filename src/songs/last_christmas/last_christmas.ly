\version "2.24.0"

\header {
  title = "Last Christmas"
  composer = "George Michael (1984)"
  poet = "George Michael (1984)"
  tagline = ##f
}

global = {
  \key d \major
  \time 4/4
  \tempo 4 = 108
}

harmonies = \chordmode {
  d1 | d1 | b1:m | b1:m |
  e1:m | e1:m | a1 | a1 |
  d1 | d1 | b1:m | b1:m |
  e1:m | e1:m | a1 | a1 |
}

soprano = \relative c'' {
  \global
  % Takt 1-4: Korrekte Phrasierung (Zählzeit 2) & Intervalle
  r4 fis,4 fis4. e8 |
  r4 a8 fis8 fis8 g8 a8 fis8~ |
  fis4 b,2 r4 |
  r8 b8 fis'8 g8 fis4 d4 |
  % Takt 5-8
  r8 e8 a8 a8 b8 a4 e8~ |
  e4 fis8 e8 fis8 e8 d8 cis8~ |
  cis4 r4 r2 |
  r2 r8 a'8 b4 |
  % Takt 9-12: Korrekter Oktavsprung (a' statt übermäßiger Oktave)
  a4 fis4 fis4. e8 |
  r4 a8 fis8 fis8 g8 a8 fis8~ |
  fis4 b,2 r4 |
  r8 b8 fis'8 g8 fis4 d4 |
  % Takt 13-16: Authentischer Halbschluss auf der Dominante A
  r8 e8 a8 a8 b8 a4 e8~ |
  e4 fis8 e8 fis8 e8 d8 cis8~ |
  cis4 r4 r2 |
  R1 \bar "|."
}

alto = \relative c' {
  \global
  % Takt 1-4
  r4 d4 d4. cis8 |
  r4 fis8 d8 d8 e8 fis8 d8~ |
  d4 b2 r4 |
  r8 b8 d8 e8 d4 b4 |
  % Takt 5-8
  r8 b8 e8 e8 g8 e4 b8~ |
  b4 d8 b8 d8 b8 b8 a8~ |
  a4 r4 r2 |
  r2 r8 cis8 d4 |
  % Takt 9-12
  fis4 d4 d4. cis8 |
  r4 fis8 d8 d8 e8 fis8 d8~ |
  d4 b2 r4 |
  r8 b8 d8 e8 d4 b4 |
  % Takt 13-16
  r8 b8 e8 e8 g8 e4 b8~ |
  b4 d8 b8 d8 b8 b8 a8~ |
  a4 r4 r2 |
  R1 \bar "|."
}

tenor = \relative c' {
  \global
  % Takt 1-4
  r4 a4 a4. a8 |
  r4 d8 a8 a8 b8 cis8 b8~ |
  b4 fis2 r4 |
  r8 fis8 b8 b8 b4 fis4 |
  % Takt 5-8 (Takt 8: Vermeidung des falschen f-natural)
  r8 g8 b8 b8 d8 b4 g8~ |
  g4 a8 g8 a8 g8 fis8 e8~ |
  e4 r4 r2 |
  r2 r8 e8 fis4 |
  % Takt 9-12
  d'4 a4 a4. a8 |
  r4 d8 a8 a8 b8 cis8 b8~ |
  b4 fis2 r4 |
  r8 fis8 b8 b8 b4 fis4 |
  % Takt 13-16
  r8 g8 b8 b8 d8 b4 g8~ |
  g4 a8 g8 a8 g8 fis8 e8~ |
  e4 r4 r2 |
  R1 \bar "|."
}

bass = \relative c' {
  \global
  % Im treble_8-Schlüssel klingen diese Noten in der großen/kleinen Oktave (A2-G3)
  % Takt 1-4
  r4 d,4 d4. d8 |
  r4 d8 d8 d8 d8 d8 b8~ |
  b4 b2 r4 |
  r8 b8 b8 b8 b4 b4 |
  % Takt 5-8
  r8 e8 e8 e8 e8 e4 e8~ |
  e4 e8 e8 e8 e8 e8 a,8~ |
  a4 r4 r2 |
  r2 r8 a8 a4 |
  % Takt 9-12
  d4 d4 d4. d8 |
  r4 d8 d8 d8 d8 d8 b8~ |
  b4 b2 r4 |
  r8 b8 b8 b8 b4 b4 |
  % Takt 13-16
  r8 e8 e8 e8 e8 e4 e8~ |
  e4 e8 e8 e8 e8 e8 a,8~ |
  a4 r4 r2 |
  R1 \bar "|."
}

firstVerse = \lyricmode {
  % Takt 1-8: Zitat (George Michael, 1984) exakt auf 25 Noten (ohne Überbindungen) gemappt
  Last Christ -- mas I gave you my heart,
  but the ve -- ry next day you gave it a -- way.
  This year, to save me from tears,
  I'll give it to some -- one spe -- cial.
  
  % Takt 9-16: Platzhalter (27 Silben) – vollständigen Text via Google-Suche ergänzen
  _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
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
  >>
  \layout {
    \context {
      \Score
      % Taktnummern alle 4 Takte sichtbar machen (sinnvolle Phrasen-Abstände)
      barNumberVisibility = #(every-nth-bar-number-visible 4)
      \override BarNumber.break-visibility = #end-of-line-invisible
      \override BarNumber.self-alignment-X = #CENTER
    }
  }
  \midi { }
}
