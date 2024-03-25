\version "2.24.3"

% barril.ly
% staff style for Puerto Rican barril drum

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

barrilInstrument = \markup { 
  \translate #'(0 . -0.8)
  "Barril"

  \override #'(baseline-skip . 1) 
  \translate #'(-2 . 1.2)
  \column {
    \teeny {
      \line { "c" }
      \line { "s" }
      \line { "a" }
      \line { "h" }
    }
  }
}


