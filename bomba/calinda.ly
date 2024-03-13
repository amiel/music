
\markup {
  \bold "Calindá (norte)"
}

CalindaCua = \drummode {
  \repeat volta 2 {
    cab8-> cab16 cab16 cab8-> cab16 cab16 |
    cab8-> cab16 cab16 cab8-> cab16 cab16 |
  }
}

CalindaBarril = \drummode {
  \repeat volta 2 {
    ho8_"R"^\markup {buleador} ca16_"R" ho16_"L" ho8_"R" ca16_"R" \parenthesize ca16_"L" |
    ho8._"R"^\markup {variación} ho16_"L" ho8_"R" ca16_"R" ca16_"L" |
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
      \repeat volta 2 {
        \Tren
      }
    }

    \new DrumStaff \with {
      \override StaffSymbol.line-count = #1
      instrumentName = "Cua"
      drumStyleTable = #percussion-style
    } {
      \CalindaCua
    }

    \new DrumStaff \with {
      \override StaffSymbol.line-count = #4
      instrumentName = "Barril "
      drumStyleTable = #(alist->hash-table barril-style)
      % drumPitchTable = #(alist->hash-table midiDrumPitches)
    } {
      \new DrumVoice = "sica" { \CalindaBarril }
    }
  >>

  \layout {}
}





