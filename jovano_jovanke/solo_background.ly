\header{
  filename = "test.ly"
%   composer          = "Amiel Martin"
  title             = "Jovano Jovanke"
  subtitle          = "Solo background part"

  copyright         = "Creative Commons Attribution-ShareAlike 2.5"
  maintainer        = "Amiel Martin"
  lastupdated       = "2011/10/20"
}

\version "2.8.6"

chordnames = \chordmode {
  % A
  e2..     |
  e        |
  e        |
  d4.:m e2 |

  e2..     |
  e        |
  e4. d2:m |
  e2..     |

  % B
  e4. d2:m |
  e2..     |
  e        |

  e4. d2:m |
  e2..     |
  e        |

  e4. d2:m |
  e2..     |
  e        |

  % C
  a2..:m   |
  a4.:m d2:m |
  g2..     |
  g4. c2   |

  a2..:m   |
  d2..:m   |
  f2..     |
  e4. d2:m |

  e2..     |

}

%   \autoBeamOn
%   \set Staff.beatGrouping = #'(3 2 2)

rhythmpart = \relative c' {
  \set Staff.instrumentName = #"Rhythm"
  \clef percussion

  % A
  e8 r r  r4   r4     |
  r4.     r4   r4     |
  e8 r r  r4   r4     |
  d8 r r  e8[r e8] r  |

  r4.     e8[r e8] r  |
  r4.     r4   r4     |
  e8 r r  b8[r d8] r  |
  e8 r r  r4   r4     |



}

bass = \relative c {
  \set Staff.instrumentName = #"Bass"
  \clef bass

  % A
  e4. b4 d4 |
  e4. b4 d4 |
  e4. b4 d4 |
  d4. b4 d4 |

  e4. b4 d4 |
  e4. b4 d4 |
  e4. d4 d4 |
  e4. b4 d4 |

  % B
  e4. d4 d4 |
  e4. b4 d4 |
  e4. b4 d4 |

  e4. d4 d4 |
  e4. b4 d4 |
  e4. b4 d4 |

  e4. d4 d4 |
  e4. b4 d4 |
  e4. b4 d4 |

  % C
}



\score {
  <<
    \time 7/8

    \new ChordNames {
      \set chordChanges = ##t
      \chordnames
    }
    \new RhythmicStaff = "rhythm" \rhythmpart
    \new Staff = "Bass" \bass
  >>
}