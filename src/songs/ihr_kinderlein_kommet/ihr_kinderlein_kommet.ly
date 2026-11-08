\version "2.24.0"

\header {
  title = "Ihr Kinderlein, kommet"
  composer = "Johann Abraham Peter Schulz"
  poet = "Christoph von Schmid"
  arranger = "SATB-Satz"
  tagline = ##f
}

global = {
  \key d \major
  \time 2/4
  \tempo 4 = 80
}

harmonies = \chordmode {
  \partial 8 s8 |

  % Ihr Kinderlein, kommet ...
  d2 | d2 | a2:7 | d2 |

  % Zur Krippe her kommet ...
  d2 | d2 | a2:7 | d2 |

  % Und seht, was in dieser ...
  a2:7 | a2:7 | d2 | d2 |

  % Der Vater im Himmel ...
  a2:7 | a2:7 | d4 a4:7 | d4.
}

soprano = \relative c'' {
  \global
  \partial 8 a8 |

  a4 fis8 a |
  a4 fis8 a |
  g4 e8 g |
  fis4. a8 |

  a4 fis8 a |
  a4 fis8 a |
  g4 e8 g |
  fis4. fis8 |

  e4 e8 e |
  g4 fis8 e |
  fis4 fis8 fis |
  fis4( a8) fis |

  e4 e8 e |
  g4 fis8 e |
  d4 fis8 e |
  d4. \bar "|."
}

alto = \relative c' {
  \global
  \partial 8 fis8 |

  fis4 d8 fis |
  fis4 d8 fis |
  e4 cis8 e |
  d4. fis8 |

  fis4 d8 fis |
  fis4 d8 fis |
  e4 cis8 e |
  d4. d8 |

  cis4 cis8 cis |
  e4 d8 cis |
  d4 d8 d |
  d4( fis8) d |

  cis4 cis8 cis |
  e4 d8 cis |
  d4 d8 cis |
  d4. \bar "|."
}

tenor = \relative c' {
  \global
  \partial 8 a8 |

  d4 a8 d |
  d4 a8 d |
  cis4 a8 cis |
  a4. d8 |

  d4 a8 d |
  d4 a8 d |
  cis4 a8 cis |
  a4. a8 |

  a4 a8 a |
  a4 a8 a |
  a4 a8 a |
  a4. a8 |

  a4 a8 a |
  a4 a8 a |
  fis4 a8 g |
  fis4. \bar "|."
}

bass = \relative c {
  \global
  \partial 8 d8 |

  d4 d8 d |
  d4 d8 d |
  a4 a8 a |
  d4. d8 |

  d4 d8 d |
  d4 d8 d |
  a4 a8 a |
  d4. d8 |

  a4 a8 a |
  a4 a8 a |
  d4 d8 d |
  d4. d8 |

  a4 a8 a |
  a4 a8 a |
  d4 a8 a |
  d4. \bar "|."
}

firstVerse = \lyricmode {
  Ihr Kin -- der -- lein, kom -- met,
  o kom -- met doch all!
  Zur Krip -- pe her kom -- met
  in Beth -- le -- hems Stall.
  Und seht, was in die -- ser
  hoch -- hei -- li -- gen Nacht
  der Va -- ter im Him -- mel
  für Freu -- de uns macht.
}

secondVerse = \lyricmode {
  O seht in der Krip -- pe
  im nächt -- li -- chen Stall,
  seht hier bei des Licht -- leins
  hell glän -- zen -- dem Strahl,
  in rein -- li -- chen Win -- deln
  das himm -- li -- sche Kind,
  viel schö -- ner und hol -- der,
  als En -- ge -- lein sind.
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

      \new Lyrics \lyricsto "soprano" {
        \secondVerse
      }

      \new Staff \with {
        instrumentName = "T / B"
        shortInstrumentName = "T/B"
      } <<
        % Tenor bleibt eine Oktave tiefer klingend.
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
    indent = 15\mm
  }

  \midi { }
}
