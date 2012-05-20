chordnames = \chordmode {
  \set chordChanges = ##t

  \repeat volta 2 {
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
  }

  \repeat volta 4 {
    g1:m |
    g1:m |
    c1:m |
    d1 |
  }


}
