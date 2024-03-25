
\markup {
  \bold "Hoyomula (norte)"
}

HoyomulaCua = \drummode {
  r2 |
  \repeat volta 2 {
    cab8-> cab16 cab cab8 cab |
    cab8-> cab16 cab cab8 cab |
  }
}

HoyomulaBarril = \drummode {
  seco16_"R" ^\markup {primo} seco8_"L" seco16_"L" seco16_"R" seco16_"L" seco8_"R"
  
  \repeat volta 2 {
    ho8_"R"^\markup {buleador} ca16_"R" se16_"L" se8_"L" ca8_"R" |
    ca8_"R"^\markup {variación} ca16_"R" se16_"L" se8_"L" ho8_"R" |
 }
}

\score {
  <<
    \time 2/4

    \new DrumStaff \with {
      \override StaffSymbol.line-count = #1
      instrumentName = "Maraca"
      drumStyleTable = #percussion-style
    } {
      r2
      \repeat volta 2 {
        \Tren
      }
    }

    \new DrumStaff \with {
      \override StaffSymbol.line-count = #1
      instrumentName = "Cua"
      drumStyleTable = #percussion-style
    } {
      \HoyomulaCua
    }

    \new DrumStaff \with {
      \override StaffSymbol.line-count = #4
      instrumentName = \barrilInstrument
      drumStyleTable = #(alist->hash-table barril-style)
      % drumPitchTable = #(alist->hash-table midiDrumPitches)
    } {
      \new DrumVoice = "sica" { \HoyomulaBarril }
    }
  >>

  \layout {}
}


