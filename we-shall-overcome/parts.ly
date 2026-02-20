\version "2.24.4"

\pointAndClickOff

\include "_music.ly"

date = #(strftime "%Y-%m-%d" (localtime (current-time)))
revisionInfo = \markup { \concat { "Revision " \date } }

\header {
  title = "We Shall Overcome"
  subtitle = "For Artesian Rumble Arkestra"
  subsubtitle = "To accompany the Olympia Resistance Singers"
  arranger = "arr Amiel Martin"
  tagline = \revisionInfo
}

\book {
  \bookOutputName "We Shall Overcome - C"

  \header { 
    subtitle = \markup { C instruments }
  }

  \score { 
    \new StaffGroup <<
      \new ChordNames \Chords
      \new Staff \with { instrumentName = \markup \center-column {  "Flute" "Bells" } } {  \SopranoMusic }
      \new Staff \with { instrumentName = \markup \center-column { "Trombone" } } { \clef bass \AltoMusic }
      \new Staff \with { instrumentName = "Trombone" } { \clef bass \TenorMusic \TenorSecondLine }
      \new Staff \with { instrumentName = "Sousaphone" } { \clef bass \BassMusic }
    >>

    \layout { }
  }

  \markup { \italic "Start at * for intro." }
}

\book {
  \bookOutputName "We Shall Overcome - B-flat"
  \header { 
    subtitle = \markup { B \flat instruments }
  }

  \score { 
    \transpose bes c' {
      \new StaffGroup <<
        \new ChordNames \Chords
        \new Staff \with { instrumentName = \markup \center-column {  "Trumpet" "S. Sax" } } \SopranoMusic
        \new Staff \with { instrumentName = \markup \center-column { "Trumpet" "T. Sax" "Clarinet" } } \AltoMusic
        \new Staff \with { instrumentName = \markup \center-column { "Baritone" "T. Sax" } } \transpose c c' \TenorMusic
        \new Staff \with { instrumentName = \markup \center-column { "Baritone" "Bass Sax" } } \transpose c c' \BassMusic
      >>
    }
    \layout { }
  }

  \markup { \italic "Start at * for intro." }
}

\book {
  \bookOutputName "We Shall Overcome - E-flat"

  \header { 
    subtitle = \markup { E \flat instruments }
  }

  \score { 
    \transpose ees c' {
      \new StaffGroup <<
        \new ChordNames \Chords
        \new Staff \with { instrumentName = "A. Sax" } \SopranoMusic
        \new Staff \with { instrumentName =  "A. Sax" } \AltoMusic
        \new Staff \with { instrumentName = "Bari Sax" } \TenorMusic
        \new Staff \with { instrumentName = "Bari Sax" } \BassMusic
      >>
    }

    \layout { }
  }

  \markup { \italic "Start at * for intro." }
}

\book {
  \bookOutputName "We Shall Overcome - F"

  \header { 
    subtitle = \markup { F instruments }
  }

  \score { 
    \transpose ees c' {
      \new StaffGroup <<
        \new ChordNames \Chords
        \new Staff \SopranoMusic
        \new Staff \AltoMusic
        \new Staff \TenorMusic
      >>
    }

    \layout { }
  }

  \markup { \italic "Start at * for intro." }
}
