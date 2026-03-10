\version "2.24.4"

\pointAndClickOff

\include "_music.ly"

\header {
  title = "Lead With Love"
  subtitle = "For Artesian Rumble Arkestra"
  arranger = "arr Amiel Martin"
}

\book {
  \bookOutputName "Lead With Love - C"

  \header {
    subtitle = \markup { C instruments }
  }

  \score {
    \new StaffGroup <<
      \new ChordNames \Chords
      \new Staff \with { instrumentName = \markup \center-column {  "Flute" "Bells" } } {  \MelodyMusic }
      \new Staff \with { instrumentName = \markup \center-column { "Trombone" } } { \clef bass \CounterMelodyMusic }
      \new Staff \with { instrumentName = "Sousaphone" } { \clef bass \BassMusic }
    >>

    \layout { }
  }
}

\book {
  \bookOutputName "Lead With Love - B-flat"
  \header {
    subtitle = \markup { B \flat instruments }
  }

  \score {
    \transpose bes c' {
      \new StaffGroup <<
        \new ChordNames \Chords
        \new Staff \with { instrumentName = \markup \center-column {  "Trumpet" "S. Sax" } } \MelodyMusic
        \new Staff \with { instrumentName = \markup \center-column { "Trumpet" "T. Sax" "Clarinet" } } \CounterMelodyMusic
        \new Staff \with { instrumentName = \markup \center-column { "Baritone" "Bass Sax" } } \transpose c c' \BassMusic
      >>
    }
    \layout { }
  }
}

\book {
  \bookOutputName "Lead With Love - E-flat"

  \header {
    subtitle = \markup { E \flat instruments }
  }

  \score {
    \transpose ees c' {
      \new StaffGroup <<
        \new ChordNames \Chords
        \new Staff \with { instrumentName = "A. Sax" } \MelodyMusic
        \new Staff \with { instrumentName =  "A. Sax" } \CounterMelodyMusic
        \new Staff \with { instrumentName = "Bari Sax" } \BassMusic
      >>
    }

    \layout { }
  }
}

\book {
  \bookOutputName "Lead With Love - F"

  \header { 
    subtitle = \markup { F instruments }
  }

  \score { 
    \transpose ees c' {
      \new StaffGroup <<
        \new ChordNames \Chords
        \new Staff \MelodyMusic
        \new Staff \CounterMelodyMusic
        \new Staff \BassMusic
      >>
    }

    \layout { }
  }

  \markup { \italic "Start at * for intro." }
}
