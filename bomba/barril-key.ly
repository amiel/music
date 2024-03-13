\version "2.24.3"

% barril-key.ly
% a staff that shows each of the barril notes with a label

\markup { 
  \bold "Key"
}

KeyNotes = \drummode {
  \time 5/4

  \omit Staff.TimeSignature

  \textLengthOn

  ho^\markup \rotate #45 {hondo}
  ab^\markup \rotate #45 {abierto}
  se^\markup \rotate #45 {seco}
  se->^\markup \rotate #45 {slap}
  ca^\markup \rotate #45 {campana}
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


