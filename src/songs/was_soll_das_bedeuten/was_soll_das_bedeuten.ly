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

melody = \relative c'' {
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
  und sin -- gen ihm Lieder mit süs -- sem Schal.
}

\score {
  <<
    \new Staff {
      \new Voice = "singer" { \melody }
    }
    \new Lyrics \lyricsto "singer" \firstVerse
    \new Lyrics \lyricsto "singer" \secondVerse
    \new Lyrics \lyricsto "singer" \thirdVerse
  >>
  \layout { }
  \midi { }
}
