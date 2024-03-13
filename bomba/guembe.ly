
\markup {
  \bold "Guembé (sur)"
}

GuembeCua = \drummode {
  r2 | r2 |
  \repeat volta 2 {
    cab8-> cab16 cab cab8 cab8 |
    cab8-> cab16 cab cab8 cab8 |
    cab8-> cab16 cab cab8 cab8 |
    cab16-> cab8 cab16 cab8 cab8 |
  }
}

GuembeBarril = \drummode {
  seco16_"R" ^\markup {primo} se_"L" se_"R" se_"L" se_"R" se_"L" se8_"R" |
  
  ab16_"R" ^\markup {buleador} ab_"L" ab_"R" ab_"L" ab_"R" ab_"L" ab8_"R" | 

  \repeat volta 2 {
    ho8_"R" ab16_"R" ab_"L" ho_"R" ab_"L" ab_"R" ab_"L" |
    ho8_"R" ab16_"R" ab_"L" ho_"R" ab_"L" ab_"R" ab_"L" |
    ho8_"R" ab16_"R" ab_"L" ho_"R" ab_"L" ab_"R" ab_"L" |
    ho8_"R" ab16_"R" ab_"L" ho_"R" ab_"L" ab_"R" ab_"L" |
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
      r1
      \repeat volta 2 {
        \Tren
        \Tren
      }
    }

    \new DrumStaff \with {
      \override StaffSymbol.line-count = #1
      instrumentName = "Cua"
      drumStyleTable = #percussion-style
    } {
      \GuembeCua
    }

    \new DrumStaff \with {
      \override StaffSymbol.line-count = #4
      instrumentName = "Barril "
      drumStyleTable = #(alist->hash-table barril-style)
      % drumPitchTable = #(alist->hash-table midiDrumPitches)
    } {
      \new DrumVoice = "sica" { \GuembeBarril }
    }
  >>

  \layout {}
}


