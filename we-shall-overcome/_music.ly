Chords = \chordmode {
  \repeat unfold 2 { c2 f | c1 | }
  c2 f4 g | a2:m d | g2 d/g | g2
  d4 g:7 | c2 f | c1 |
  f2 g4 \parenthesize gis:dim7 | a1:m |
  c2:7 f2 | c2 g:7 | c1 |
}

SopranoMusic = \relative c'' {
  \key c \major

  \repeat unfold 2 { g4 g a a | g4. f8 e2 | }
  g4 g a b | c2 d | b2 a | g2
  a4 b | c2 b4 a | g1 |
  a2 g4 f | e1 |
  g4^\markup { "*" } g c, f | e2 d | c1 | \bar "|."
}

AltoMusic = \relative c' {
  \key c \major

  \repeat unfold 2 { e4 e f f | e1 | }
  e4 e f f e2 fis | g fis | g2
  fis4 g | g2 f4 f | e1 |
  f2 d4 d | c1 |
  e4^\markup { "*" } e c c | c2 b | c1 | \bar "|."
}

TenorMusic = \relative c' {
  \key c \major

  \repeat unfold 2 { c4 c c c | c1 | }
  c4 c c b | a2 a | g d' | d2
 
  d4 d | c2 c4 c | c1 |
  c2 b4 b | c1 |
  c4^\markup { "*" } bes a a | g2 f |
  e1  \bar "|."
}

BassMusic = \relative {
  \key c \major

  \repeat unfold 2 { c2 f | c1 | }
  c2 f4 g | a2 d,2 | g g | g2 
  d4 f | e2 f | c1 |
  f2 g4 gis | a1 |
  g2^\markup { "*" } f | c g' | c,1 \bar "|."
}


