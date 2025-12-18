\include "header.ly"

\include "melody.ly"
\include "chords.ly"
\include "rhythm.ly"
\include "bass.ly"

\header {
  instrument = \markup { "C Treble Instruments" }
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
      \transpose c c''
      \bass
    }
  >>
}
