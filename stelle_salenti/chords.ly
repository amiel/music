chordnames = \chordmode {
  \set Score.markFormatter = #format-mark-circle-letters
  \set chordChanges = ##t

  \mark \markup { \box "A" }

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
    { f2:m7 g2 | }
    {
      \set chordChanges = ##f
      f1:m7 |
      \set chordChanges = ##t
    }

    {
      \time 2/4
      f2:m7 |
      \time 4/4

      g1:m |
      g1:m |
    }
  }

  \mark \markup { \box "B" }

  \repeat volta 4 {
    \set chordChanges = ##f
    g1:m |
    \set chordChanges = ##t

    g1:m |
    c1:m |
  }

  \alternative {
    { d1 |}
    { d1 |}
  }

  \mark \markup { \box "C" }

  \repeat volta 2 {
    c1 |
    c1:m |
    c1 |
    c1:m |
    c1 |
    c1:m |
    c1 |
  }

  \alternative {
    { c1:m |}
    {
      \set chordChanges = ##f
      c1:m |
      \set chordChanges = ##t
    }
  }


}
