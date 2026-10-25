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

melody = \relative c'' {
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
    \new Staff {
      \new Voice = "singer" { \melody }
    }
    \new Lyrics \lyricsto "singer" \firstVerse
    \new Lyrics \lyricsto "singer" \secondVerse
  >>
  \layout { }
  \midi { }
}
