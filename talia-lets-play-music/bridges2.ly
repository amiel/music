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

upperA = \relative c' {
  \clef treble

  R1 |

  \repeat volta 2 {
    d2 a' |
    a8 g f g a2 |

  } \alternative {
    { c,2 g' | g8 f e f g2 | }
    { g2 f | e d | }
  }

}

upperB = \relative c'' {

  \repeat volta 2 {
    r4 b8-2 a b8. d16( d4) |
    r4 b8 a b4 d |
    e4. d8 d2 |

    \tuplet 3/2 { e4 d4 c4 } b2 |

    c2 b2 | a4 d4^\markup { \circle 3 }( d2) |
  }

  e2 f | e2 d | d4..\fermata e16(e2 ) |

}

upperC = \relative c' {

  \bar "||"

  \repeat unfold 4 { e8 g } |
  e8 g e g e4 d |
  \repeat unfold 4 { e8 g } |
  e8 g e d e4 d |

  \repeat unfold 4 { e8 g } |
  f8 a f a f e d c |

  \repeat unfold 4 { e8 g } |
  e8 d d c d e d4 |

  \bar "||"
}


lowerA = \relative c {
  \clef bass

  \repeat unfold 4 { d8 a' } |

  \repeat volta 2 {
    \repeat unfold 4 { d,8 a' } |
    \repeat unfold 4 { d,8 a' } |

  } \alternative {
    { \repeat unfold 4 { c,8 g' } | \repeat unfold 4 { c,8 g' } | }
    { \repeat unfold 4 { c,8 g' } | \repeat unfold 4 { c,8 g' } | }
  }
}

lowerB = \relative c' {

  \repeat volta 2 {
    g2.-5( g8.) g16( | g1) |
    c2 g | c g |
    a4 b c2 |
    d4.. d,16 d2 |
  }

  c'2 d | c b | c1 |

  \bar "||"
}

lowerC = \relative c {
  \bar "||"

  c8 g' e g c, g' e g |
  a,8 e' c e a, e' c e |

  c8 g' e g c, g' e g |
  a,8 e' c e a, e' c e |

  c8 g' e g c, g' e g |
  c,8 a' f a c, a' f a |
  c,8 g' e g c, g' e g |
  b, g' d g b, g' d g |

  \bar "||"
}


\score {
  \new PianoStaff <<
    \new Staff = "upper" {
      \time 4/4
      \upperA \upperB \upperA \upperC \upperA
    }
    \new Staff = "lower" {
      \time 4/4
      \lowerA \lowerB \lowerA \lowerC \lowerA
    }
  >>
  \layout { }
}
