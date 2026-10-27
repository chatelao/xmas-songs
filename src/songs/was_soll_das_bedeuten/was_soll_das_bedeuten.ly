\version "2.24.0"

\header {
  title = "Was soll das bedeuten"
  composer = "Schlesische Volksweise"
  poet = "Traditionell aus Schlesien"
  tagline = ##f
}

global = {
  \key g \major
  \time 6/8
  \tempo 4. = 50
}

harmonies = \chordmode {
  g2. | g2. | a4.:m d4.:7 | g2. |
  g2. | g2. | a4.:m d4.:7 | g2. |
  d2.:7 | d2.:7 | g2. | g2. |
  g2. | g2. | a4.:m d4.:7 | g2. |
}

soprano = \relative c'' {
  \global
  g4 g8 b4 b8 |
  d4. b4. |
  c4 c8 a4 a8 |
  b4. g4. |
  g4 g8 b4 b8 |
  d4. b4. |
  c4 c8 a4 a8 |
  g2. |
  a4 a8 a4 b8 |
  c4. a4. |
  b4 b8 b4 c8 |
  d2. |
  g,4 g8 b4 b8 |
  d4. b4. |
  c4 c8 a4 a8 |
  g2. \bar "|."
}

alto = \relative c' {
  \global
  d4 d8 g4 g8 |
  g4. g4. |
  e4 e8 fis4 fis8 |
  g4. d4. |
  d4 d8 g4 g8 |
  g4. g4. |
  e4 e8 fis4 fis8 |
  d2. |
  fis4 fis8 fis4 g8 |
  a4. fis4. |
  g4 g8 g4 a8 |
  b2. |
  d,4 d8 g4 g8 |
  g4. g4. |
  e4 e8 fis4 fis8 |
  d2. \bar "|."
}

tenor = \relative c' {
  \global
  b4 b8 d4 d8 |
  b4. d4. |
  c4 c8 c4 c8 |
  d4. b4. |
  b4 b8 d4 d8 |
  b4. d4. |
  c4 c8 c4 c8 |
  b2. |
  c4 c8 c4 d8 |
  d4. c4. |
  d4 d8 d4 d8 |
  d2. |
  b4 b8 d4 d8 |
  b4. d4. |
  c4 c8 c4 c8 |
  b2. \bar "|."
}

bass = \relative c {
  \global
  g'4 g8 g4 g8 |
  g4. g4. |
  a4 a8 d,4 d8 |
  g4. g,4. |
  g'4 g8 g4 g8 |
  g4. g4. |
  a4 a8 d,4 d8 |
  g,2. |
  d'4 d8 d4 d8 |
  d4. d4. |
  g4 g8 g4 g8 |
  g,2. |
  g'4 g8 g4 g8 |
  g4. g4. |
  a4 a8 d,4 d8 |
  g,2. \bar "|."
}

firstVerse = \lyricmode {
  Was soll das be -- deu -- ten? Es gra -- bounds die Nacht,
  mit hel -- lem Ge -- leuch -- te ist al -- les er -- wacht.
  Ich hör' ma -- chen Mu -- sik und Sin -- gen so schön,
  von Him -- mel her ob -- en die En -- gel zu sehn.
}

secondVerse = \lyricmode {
  Geht hin nach Be -- thle -- hem und su -- chet das Kind,
  das dort in der Crip -- pe so freund -- lich euch grinst.
  Ein Kind -- lein so wün -- derschön, zart und so klein,
  das soll eu er Hei -- land und Trös -- ter nun sein.
}

thirdVerse = \lyricmode {
  So lasset uns ei -- len mit Freu -- den und Lust,
  dem Kind -- lein zu brin -- gen die Lie -- be der Brust.
  Wir knie -- en vor ihm in der Krip -- pe so kalt
  und sin -- gen ihm Lieder mit sues -- sem Schal.
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
    \new Lyrics \lyricsto "soprano" \thirdVerse
  >>
  \layout { }
  \midi { }
}
