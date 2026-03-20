\version "2.24.3"

\header {
  title = "Talia's Bridges Composition 2"
  composer = "Talia Martin"
  tagline = ""
}

\paper {
  left-margin = 1\in
  right-margin = 1\in
  indent = 0
}

#(set-global-staff-size 29)

upperA = \relative c'' {
  \clef treble
  \time 4/4

  \repeat volta 2 {
    r4 b8-2 a b8. d16( d4) |
    r4 b8 a b4 d |
    e4. d8 d2 |

    \tuplet 3/2 { e4 d4 c4 } b2 |

    c2 b2 | a4 d4^\markup { \circle 3 }( d2) |
  }

  e2 f | e2 d | d4..\fermata e16(e2 ) |

  \bar "|."
}

% Bass clef
lowerA = \relative c' {
  \clef bass
  \time 4/4

  \repeat volta 2 {
    g2.-5( g8.) g16( | g1) |
    c2 g | c g |
    a4 b c2 |
    d4.. d,16 d2 |
  }

  c'2 d | c b | c1 |

  \bar "|."
}

upperB = \relative c' {
  <<
    {
      \voiceOne
      s2 s4 r8 c'8(| c1)
    }
    \\
    {
      \voiceThree
      s2 r8 f,4.( | f1)
    }
    \\
    {
      \voiceFour
      r4 r8 d8(d2)( | d1) |
    }
  >>
}

lowerB = \relative c' {
  <<
    {
      \voiceOne
      r4 c2.( | c1)
    }
    \\
    {
      \voiceTwo
      d,1( | d1)
    }
  >>
}

\score {
  \new PianoStaff <<
    \new Staff = "upper" { \upperA \upperB }
    \new Staff = "lower" { \lowerA \lowerB }
  >>
  \layout { }
}
