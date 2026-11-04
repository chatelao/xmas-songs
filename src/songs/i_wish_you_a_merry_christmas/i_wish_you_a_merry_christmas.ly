\version "2.24.0"

\header {
  title = "We Wish You a Merry Christmas"
  composer = "Englisches Volkslied"
  poet = "Traditionell"
  tagline = ##f
}

global = {
  \key f \major
  \time 3/4
  \tempo 4 = 120
}

harmonies = \chordmode {
  \partial 4 s4 |
  f2. |
  g2.:m |
  c2.:7 |
  f2. |
  f2. |
  bes2. |
  c2.:7 |
  f2
}

soprano = \relative c' {
  \global
  \partial 4 c4 |
  f4 f8 g f e |
  d4 d d |
  g4 g8 a g f |
  e4 c c |
  a'4 a8 bes a g |
  f4 d c8 c |
  d4 g e |
  f2 \bar "|."
}

alto = \relative c' {
  \global
  \partial 4 c4 |
  c4 c8 c c c |
  bes4 bes bes |
  e4 e8 f e d |
  c4 c c |
  c4 c8 d c bes |
  a4 bes a8 a |
  bes4 e c |
  c2 \bar "|."
}

tenor = \relative c' {
  \global
  \partial 4 a4 |
  a4 a8 bes a g |
  f4 f f |
  bes4 bes8 c bes a |
  g4 a g |
  f4 f8 f f e |
  f4 f f8 f |
  f4 g g |
  a2 \bar "|."
}

bass = \relative c {
  \global
  \partial 4 f4 |
  f4 f8 f f f |
  bes,4 bes bes |
  c4 c8 c c c |
  f4 f f |
  f4 f8 f f f |
  bes,4 bes f'8 f |
  bes,4 c c |
  f2 \bar "|."
}

firstVerse = \lyricmode {
  We wish you a mer -- ry Christ -- mas,
  we wish you a mer -- ry Christ -- mas,
  we wish you a mer -- ry Christ -- mas,
  and a hap -- py New Year!
}

\score {
  <<
    \new ChordNames {
      \set chordChanges = ##t
      \harmonies
    }

    \new ChoirStaff <<

      \new Staff \with {
        instrumentName = "S / A"
        shortInstrumentName = "S/A"
      } <<
        \clef treble
        \new Voice = "soprano" {
          \voiceOne
          \soprano
        }
        \new Voice = "alto" {
          \voiceTwo
          \alto
        }
      >>

      \new Lyrics \lyricsto "soprano" {
        \firstVerse
      }

      \new Staff \with {
        instrumentName = "T / B"
        shortInstrumentName = "T/B"
      } <<
        % Wie gewünscht für die Lesbarkeit beibehalten.
        \clef "treble_8"

        \new Voice = "tenor" {
          \voiceOne
          \tenor
        }
        \new Voice = "bass" {
          \voiceTwo
          \bass
        }
      >>

    >>
  >>

  \layout {
    indent = 18\mm
  }

  \midi { }
}
