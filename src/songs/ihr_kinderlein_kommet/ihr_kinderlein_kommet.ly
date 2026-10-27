\version "2.24.0"

\header {
  title = "Ihr Kinderlein, kommet"
  composer = "Johann Abraham Peter Schulz (1796)"
  poet = "Christoph von Schmid (1798)"
  tagline = ##f
}

global = {
  \key d \major
  \time 2/4
  \tempo 4 = 80
}

harmonies = \chordmode {
  \partial 8 s8 |
  d2 | d2 | a2:7 | a2:7 |
  d2 | g2 | a2:7 | d4. |
}

soprano = \relative c'' {
  \global
  \partial 8 a8 |
  fis8. e16 d8 e8 |
  fis8 fis8 fis8 r8 |
  g8. fis16 e8 fis8 |
  g8 g8 g8 r8 |
  a8. g16 fis8 g8 |
  a8 a8 b8 b8 |
  a8. g16 fis8 e8 |
  d4. \bar "|."
}

alto = \relative c' {
  \global
  \partial 8 fis8 |
  d8. cis16 d8 cis8 |
  d8 d8 d8 r8 |
  e8. d16 cis8 d8 |
  e8 e8 e8 r8 |
  fis8. e16 d8 e8 |
  fis8 fis8 g8 g8 |
  fis8. e16 d8 cis8 |
  d4. \bar "|."
}

tenor = \relative c' {
  \global
  \partial 8 a8 |
  a8. a16 a8 a8 |
  a8 a8 a8 r8 |
  a8. a16 a8 a8 |
  a8 a8 a8 r8 |
  a8. a16 a8 a8 |
  d8 d8 d8 d8 |
  d8. b16 a8 g8 |
  fis4. \bar "|."
}

bass = \relative c {
  \global
  \partial 8 d8 |
  d8. d16 d8 a8 |
  d8 d8 d8 r8 |
  a'8. a16 a8 a,8 |
  a'8 a8 a,8 r8 |
  d8. d16 d8 d8 |
  d8 d8 g,8 g8 |
  a8. a16 a8 a8 |
  d4. \bar "|."
}

firstVerse = \lyricmode {
  Ihr Kin -- der -- lein, kom -- met, o kom -- met doch all'!
  Zur Krip -- pe kommt ei -- len in Beth -- le -- hems Stall,
  und seht, was in die -- ser hoch -- hei -- li -- gen Nacht
  der Va -- ter im Him -- mel für Freu -- de uns macht.
}

secondVerse = \lyricmode {
  O seht in der Krip -- pe im nächt -- li -- chen Stall,
  seht hier bei des Licht -- leins strah -- len -- dem Strahl,
  in rein -- li -- chen Win -- deln das himm -- li -- sche Kind,
  viel schö -- ner als En -- gel: es lä -- chelt so hold.
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
