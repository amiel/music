
\markup {
  \bold "Cuembé (Cataño)"
}

CuembeBarril = \drummode {

  seco16_"R" ^\markup {primo} se_"L" se_"R" se_"L" se_"R" se_"L" se8_"R" |
  
  ab16_"R" ^\markup {buleador} ab_"L" ab_"R" ab_"L" ab_"R" ab_"L" ab8_"R" | 

  \repeat volta 2 {
    ho8_"R" ca16_"R" ab_"L" ho16_"R" ab_"L" ca_"R" ab_"L" |
    ho8_"R" ca16_"R" ab_"L" ho16_"R" ab_"L" ca_"R" ab_"L" |
 }
}

CuembeWords = \lyricmode {
  % llamada
  _ _ _ _ _ _ _ |
  _ _ _ _ _ _ _ |

  _ Pue -- rto Ri -- co tie -- ne qua
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
      instrumentName = "Barril "
      drumStyleTable = #(alist->hash-table barril-style)
      % drumPitchTable = #(alist->hash-table midiDrumPitches)
    } {
      \time 2/4
      \new DrumVoice = "sica" { \CuembeBarril }
    }

    \new Lyrics {
      \lyricsto "sica" {
        \CuembeWords
      }
    }
  >>

  \layout {}
}


