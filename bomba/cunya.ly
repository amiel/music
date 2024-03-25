
\markup {
  \bold "Cunyá (norte)"
}

CunyaCua = \drummode {
  \repeat volta 2 {
    cab8-> cab cab16 cab cab8 |
    cab8-> cab cab16 cab cab8 |
  }
}

CunyaBarril = \drummode {
  \repeat volta 2 {
    ho8_"R"^\markup {buleador} ca8_"R" se16_"R" se16_"L" se8_"R" |
    ho8_"R"^\markup {variación} ca8_"R" ho16_"R" se16_"L" se8_"R" |
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
      \CunyaCua
    }

    \new DrumStaff \with {
      \override StaffSymbol.line-count = #4
      instrumentName = \barrilInstrument
      drumStyleTable = #(alist->hash-table barril-style)
      % drumPitchTable = #(alist->hash-table midiDrumPitches)
    } {
      \new DrumVoice = "sica" { \CunyaBarril }
    }
  >>

  \layout {}
}





