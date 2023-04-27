\version "2.22.2"


\header { 
  title = "Manha de Carnaval"
  subtitle = "Bari Sax"
}

% theChords = \chordmode {
%   \set noChordSymbol = ""

%   \partial 8 r8 |
%   c2 f2 | f2 c2 | f2 c2 | g1 |
%   f1 | c2 a2:m | f2 g2 | c1 |
% }


melody = \relative c' {
  \time 2/2
  \key a \major

  % \override Glissando.style = #'zigzag

  \repeat volta 3 {
    \repeat percent 2 { \bar ".|:" fis4. cis' cis,4 | }
    \repeat percent 2 {            gis'4. cis cis,4 | }
    \mark \markup {"3x"}
  }


  a'1 |
  b1 |
  cis2 b |
  ais fis |

  b4. fis' b,4 |
  a4. fis' a,4 |
  gis1\glissando |
  e2 r2 |

  a4. e' a,4 |
  gis4. e' gis,4 |
  fis1\glissando |
  d2 r2 |

  gis4. d' gis,4 |
  fis4. d' fis,4 |
  f1\glissando |
  cis2 r2 |

  fis4. cis' cis,4 |
  fis4. cis' cis,4 |
  gis'4 r4 r2 |
  r1 |

  \repeat volta 2 {
    \repeat percent 2 { \bar ".|:" fis4. cis' cis,4 | }
    \repeat percent 2 {            gis'4. cis cis,4 | }
    \mark \markup {("2x")}
  }

  ais'1 |
  b1 |
  cis2 b |
  ais4. b cis4 |

  d2. d4 |
  cis2. cis4 |
  b2. b4 |
  a2. a4 |

  gis2. gis4 |
  fis2. fis4 |
  f1 |
  cis1 |

  fis2. fis4 |
  e2. e4 |
  d1 |
  r1 |

  cis4. f gis4 |
  cis4. eis gis4 |
  cis1\trill |
  r1 |

  fis,,4. cis' cis,4 |
  fis4. cis' cis,4 |
  fis4 r4 r2 |
  r1 |

}

\pointAndClickOff

\score { 
    \new Staff \new Voice = "melody" \melody
}
