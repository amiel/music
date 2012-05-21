\header{
%   filename = "test.ly"
%   composer          = "Amiel Martin"
  title             = "Stelle Salenti"
  subtitle          = "(Soaring Star)"
  tagline = "" % remove

%   copyright         = "Creative Commons Attribution-ShareAlike 2.5"
  maintainer        = "Amiel Martin"
  lastupdated       = "2012/05/20"
}

\version "2.8.6"

\include "melody.ly"
\include "chords.ly"
\include "rhythm.ly"
\include "bass.ly"

\layout {
%     indent = #0
  \context { \ChordNames
     \override ChordName #'font-size = #1
%      \override ChordName #'font-series = #'bold
  }

%   line-width = #150
%   ragged-last = ##t
}


%
% \markup {
%    Structure:
%    A\small\raise #1 {1}
%    A\small\raise #1 {2}
%    B*4
%    A\small \raise #1 3
%    C*2
%    A\small \raise #1 2
%    B*8
%    A \small \raise #1 3
%    C*2
%    A \small \raise #1 1
% }


\markup {
  "C Instruments"
}

\score {
  <<
    \time 4/4

    \new Staff {
      \melody
    }

    \new ChordNames {
      \chordnames
    }

    \new RhythmicStaff {
      \rhythm
    }

    \new Staff {
      \clef bass
      \bass
    }
  >>
}

% \pageBreak

%
% \markup { "E" \flat " Instruments" }
% \score {
%   <<
%     \time 4/4
%
%
%     \new Staff {
%       \transpose ees c
%       \melody
%     }
%
%     \new ChordNames {
%       \transpose ees c
%       \chordnames
%     }
%
%
%     \new RhythmicStaff {
%       \rhythm
%     }
%
%     \new Staff {
%         \clef treble
%         \transpose ees c''
%         \bass
%     }
%
%   >>
% }


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

