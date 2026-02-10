ChordsChoral = \chordmode {
  \repeat unfold 2 { c2 f | c1 | }
  c2 f4 g | a2:m d | g2 d/g | g2
  d4 g:7 | c2 f | c1 |
  f2 g4 \parenthesize gis:dim7 | a1:m |
  c2:7 f2 | c2 g:7 | c1 |
}

ChordsSecondLine = \chordmode {
  \repeat unfold 2 { c2 f | c1 | }
  c2 f4 g | a2:m d | g2 d/g | g2
  d4 g:7 | c2 f | c1 |
  f2 g4 gis:dim7 | a1:m |
  c2:7 f2 | c2 g:7 | c1 |
}

Chords = { \ChordsChoral \ChordsSecondLine }


SopranoChoral = \relative c'' {
  \key c \major

  \repeat unfold 2 { g4 g a a | g4. f8 e2 | }
  g4 g a b | c2 d | b2 a | g2
  a4 b | c2 b4 a | g1 |
  a2 g4 f | e1 |
  g4^\markup { "*" } g c, f | e2 d | c1 | % \bar "||"
}

SopranoSecondLine = \relative c'' {
  g4_\markup { \italic "Improvise" } g a a | g4. f8 e2 | 
  g4 g a a | g4. f8 e2 | 
  g4 g a b | c2 d | b2 a | g2
  a4 b | c2 b4 a | g1 |
  a2 g4 f | e1 |
  g4 g c, f | e2 d | c1 | \bar "|."
}

SopranoMusic = {
  \repeat volta 2 \SopranoChoral
  \break
  \SopranoSecondLine
}


AltoChoral = \relative c' {
  \key c \major

  \repeat unfold 2 { e4 e f f | e1 | }
  e4 e f f e2 fis | g fis | g2
  fis4 g | g2 f4 f | e1 |
  f2 d4 d | c1 |
  e4^\markup { "*" } e c c | c2 b | c1 | % \bar "||"
}

AltoSecondLine = \relative c' {
  %% e8. f16 e4 f8. g16 f4 | e4 d c e |
  %% e8. f16 e4 f8. g16 f4 | e4 d c2 |
  %% e4 e f g | a2 fis | g4. fis8 fis4 e8 fis | g2
  %% fis4 g | g4. f8 f4 e8 f | e4 d c e |
  %% f4. e8 d4 d | c4 d e2 |
  %% e4 d c c | c4. c8 b4. c8 | c1 | \bar "|."
}

AltoMusic = {
  \repeat volta 2 \AltoChoral
  \break
  \AltoSecondLine
}


TenorChoral = \relative c' {
  \key c \major

  \repeat unfold 2 { c4 c c c | c1 | }
  c4 c c b | a2 a | g d' | d2

  d4 d | c2 c4 c | c1 |
  c2 b4 b | c1 |
  c4^\markup { "*" } bes a a | g2 f | e1 | % \bar "||"
}

TenorSecondLine = \transpose c c, {
  \SopranoSecondLine
}

TenorMusic = {
  \repeat volta 2 \TenorChoral
  \break
  \TenorSecondLine
}


BassChoral = \relative {
  \key c \major

  \repeat unfold 2 { c2 f | c1 | }
  c2 f4 g | a2 d,2 | g g | g2
  d4 f | e2 f | c1 |
  f2 g4 gis | a1 |
  g2^\markup { "*" } f | c g' | c,1 | % \bar "||"
}

BassSecondLine = \relative {
  c4 e f a | g e c e |
  c4 e f a | g f e c |
  c4 e f g | a g d fis | g b a fis | g2
  d4 f | e g f a | g e c e |
  f4 a g gis | a g e a, |
  c4 e f a | c, e g b, | c1 | \bar "|."
}

BassMusic = {
  \repeat volta 2 \BassChoral
  \break
  \BassSecondLine
}
