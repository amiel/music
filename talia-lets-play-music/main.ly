\version "2.24.3"

\header {
  title = "Talia's Let's Play Music Composition"
}

aMelody = \relative c' {
  e4 e16 d c g~ g4. g8 |
  f'8 f f f f16 e8 c16~ c4 |
  f8 f f f f16 e8 g16~ g4 |
  <c, e g>1 |
}

bMelody = \relative c'' {
  a4   a     a   a  |
  a8 b c  d  e4  e  |
  e8 d e4 e8 c   e4 |
  e8 d c  b  a b a4 |
  a8 c a4 a2~       |
  <a cis>2~ <a cis e>|
}

bBass = \relative c {
  a4 a a a |
  a4 a a a |
  a4 a a a |
  a4 a a a |
  a4 a a2~ |
  <a cis>2~ <a cis e>|
}

aBass = \relative c {
  <c e g>4 <c e g> <b d g> <b d g> |
  <c f a> <c f a> <c f a> <c e g> |
  <b d g> <b d g> <b d g> <c f a> |
  <c e g>1 |
}

\score {
  \new PianoStaff <<
    \new Staff {
      \key c \major
      \time 4/4

      \aMelody

      \bar "||"

      \key a \minor

      \bMelody
    }
    \new Staff { % Left hand chords
      \clef "bass"
      \key c \major
      \time 4/4

      \aBass
      
      \bar "||"

      \key a \minor

      \bBass
    }
  >>
  \layout { }
  \midi { }
}
