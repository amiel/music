\version "2.24.3"

% \score {
%   <<
%   \new DrumStaff \with {
%     drumStyleTable = #congas-style

%   } \Maraca

%   \new DrumStaff \with {
%     drumStyleTable = #congas-style

%     \override StaffSymbol.line-count = #1
%   } \Barril

%   >>
%   \layout { }
% }



drumPitchNames.seco      = #'seco
drumPitchNames.se        = #'seco
drumPitchNames.abierto   = #'abierto
drumPitchNames.ab        = #'abierto
drumPitchNames.hondo     = #'hondo
drumPitchNames.ho        = #'hondo
drumPitchNames.campana   = #'campana
drumPitchNames.ca        = #'campana

% List of note head options
% List of articulation options: https://lilypond.org/doc/v2.23/Documentation/notation/list-of-articulations
#(define barril-style
  '((abierto  default  #f  -1)
    (seco     default  #f   1)
    (hondo    default  #f  -3)
    (campana  default  #f   3)
    ))

% midiDrumPitches.dbass     = g
% midiDrumPitches.dbassmute = fis
% midiDrumPitches.dopen     = a
% midiDrumPitches.dopenmute = gis
% midiDrumPitches.dslap     = b
% midiDrumPitches.dslapmute = ais



% Cua = \drummode {
% }

KeyNotes = \drummode {
  \textLengthOn

  ho^\markup \rotate #45 {hondo}
  ab^\markup \rotate #45 {abierto}
  se^\markup \rotate #45 {seco}
  ca^\markup \rotate #45 {campana}
}


\header { 
  title = "Bomba Rhythms"
}

\markup { 
  \bold "Key"
}

\score {

  \new DrumStaff \with {
    \override StaffSymbol.line-count = #4
    instrumentName = "Barril "
    drumStyleTable = #(alist->hash-table barril-style)

   %  % TODO: Make this better
   %  \override Clef.stencil = #
			% (lambda (grob)(grob-interpret-markup grob
			% 	#{ \markup\combine
			% 		\musicglyph #"clefs.percussion"
			% 		\translate #'(-2 . 1)
			% 		\override #'(baseline-skip . 1) 
			% 		\column {
			% 		  "c"
   %          "s"
   %          "a"
			% 		  "h"
			% 		}
			% 	#}
			% ))

  } \KeyNotes
  \layout {}
}

Tren = \drummode {
  cab16-> cab cab cab
  cab16-> cab cab cab |
  cab16-> cab cab cab
  cab16-> cab cab cab |
}


\markup {
  \bold "Sicá (Santurce)"
}

SicaBarril = \drummode {
  seco8_"R" ^\markup {primo} se_"R" se_"R" se_"R" |
  
  ab8_"R" ^\markup {buleador} ab16_"R" ab_"L" r ab_"L" ab_"R" r |

  \repeat volta 2 {
   ho8._"R" ab16_"L" r ab_"L" ab_"R" r |
   ho8._"R" ab16_"L" r ab_"L" ab_"R" r |
 }
}

SicaWords = \lyricmode {
  % llamada
  _ _ _ _ |
  _ _ _ _ _ |

  _ ca -- fe con pan 
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
      \new DrumVoice = "sica" { \SicaBarril }
    }

    \new Lyrics {
      \lyricsto "sica" {
        \SicaWords
      }
    }
  >>

  \layout {}
}



\markup {
  \bold "Yubá (Santurce)"
}

SixTren = \drummode {
  r2. r

  \repeat volta 2 {
    cab8-> cab cab cab8 cab cab |
    cab8-> cab cab cab8 cab cab |
  }
}


YubaBarril = \drummode {
  seco8_"R"^\markup {primo} se_"L" se_"R" se_"L" se_"R" r |
  ab8_"R"^\markup {buleador} ab_"L" ab_"R" ab_"L" ab_"R" r |

  \repeat volta 2 {
    ho8-"R" r ab_"R" ab_"L" ab_"R" r |
    ho8_"R" r ab_"R" ab_"L" ab_"R" r |
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
      instrumentName = "Barril "
      drumStyleTable = #(alist->hash-table barril-style)
      % drumPitchTable = #(alist->hash-table midiDrumPitches)
    } {
      \new DrumVoice = "sica" { \HolandeBarril }
    }
  >>

  \layout {}
}



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
      instrumentName = "Barril "
      drumStyleTable = #(alist->hash-table barril-style)
      % drumPitchTable = #(alist->hash-table midiDrumPitches)
    } {
      \new DrumVoice = "sica" { \HoyomulaBarril }
    }
  >>

  \layout {}
}


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
      instrumentName = "Barril "
      drumStyleTable = #(alist->hash-table barril-style)
      % drumPitchTable = #(alist->hash-table midiDrumPitches)
    } {
      \new DrumVoice = "sica" { \CunyaBarril }
    }
  >>

  \layout {}
}




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



