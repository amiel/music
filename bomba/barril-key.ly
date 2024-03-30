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

  ca^\markup \rotate #45 {campana}
  se^\markup \rotate #45 {seco}
  ab^\markup \rotate #45 {abierto}
  ho^\markup \rotate #45 {hondo}
}

\score {

  \new DrumStaff \with {
    \override StaffSymbol.line-count = #4
    % instrumentName = "Barril "

    instrumentName = \barrilInstrument

    drumStyleTable = #(alist->hash-table barril-style)

      % \override TextScript.outside-staff-priority = ##f  % Ensures that text appears inside the staff


   % %  % TODO: Make this better
   %  \override Clef.stencil = #
			% (lambda (grob)(grob-interpret-markup grob
			% 	#{ \markup \combine
			% 		\musicglyph #"clefs.percussion"

			% 		\override #'(baseline-skip . 1) 
			% 		\translate #'(-2 . 1.2)
			% 		\column {
   %          \teeny {
   %            \line { "C" }
   %            \line { "S" }
   %            \line { "A" }
   %            \line { "H" }
   %          }
			% 		}
			% 	#}
			% ))
  }


 \KeyNotes

  \layout {}
}


