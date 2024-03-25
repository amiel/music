
\markup {
  \bold "Sicá (Santurce)"
}

SicaBarril = \drummode {
  seco8_"R" ^\markup {primo} se_"R" se_"R" se_"R" |
  
  ab8_"R" ^\markup {buleador} ab16_"R" ab_"L" r ab_"L" ab_"R" r |

  \repeat volta 2 {
   ho8._"R" ab16_"L" r ab_"L" ab_"R" r |
   ho8._"R" ab16_"L" r ab_"L" ab_"R" r |
 }
}

SicaWords = \lyricmode {
  % llamada
  _ _ _ _ |
  _ _ _ _ _ |

  _ ca -- fe con pan 
}

\score {
  <<
    \new DrumStaff \with {
      \override StaffSymbol.line-count = #1
      instrumentName = "Maraca/Cua"
      drumStyleTable = #percussion-style
    } {
      \time 2/4
      r2 r
      \repeat volta 2 {
        \Tren
      }
    }

    \new DrumStaff \with {
      \override StaffSymbol.line-count = #4
      instrumentName = \barrilInstrument
      drumStyleTable = #(alist->hash-table barril-style)
      % drumPitchTable = #(alist->hash-table midiDrumPitches)
    } {
      \time 2/4
      \new DrumVoice = "sica" { \SicaBarril }
    }

    \new Lyrics {
      \lyricsto "sica" {
        \SicaWords
      }
    }
  >>

  \layout {}
}


