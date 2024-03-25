
\markup {
  \bold "Seis Corrido (Loiza)"
}

SeisCorridoCua = \drummode {
  \appoggiatura cab16 cab8 r8 \appoggiatura cab16 cab8 r |
  \appoggiatura cab16 cab8 r8 \appoggiatura cab16 cab8 r |
}

SeisCorridoBarril = \drummode {
  ho8_"R" ^\markup {primo} ab_"R" ho_"R" ab_"R" |
  ho8_"R" ^\markup {buleador} ab_"R" ho_"R" ab_"R" |

  \repeat volta 2 {
    \grace s16 % Fix grace note spacing from cua part

    ho16_"R" ab16_"L" ab_"R" ab16_"L" ho8_"R" ab_"R" |
    ho16_"R" ab16_"L" ab_"R" ab16_"L" ho8_"R" ab_"R" |
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
      r2 | r |
 
      \Tren
    }

    \new DrumStaff \with {
      \override StaffSymbol.line-count = #1
      instrumentName = "Cua"
      drumStyleTable = #percussion-style
    } {
      r2 | r |

      \SeisCorridoCua
    }


    \new DrumStaff \with {
      \override StaffSymbol.line-count = #4
      instrumentName = \barrilInstrument
      drumStyleTable = #(alist->hash-table barril-style)
      % drumPitchTable = #(alist->hash-table midiDrumPitches)
    } {
      \new DrumVoice = "sica" { \SeisCorridoBarril }
    }
  >>

  \layout {}
}



