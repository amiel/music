\include "header.ly"

\include "melody.ly"
\include "chords.ly"
\include "rhythm.ly"
\include "bass.ly"


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

%
%
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
%
%   \header {
%     piece = \markup { "E" \flat " Instruments" }
%   }
% }
%
%
% \score {
%   <<
%     \time 4/4
%
%
%     \new Staff {
%       \transpose bes c
%       \melody
%     }
%
%     \new ChordNames {
%       \transpose bes c
%       \chordnames
%     }
%
%
%     \new RhythmicStaff {
%       \rhythm
%     }
%
%     \new Staff {
%       \clef treble
%       \transpose bes c''
%       \bass
%     }
%
%   >>
%
%   \header {
%     piece = \markup { "B" \flat " Instruments" }
%   }
% }

