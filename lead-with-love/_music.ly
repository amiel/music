Chords = \chordmode {
}

MelodyMusic = \relative c'' {
  \key c \minor

  \partial 8*5 c8 c c ees4 |

  g4 g8 g g g f g( | g) ees4. r8 c4. |
  ees2 f4. g8 | r4 c2 r4 | % \break

  g4 g8 g g g f g( | g) ees4. r8 c4. |
  ees2 d4. c8( | c4 )

}

CounterMelodyMusic = \relative c' {
  \key c \minor

  \partial 8*5 r8 r4 r4 |


  bes4 ^\markup { \italic { first time tacet } } c r8 bes4 c8 |
  r8 c4 ees8 r4 c |
  ees1( | ees8) f4 ees8 d c bes4 |
  bes4 c r8 bes4 c8 |
  r8 c4 ees8 r4 c |
  bes2 b4. c8(| c4 )
 
}

BassMusic = \relative {
  \key c \minor


  \partial 8*5 r8 r4 r4 |

  c2 d | ees f | g aes | g4 f ees d |
  c2 d | ees f | g4 r g c,( | c4 )
}
