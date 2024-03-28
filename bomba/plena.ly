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
drumPitchNames.ssla      = #'seguidorslap


#(define plena-style '(
         (clave           diamond   #f   3)
         (requintoopen    default   #f   1)
         (requintoslap    cross     #f   1)
         (punteadoropen   default   #f  -1)
         (punteadorslap   cross     #f  -1)
         (seguidoropen    default   #f  -3)
         (seguidorslap    cross     #f  -3)
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


\new DrumStaff \with { drumStyleTable = #(alist->hash-table plena-style) }
  <<
    \new DrumVoice { \voiceOne \clave }
    \new DrumVoice { \voiceTwo \requinto }
    \new DrumVoice { \voiceThree \punteador }
    \new DrumVoice { \voiceFour \seguidor }
  >>
