

rhythm = \relative c' {
  \set Score.markFormatter = #format-mark-circle-letters
  \set Staff.instrumentName = #"Rhythm"
  \clef percussion
  \override Stem #'direction = #down

  \improvisationOn

  \mark \markup { \box "A" }

  \repeat volta 3 {

    r8 g8 r8 g8 r8 g8 g4 |
    r8 g8 r8 g8 r8 g8 g4 |
    c4. c8 c4. c8 |
    r8 g8 r8 g8 r8 g8 g4 |

    r8 g8 r8 g8 r8 g8 g4 |
    r8 g8 r8 g8 r8 g8 c4 ~ |
    c1 |
  }

  \alternative {
    { d2 d4 r4 | }
    { r2 r4 d4 | }
    {
      \time 2/4
      r2 |
      \time 4/4

      g4 g g g8 d |
      g4 g g g4 |
    }
  }

  \mark \markup { \box "B" }

  \repeat volta 4 {
    \repeat percent 2 {
      r8 g8 r8 g8 r8 g8 g4 |
    }
    r8 g8 r8 g8 r8 g8 g4 |
  }

  \alternative {
    { r8 g8 r8 g8 r8 g8 g4 |}
    { g4 r8 ees'8-> d4.-> r8 |}
  }


  \mark \markup { \box "C" }

  \repeat volta 2 {
    \repeat unfold 2 { % unfold
      c4 c c c8 c |
      c8 c c c c c c c |
    }

    c4 c c c8 c |
    c8 c c c c c c c |

    c4 c c c8 c |
  }

  \alternative {
    { c8 c c c c c c c |}
    { c1 |}
  }


}
