\header{
%   filename = "test.ly"
%   composer          = "Amiel Martin"
  title             = "Ievan Polkka"
  subtitle          = "Some background stuff"

%   copyright         = "Creative Commons Attribution-ShareAlike 2.5"
  maintainer        = "Amiel Martin"
  lastupdated       = "2011/10/20"
}

\version "2.8.6"

chordnames = \chordmode {
  \set chordChanges = ##t

  d1:m       |
  a2:m7 d2:m |
  d1:m       |
  a2:m7 d2:m |

% New line?
\break

  \set chordChanges = ##f
  d2:m a2:m7 |
  \set chordChanges = ##t
  a2:m7 d2:m |
  d2:m a2:m7 |
  a2:m7 d2:m |


}


background = \relative c'' {
  \key d \minor
  \clef treble
  d4 c b  bes |
  a  r r2     |
  r1 | r2 r2 |

  \break

  f'4 e8 d8 c2 |
  e4 d8 cis8 d2 |
  r2 r2 | r2 r2 |
}

\layout {
  indent = #0
  \context { \ChordNames
     \override ChordName #'font-size = #1
%      \override ChordName #'font-series = #'bold
  }
%   line-width = #150
%   ragged-last = ##t
}

\markup { "C Instruments" }
\score {
  <<
    \time 4/4

    \new ChordNames {
      \chordnames
    }
    \new Staff {
      \background
    }
  >>
}


\markup { "E" \flat " Instruments" }
\score {
  <<
    \time 4/4

    \new ChordNames {
      \transpose ees c
      \chordnames
    }


    \new Staff {
      \transpose ees c
      \background
    }

  >>
}


\markup { "B" \flat " Instruments" }
\score {
  <<
    \time 4/4

    \new ChordNames {
      \transpose bes c
      \chordnames
    }


    \new Staff {
      \transpose bes c'
      \background
    }

  >>
}


