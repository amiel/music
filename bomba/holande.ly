
\markup {
  \bold "Holandé (Mayagüez)"
}

HolandeTren = \drummode {
  r1 |

  \repeat volta 2 {
    cab16-> cab cab cab
    cab16-> cab cab cab
    cab16-> cab cab cab
    cab16-> cab cab cab |

    cab16-> cab cab cab
    cab16-> cab cab cab
    cab16-> cab cab cab
    cab16-> cab cab cab |
  }
}


HolandeCua = \drummode {
  r1 |
  cab16-> cab cab cab 
  cab16-> cab cab cab 
  cab16-> cab cab cab 
  cab16-> cab cab cab^" or" |

  cab8-> cab16 cab 
  cab8-> cab16 cab 
  cab16-> cab8 cab16
  cab8-> cab16 cab |
}

HolandeBarril = \drummode {
  \afterGrace s2 { seco32 se se se }
  seco8._"R" ^\markup {primo} se16_"R" 
  r8 ab8_"R" ^\markup {buleador} |

  \repeat volta 2 {
    ho8_"L" ab_"R" ho8_"L" ab_"R"
    ho16_"L" ab8_"R" ab16_"R"
    ho8_"L" ab_"R" |

    ho8_"L" ab_"R" ho8_"L" ab_"R"
    ho16_"L" ab8_"R" ab16_"R"
    ho8_"L" ab_"R" |
 }
}

\score {
  <<
    \time 4/4
    \new DrumStaff \with {
      \override StaffSymbol.line-count = #1
      instrumentName = "Maraca"
      drumStyleTable = #percussion-style
    } {
      \HolandeTren
    }

    \new DrumStaff \with {
      \override StaffSymbol.line-count = #1
      instrumentName = "Cua"
      drumStyleTable = #percussion-style
    } {
      \HolandeCua
    }

    \new DrumStaff \with {
      \override StaffSymbol.line-count = #4
      instrumentName = \barrilInstrument
      drumStyleTable = #(alist->hash-table barril-style)
      % drumPitchTable = #(alist->hash-table midiDrumPitches)
    } {
      \new DrumVoice = "sica" { \HolandeBarril }
    }
  >>

  \layout {}
}


