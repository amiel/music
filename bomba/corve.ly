
\markup {
  \bold "Corve"
}

CorveBarril = \drummode {
  seco8_"R"^\markup {primo} se se se se r |
  ab8^\markup {buleador} ab ab ab ab-> ab-> |


  \repeat volta 2 {
    se8 se se se8 ab ab |
    se8 se se se8 ab ab |
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
      \CorveBarril
    }
  >>

  \layout {}
}


