\version "2.24.3"


\header {
  title = "Talia's Composition"
}

#(set-global-staff-size 26)

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

cMelody = \relative c'' {
  b4. a8 fis4. c8 |
  f?1 |
  b4. a8 fis4. c8 |
  f?1 |
}

aBass = \relative c {
  <c e g>4 <c e g> <b d g> <b d g> |
  <c f a> <c f a> <c f a> <c e g> |
  <b d g> <b d g> <b d g> <c f a> |
  <c e g>1 |
}

bBass = \relative c {
  a4 a a a |
  a4 a a a |
  a4 a a a |
  a4 a a a |
  a4 a a2~ |
  <a cis>2~ <a cis e>|
}

cBass = \relative {
  <d fis a>2 <d fis a> |
  <d f?  a>2 <d f   a> |
  <d fis a>2 <d fis a> |
  <d f?  a>1           |
}


\score {
  \new PianoStaff <<
    \new Staff {


      \key c \major
      \time 4/4
      \mark "A"
      \aMelody

      \bar "||"

      \key a \minor
      \mark "B"
      \bMelody

      \bar "||"

      \mark "C"
      \cMelody

      \bar "||"

      \key c \major
      \mark "A"
      \aMelody

      \bar "|."
    }
    \new Staff { % Left hand chords
      \clef "bass"
      \key c \major
      \time 4/4

      \aBass
      
      \bar "||"

      \key a \minor

      \bBass

      \bar "||"

      \cBass

      \bar "||"

      \key c \major
      \aBass
    }
  >>
  \layout { }
  \midi { }
}
