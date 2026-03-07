\include "header.ly"

\include "melody.ly"
\include "chords.ly"
\include "rhythm.ly"
\include "bass.ly"

\header {
  instrument = \markup { "F Instruments" }
}

\score {
  <<
    \time 4/4

    \new Staff {
      \transpose f c
      \melody
    }

    \new ChordNames {
      \transpose f c
      \chordnames
    }

    \new RhythmicStaff {
      \rhythm
    }

    \new Staff {
      \clef treble
      \transpose f c''
      \bass
    }
  >>
}


