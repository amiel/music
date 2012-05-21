\include "header.ly"

\include "melody.ly"
\include "chords.ly"
\include "rhythm.ly"
\include "bass.ly"

\header {
  instrument = \markup { "B" \flat " Instruments" }
}

\score {
  <<
    \time 4/4

    \new Staff {
      \transpose bes c
      \melody
    }

    \new ChordNames {
      \transpose bes c
      \chordnames
    }

    \new RhythmicStaff {
      \rhythm
    }

    \new Staff {
      \clef bass
      \transpose bes c'
      \bass
    }
  >>
}

