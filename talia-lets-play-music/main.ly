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
  \tempo \markup { \smaller \italic faster }

  a8   a     a   a  
  a16 b c  d  e8  e  |
  e16 d e8 e16 c   e8 
  e16 d c  b  a b a8 |
  a16 c a8 a4~        
  <a cis>4~ <a cis e> |
  <a cis e>1 |
}

cMelody = \relative c'' {
  \tempo \markup { \smaller \italic slowly }

  b8 a fis c 
  f2 |
  b8 a fis c 
  f2 |

  b8 a fis c 
  f2 |
  b8 a fis c 
  f2 |
}

aBass = \relative c {
  <c e g>4 <c e g> <b d g> <b d g> |
  <c f a> <c f a> <c f a> <c e g> |
  <b d g> <b d g> <b d g> <c f a> |
  <c e g>1 |
}

bBass = \relative c {
  a8 a a a
  a8 a a a |
  a8 a a a
  a8 a a a |
  a8 a a4~ 
  <a cis>4~ <a cis e> |
  <a cis e>1
}

cBass = \relative {
  <d fis a>4 <d fis a> 
  <d f  a>4 <d f   a> |
  <d fis a>4 <d fis a> 
  <d f  a>4 <d f   a> |
  <d fis a>4 <d fis a> 
  <d f  a>4 <d f   a> |
  <d fis a>4 <d fis a> 
  <d f  a>2           |

}


\score {
  \new PianoStaff <<
    \new Staff {

      \override BreathingSign.text = \markup {
        \musicglyph "scripts.caesura.straight"
      }

      \key c \major
      \time 4/4
      \mark "A"
      \aMelody

      \breathe
      \bar "||"

      \key a \minor
      \mark "B"
      \bMelody

      \breathe
      \bar "||"

      \mark "C"
      \cMelody

      \breathe
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
