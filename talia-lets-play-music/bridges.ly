\version "2.24.3"

\header {
  title = "Talia's bridges composition"
  composer = "Talia Martin"
  tagline = ""
}

#(set-global-staff-size 32)

aMelody = \relative c' {
  \repeat unfold 4 { e8 g } |
  e8 g e g e4 d |
  \repeat unfold 4 { e8 g } |
  e8 g e d e4 d |
}

bMelody = \relative c' {
  \repeat unfold 4 { e8 g } |
  e8 g a g e d c4 |
  \repeat unfold 4 { e8 g } |
  e8 d d c d e d4 |
}

cMelody = \relative c'' {
  \repeat volta 2 { \repeat unfold 2 { c4 b a g | f e d c | } }
}

endingMelody = \relative c' {
  r4 

  \tuplet 3/2 { c8 e g }
  \tuplet 3/2 { c8 g e }
  \tuplet 3/2 { c8 r4 } |
  <c e g>1\arpeggio
}


aBass = \relative c {
  <c e g>1 |
  <a c e>1 |
  <c e g>1 |
  <a c e>1 |
}

bBass = \relative c {
  <c e g>1 |
  <c f a>1 |
  <c e g>1 |
  <b d g>1 |
}

cBass = \relative {
  <c e g>1 |
  <c e g>1 |
  <a c e>1 |
  <a c e>1 |
}

endingBass = \relative c {
  c8 g' e g c, g' e g |
  a,8 e' c e a, e' c e |
  c8 g' e g c, g' e g |
  a,8 e' c e a, e' c e |

  \tuplet 3/2 { c8 e g }
  r4 r4 
  \tuplet 3/2 { r8 g e } |

  <c e g>1\arpeggio
}

\score {
  \new PianoStaff <<
    \new Staff {
      \key c \major
      \time 4/4

      \aMelody \break
      \bMelody \break
      \aMelody \break

      \cMelody \break

      \aMelody \break
      \bMelody \break
      \aMelody \break
      \endingMelody

      \bar "|."
    }
    \new Staff { % Left hand chords
      \clef "bass"
      \key c \major
      \time 4/4

      \aBass
      \bBass
      \aBass

      \cBass

      \aBass
      \bBass
      \endingBass
    }
  >>
  \layout { }
  \midi { }
}
