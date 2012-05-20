\header{
%   filename = "test.ly"
%   composer          = "Amiel Martin"
  title             = "Stelle Salenti"
 subtitle          = "(Soaring Star)"

%   copyright         = "Creative Commons Attribution-ShareAlike 2.5"
  maintainer        = "Amiel Martin"
  lastupdated       = "2011/10/20"
}

\version "2.8.6"


melody = \relative c'' {
  \set Staff.instrumentName = #"Melody"
  \key g \minor

  \times 2/3 { g4 bes d8 g } bes a g fis |
  g4 f?8 ees d bes g4 |
  r8 c4 c d bes8 ~ |
  bes4 a8 g a bes d4 |

  \grace { a8 }
  \times 2/3 { g4 bes d8 g } bes a g fis |
  g4 f?8 ees d bes c4~ |
  c4. d8 ees4
  \acciaccatura { c16[ bes] }
  a8 g |
  f?8 g a bes g2 |
}


chordnames = \chordmode {
  \set chordChanges = ##t

  g1:m |

%   d1:m       |
%   a2:m7 d2:m |
%   d1:m       |
%   a2:m7 d2:m |
%
% % New line?
% \break
%
%   \set chordChanges = ##f
%   d2:m a2:m7 |
%   \set chordChanges = ##t
%   a2:m7 d2:m |
%   d2:m a2:m7 |
%   a2:m7 d2:m |
%

}

rhythm = \relative c' {
  \set Staff.instrumentName = #"Rhythm"
  \clef percussion
  \override Stem #'direction = #down

  g8
}


bass = \relative c {
  \set Staff.instrumentName = #"Bass"
  \key g \minor

  g4. g8 d'4. d8 |
  ees4. ees8 d4. d8 |
  c4. c8 bes4. bes8 |
  a4. a8 d4 d, |

  g4. g8 a4. a8 |
  bes2. c4~ |
  c1 |
  a2 a4 r4 |
}

\layout {
%     indent = #0
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

    \new Staff {
      \melody
    }

    \new ChordNames {
      \chordnames
    }
%
%     \new RhythmicStaff {
%       \rhythm
%     }

    \new Staff {
      \clef bass
      \bass
    }
  >>
}

% \pageBreak


\markup { "E" \flat " Instruments" }
\score {
  <<
    \time 4/4


    \new Staff {
      \transpose ees c
      \melody
    }

    \new ChordNames {
      \transpose ees c
      \chordnames
    }


    \new Staff {
        \clef treble
        \transpose ees c''
        \bass
    }

  >>
}


%
% \markup { "B" \flat " Instruments" }
% \score {
%   <<
%     \time 4/4
%
%     \new ChordNames {
%       \transpose bes c
%       \chordnames
%     }
%
%
%     \new Staff {
%       \transpose bes c'
%       \background
%     }
%
%   >>
% }
%

