\version "2.24.3"

% cgl  = abierto
% cglo = hondo
% cglm = seco
% ssl  = campana

% cgl  = abierto
% cglo = hondo
% cglm = seco
% ssl  = campana




% mus = \drummode { cgh cgho cghm ssh cgl cglo cglm ssl s16 }

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
  '((abierto  default  #f         0)
    (seco     default  stopped 0)
    (hondo    default  open        0)
    (campana  cross    #f        0)
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

  ho^\markup \rotate #35 {hondo}
  ab^\markup \rotate #35 {abierto}
  se^\markup \rotate #35 {seco}
  ca^\markup \rotate #35 {campana}
}


\header { 
  title = "Bomba"
}


\markup { 
  \bold "Key"
}

\score {

  \new DrumStaff \with {
    \override StaffSymbol.line-count = #1
    instrumentName = "Barril "
    drumStyleTable = #(alist->hash-table barril-style)
  } \KeyNotes
  \layout {}
}

Maraca = \drummode {
  cab16-> cab cab cab
  cab16-> cab cab cab
  cab16-> cab cab cab
  cab16-> cab cab cab |
}

Barril = \drummode {
 ho8. ab16 r ab ab r
 ho8. ab16 r ab ab r |
}

Qua = \drummode {
  ss8
}

\markup { 
  \bold "Sicá"
}

\score {
  <<
    \new DrumStaff \with {
      \override StaffSymbol.line-count = #1
      instrumentName = "Maraca "
      drumStyleTable = #percussion-style
    } {
      \time 4/4
      \Maraca
    }

    \new DrumStaff \with {
      \override StaffSymbol.line-count = #1
      instrumentName = "Barril "
      drumStyleTable = #(alist->hash-table barril-style)
      % drumPitchTable = #(alist->hash-table midiDrumPitches)
    } {
      \time 4/4
      \Barril
    }

    \new DrumStaff \with {
      \override StaffSymbol.line-count = #1
      instrumentName = "Qua "
      drumStyleTable = #percussion-style
      % drumPitchTable = #(alist->hash-table midiDrumPitches)
    } {
      \time 4/4
      \Qua
    }
  >>

  \layout {}
}
