
\markup {
  \bold "Sicá Improvisations (exercises)"
}

SicaBarril = \drummode {
  \repeat volta 2 { ho8._"R" ab16_"L" r ab_"L" ab_"R" r | }

  \repeat volta 2 {
    se8.->_"R" ab16_"L" r ab_"L" ab_"R" r | 
    ho8._"R" ab16_"L" r ab_"L" ab_"R" r |
  }

  \repeat volta 2 {
    se8.->_"R" ab16_"L" r ab_"L" ab_"R" r | 
  }

  \repeat volta 2 { se8.->_"R" ab16_"L" se8.->_"R" ab16_"L" | }
  \repeat volta 2 { se8->_"R" se16->_"R" ab16_"L" r ab_"L" ab_"R" r | }

  \repeat volta 2 { ho16_"R"[ se16->_"L" r16 ab16_"L"] r ab_"L" ab_"R" r | }

  \repeat volta 2 { ab16_"R" ab16_"L" ab16_"R" ab16_"L" se8->_"R" r8 | }

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


