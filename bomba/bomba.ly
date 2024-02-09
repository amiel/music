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



% Qua = \drummode {
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
  r2 r

  \repeat volta 2 {
    cab16-> cab cab cab
    cab16-> cab cab cab |
    cab16-> cab cab cab
    cab16-> cab cab cab |
  }
}

SicaBarril = \drummode {
  seco8_"R" ^\markup {primo} se_"R" se_"R" se_"R" |
  
  ab8_"R" ^\markup {buleador} ab16_"R" ab_"L" r ab_"L" ab_"R" r |

  \repeat volta 2 {
   ho8._"R" ab16_"L" r ab_"L" ab_"R" r |
   ho8._"R" ab16_"L" r ab_"L" ab_"R" r |
 }
}

\markup { 
  \bold "Sicá"
}

\score {
  <<
    \new DrumStaff \with {
      \override StaffSymbol.line-count = #1
      instrumentName = "Maraca/Qua"
      drumStyleTable = #percussion-style
    } {
      \time 2/4
      \Tren
    }

    \new DrumStaff \with {
      \override StaffSymbol.line-count = #4
      instrumentName = "Barril "
      drumStyleTable = #(alist->hash-table barril-style)
      % drumPitchTable = #(alist->hash-table midiDrumPitches)
    } {
      \time 2/4
      \SicaBarril
    }
  >>

  \layout {}
}
