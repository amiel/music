\version "2.24.4"

\pointAndClickOff

\include "_music.ly"

\header {
  title = "We Shall Overcome"
  subtitle = "For Artesian Rumble Arkestra"
  subsubtitle = "To accompany the Olympia Resistance Singers"
  arranger = "arr Amiel Martin"
}

\book {
  \bookOutputName "We Shall Overcome - C"

  \header { 
    subtitle = \markup { C instruments }
  }

  \score { 
    \new StaffGroup <<
      \new Staff \with { instrumentName = \markup \center-column {  "Flute" "Bells" } } {  \SopranoMusic }
      \new Staff \with { instrumentName = \markup \center-column { "Trombone" } } { \clef bass \AltoMusic }
      \new Staff \with { instrumentName = "Trombone" } { \clef bass \TenorMusic }
      \new Staff \with { instrumentName = "Sousaphone" } { \clef bass \BassMusic }
    >>

    \layout { }
  }
}

\book {
  \bookOutputName "We Shall Overcome - B-flat"
  \header { 
    subtitle = \markup { B \flat instruments }
  }

  \score { 
    \transpose bes c' {
      \new StaffGroup <<
        \new Staff \with { instrumentName = \markup \center-column {  "Trumpet" "S. Sax" } } \SopranoMusic
        \new Staff \with { instrumentName = \markup \center-column { "Trumpet" "T. Sax" "Clarinet" } } \AltoMusic
        \new Staff \with { instrumentName = \markup \center-column { "Baritone" "T. Sax" } } \transpose c c' \TenorMusic
        \new Staff \with { instrumentName = \markup \center-column { "Baritone" "Bass Sax" } } \transpose c c' \BassMusic
      >>
    }
    \layout { }
  }
}

\book {
  \bookOutputName "We Shall Overcome - E-flat"

  \header { 
    subtitle = \markup { E \flat instruments }
  }

  \score { 
    \transpose ees c' {
      \new StaffGroup <<
        \new Staff \with { instrumentName = "A. Sax" } \SopranoMusic
        \new Staff \with { instrumentName =  "A. Sax" } \AltoMusic
        \new Staff \with { instrumentName = "Bari Sax" } \TenorMusic
        \new Staff \with { instrumentName = "Bari Sax" } \BassMusic
      >>
    }

    \layout { }
  }
}


