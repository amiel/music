

rhythm = \relative c' {
  \set Staff.instrumentName = #"Rhythm"
  \clef percussion
  \override Stem #'direction = #down

  \improvisationOn

  % A

  \repeat volta 2 {

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
      \set Score.measureLength = #(ly:make-moment 2 4) r2 |
      \set Score.measureLength = #(ly:make-moment 4 4)

      g4 g g g8 d |
      g4 g g g8 d |
    }
  }

  % B

  \repeat volta 4 {
    r8 g8 r8 g8 r8 g8 g4 |
    r8 g8 r8 g8 r8 g8 g4 |
    r8 g8 r8 g8 r8 g8 g4 |
  }

  \alternative {
    { r8 g8 r8 g8 r8 g8 g4 | }
    { g4 r8 ees'8-> d4.-> r8 | }
  }


  \mark "C"

  c4 c c c8 c |
  c8 c c c c c c c |


}
