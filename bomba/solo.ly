\version "2.24.3"

\include "barril.ly"

\header { 
  title = "Sicá Solo"
}

\include "barril-key.ly"


Base = \drummode { se8-> se16 se r se se r | }

SicaBarril = \drummode {
  \Base

  ab16 ab ab ab
  se8-> ab16 ab |
  ab ab se8->
  ab16 ab ab ab |

  \Base

  se8.-> ab16 
  se8.-> ab16 |
  se8.-> ab16 
  se8.-> ab16 |

  \Base

  se16-> se16-> r8 
  r8 ab |

  \tuplet 3/2 { ab8 ab ab } 
  \tuplet 3/2 { ab8 ab ab } |

  \Base

  r16 se-> se-> ab
  r16 ab ab r |

}

\score {
  <<
    \new DrumStaff \with {
      \override StaffSymbol.line-count = #4
      instrumentName = \barrilInstrument
      drumStyleTable = #(alist->hash-table barril-style)
    } {
      \time 2/4
      \new DrumVoice = "sica" { \SicaBarril }
    }
  >>

  \layout {}
}


