\version "2.24.3"


\header { 
  title = "Plena"
}

drumPitchNames.clave   = #'clave
drumPitchNames.cl      = #'clave

drumPitchNames.ro      = #'requintoopen
drumPitchNames.rs      = #'requintoslap

drumPitchNames.po      = #'punteadoropen
drumPitchNames.ps      = #'punteadorslap

drumPitchNames.so      = #'seguidoropen
drumPitchNames.ssla    = #'seguidorslap


#(define plena-style '(
         (clave           diamond   #f   0)
         (requintoopen    default   #f   0)
         (requintoslap    cross     #f   0)
         (punteadoropen   default   #f   0)
         (punteadorslap   cross     #f   0)
         (seguidoropen    default   #f   0)
         (seguidorslap    cross     #f   0)
         ))

clave = \drummode {
  \partial 8 s8 |
  clave8. clave16 r8 clave8
  r8 clave8 clave 4 |
}

requinto = \drummode {
  \partial 8 ro8 |
  r8 rs r ro r16 rs r rs r8 ro |
}

punteador = \drummode {
  \partial 8 s8 |
  ps4 po8 po ps4 po8 po |
}

seguidor = \drummode {
  \partial 8 s8 |
  so ssla so ssla so ssla so ssla |
}

% drumStyleTable = #percussion-style

 	
\new StaffGroup <<
  \new DrumStaff \with {
    drumStyleTable = #(alist->hash-table plena-style)
    \override StaffSymbol.line-count = #1
  } \clave 

  \new DrumStaff \with {
    drumStyleTable = #(alist->hash-table plena-style)
    \override StaffSymbol.line-count = #1
  } \requinto


  \new DrumStaff \with {
    drumStyleTable = #(alist->hash-table plena-style)
    \override StaffSymbol.line-count = #1
  } \punteador

  \new DrumStaff \with {
    drumStyleTable = #(alist->hash-table plena-style)
    \override StaffSymbol.line-count = #1
  } \seguidor

>>

