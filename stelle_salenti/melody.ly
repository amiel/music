
melody = \relative c'' {
  \set Staff.instrumentName = #"Melody"
  \key g \minor

  \mark "A"

  \repeat volta 2 {
    \times 2/3 { g4 bes d8 g } bes a g fis |
    g4 f?8 ees d bes g4 |
    r8 c4 c d bes8 ~ |
    bes4 a8 g a bes d4 |

    \grace { a8 }
    \times 2/3 { g4 bes d8 g } bes a g fis |
    g4 f?8 ees d bes c4~ |
    c4. d8 ees4
    \acciaccatura { c16[ bes] }
    a8 g |
  }

  \alternative {
    { f?8 g a bes g2 | }
    { f?8 g a bes g2 | }
  }


  \improvisationOn


}