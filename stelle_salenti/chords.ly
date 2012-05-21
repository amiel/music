chordnames = \chordmode {
  \set chordChanges = ##t

  \mark "A"

  \repeat volta 3 {
    g1:m |
    g1:m |
    c1:m |
    d1 |

    g1:m |
    g2.:m c4:m |
    c1:m |
  }

  \alternative {
    { d1 | }
    {
      \set chordChanges = ##f
      d1 |
      \set chordChanges = ##t
    }

    {
      \set Score.measureLength = #(ly:make-moment 2 4) g2:m |
      \set Score.measureLength = #(ly:make-moment 4 4)

      g1:m |
      g1:m |
    }
  }

  \mark "B"

  \repeat volta 4 {
    g1:m |
    g1:m |
    c1:m |
    d1 |
  }

  \mark "C"

  \repeat volta 2 {
    c1 |
    c1:m |
    c1 |
    c1:m |
    c1 |
    c1:m |
  }

  \alternative {
    { c1 | c1:m |}
    { c1 | c1:m |}
  }


}
