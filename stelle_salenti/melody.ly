
melody = \relative c'' {
  \set Staff.instrumentName = #"Melody"

  \key g \minor


  \mark \markup { \box "A" }

  \repeat volta 3 {
    \times 2/3 { g4 bes d8 g } bes a g fis |
    g4 f?8 ees d bes g4 |
    r8 c4 c d bes8 ~ |
    bes4 a8 g a bes d4 |

    \grace { a8 }
    \times 2/3 { g4 bes d8 g } bes a g fis |
    g4 f?8 ees d bes c4~ |
    c4. d8 ees4
    \acciaccatura { d16[ c] }
    bes8 g |
  }

  \alternative {
    {
      f?8 g a bes g2^\markup { \italic fin } |
    }
    {

      f8 g a

      bes^\markup { to \box B } g2 |
      \bar "|."
    }
    {
      \time 2/4
      f8[ g a bes] |
      \time 4/4
      g2 r2 |

      r1^\markup { to \box C } |
    }
  }

  \mark \markup { \box "B" }

  \improvisationOn
  \repeat volta 4 {
    s1 ^"Improv" | s1 | s1 |
  }
  \alternative {
    { s1 |}
    { s1 |}
  }

  \improvisationOff


  \mark \markup { \box "C" }

  \repeat volta 2 {
    \repeat percent 2 {
      \times 2/3 { e'4 f g } e d8 c |
      ees?1 |
    }

    \times 2/3 { e4 f g } e d8 c |
    ees?4 f8 g ees4 d8 c |

    r8 e4 f16 g e4 d8 c |
  }

  \alternative {
    { ees?1 | }
    { c1^\markup { to \box A } | }
  }

  \bar "|."
}