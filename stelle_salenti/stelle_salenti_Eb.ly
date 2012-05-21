\include "header.ly"

\include "melody.ly"
\include "chords.ly"
\include "rhythm.ly"
\include "bass.ly"

\header {
  instrument = \markup { "E" \flat " Instruments" }
}

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

    \new RhythmicStaff {
      \rhythm
    }

    \new Staff {
      \clef treble
      \transpose ees c''
      \bass
    }
  >>
}


