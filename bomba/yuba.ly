
\markup {
  \bold "Yubá (Santurce)"
}

YubaBarril = \drummode {
  seco8_"R"^\markup {primo} se_"L" se_"R" se_"L" se_"R" r |
  ab8_"R"^\markup {buleador} ab_"L" ab_"R" ab_"L" ab_"R" r |

  \repeat volta 2 {
    ho8-"R"[ r ab_"R"] ab_"L" ab_"R" r |
    ho8_"R"[ r ab_"R"] ab_"L" ab_"R" r |
 }
}

\score {
  <<
    \new DrumStaff \with {
      \override StaffSymbol.line-count = #1
      instrumentName = "Maraca/Cua"
      drumStyleTable = #percussion-style
    } {
      \time 6/8
      \SixTren
    }

    \new DrumStaff \with {
      \override StaffSymbol.line-count = #4
      instrumentName = "Barril "
      drumStyleTable = #(alist->hash-table barril-style)
      % drumPitchTable = #(alist->hash-table midiDrumPitches)
    } {
      \time 6/8
      \YubaBarril
    }
  >>

  \layout {}
}


