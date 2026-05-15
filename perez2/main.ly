\version "2.24.4"

date = #(strftime "%Y-%m-%d" (localtime (current-time)))

revisionInfo = \markup { \concat { "Revision " \date } }

title = \markup "Perez 2"

% \pointAndClickOff

%%%%%%%%%%%%%%%%%
% modules
%

% \caesura is the drum break

global = {
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \key c \major
}

Accordion = {
  \global
  \relative c' {
    \section \mark \default
    %% \break \mark \markup \box "Intro"

    e8 g r2. |
    e8 <g a> r <g a> r <g a> r <g a> |
    f8 g r2. |
    r8 \tiny <ees'' d> \normalsize r2. |

    \break

    f,,8 g r2. |
    f8 g f g d' b g f |
    e4 r8 \tiny e''~e2~|
    e2 r8 <e dis> \normalsize r4 |

    \break

    e,,8 g r2. |
    e8 g e g e g e g |
    f8 g r4 r8 \tiny <dis e>8 <dis e>4 |
    \normalsize R1 |

    \break

    f8 g r2. |
    f8 g f g d' b g f |
    e4 \caesura r4 \tiny <c'' e>2 |
    <c d>4 \normalsize r2.^\markup { trumpet } |

    \break
    \section \mark \default
    \textMark \markup \italic "Horns"

    e,,8 g r2. |
    e8 g e g e g e g |
    f8 g r2. |
    R1 |

    \break

    f8 g r2. |
    f8 g f g d' b g f |
    e4 \caesura r2. |
    r8 \tiny <dis' e>8 <dis e>4 \normalsize r2 |

    \break
    \section \mark \default
    \textMark \markup \italic "No Horns"

    e,8 g r2. |
    e8 g r g r g r g |
    f8 g r2. |
    r8 \tiny e''\bendAfter -5 \normalsize r2. |

    \break

    f,,8 g r2. |
    f8 g f g d' b g f |
    e8 g r4 r8 \tiny <ees'' d> \normalsize r4 |
    R1 |

    \break
    \section \mark \default
    %% \textMark \markup \italic "Bridge"

    c,1~ |
    c8 d c b d c b a |
    c8 f, r4 r8 e8 \bendAfter -3 r4 |
    R1 |

    \break

    d'1~ |
    d8 c b a c b a g |
    b8 r8 r4 r8 \tiny <ees' d>8 <ees d>4 \normalsize |
    R1 |

    \break
    \section \mark \default

    e,8 e e e g g g g |
    a8 a a a c4 c |
    b4 \caesura r <g b ees>2 |
    g,,2.-> r4 |

    \break

    f''8 f f f g g g g |
    a8 a a a b4 b |
    a4 \caesura r8. b,16 r4 r8. a16 |
    r4 \tiny <ees' d> <ees d> \normalsize r4 |

    \break
    \section \mark \default

    c1~ |
    c8 d c b d c b a |
    c8 f, r4 r2 |
    \tiny r8 <d ees>8 r8 <d ees>8 r8 <d ees>8 r8 <d ees>8 \normalsize |

    \break

    d'1~ |
    d8 c b c d c b a |
    gis1 |
    f2 e2 |

    \break
    \section \mark \default

    <d d'>1 |
    b''8-^ \caesura b,8 c b d c b a |
    g2. c4 |
    e2 f2 |

    \break

    e1 |
    d1 |
    <g, c e>4-^ \caesura r4 \tiny \grace {e'32(d c)} b4 r4 | 
    \grace {e32(d c)} a4 <d ees> <d ees> \normalsize r4 |

    \break
    \section \mark \default

    e,8 g r4 \tiny <d ees>8 <d ees> <d ees>4 \normalsize |
    e8 g e g e g e g |
    f8 g r4 \tiny <d' ees>8 <d ees> <d ees>4 \normalsize |
    g,,2. r4 |

    \break

    f'8 g r2. |
    f8 g f g d' b g f |
    e8 g8 r4 \tiny \grace {g'32(f)} e4 r4 |
    \tiny r8 <d ees>8 r8 <d ees>8 r8 <d ees>8
    ^\markup { trumpet } 
    r8 <d ees>8 \normalsize |

    \break
    \section \mark \default
    \textMark \markup \italic "Horns"

    e,8 g r2. |
    e8 g e g e g e g |
    f8 g r2. |
    \tiny r8 <d ees>8 r8 <d ees>8 r8 <d ees>8 r8 <d ees>8 \normalsize |

    \break

    f8 g r2. |
    f8 g f g d' b g f |
    e4 r2. |

    \bar "|."
  }
}


Trumpet = {
  \global
  \relative c' {
    \section \mark \default
    R1*15 |
    r8 e\noBeam e e b' b a a|
    \break
    \section \mark \default
    
    e8 e r dis e a r4 |

    r8 e\noBeam e e b' b a a|
    f8 f r e f b r4 |

    r8 f\noBeam f f c' c b b|
    \break
    
    f8 f r e f b r4 |
    
    r8 f\noBeam f f c' c b b |
    a4 r4 r2 |
    R1 |

    \break
    \section \mark \default

    R1*8 |

    \section \mark \default
    R1*8 |
    \break

    \section \mark \default


    e'8 e e e g g g g |
    a8 a a a c4 c |
    b4 r4 r2 |
    R1 |

    \break

    f8 f f f g g g g |
    a8 a a a b4 b |
    a4 r4 r2 |
    R1 |

    \section \mark \default
    R1*8 |

    \section \mark \default
    R1 |
    b4-^ r4 r2 |

    R1*2 |

    R1*2 |
    e,4-^ r4 r2 |
    R1 |

    \section \mark \default
    R1*8 |
    \break

    \section \mark \default
    e8 g a a a4 b|
    e,4 e8 g  a a b b|
    f8 g a a a4 b |
    f4 r4 r2 |
    f8 g a a a4 b|
    f4 f8 g a a b b|
    
    c4 r4 r2 |

    \bar "|."
  }
}


Sax = {
  \global
  \relative c' {
    \section \mark \default
    R1*16 |

    e8 g r2. |
    e8 g e g e g e g |
    f8 g r4 r2 |
    R1 |

    \break

    f8 g r2. |
    f8 g f g d' b g f |
    e4 r4 r2 |
    r1 |

    \break
    \section \mark \default

    R1*8 |

    \section \mark \default
    R1*8 |
    \break

    \section \mark \default


    e8 e e e g g g g |
    a8 a a a c4 c |
    b4 r4 r2 |
    g,1\ff |

    \break

    f8 f f f g g g g |
    a8 a a a b4 b |
    a4 r4 r2 |
    R1 |

    \section \mark \default
    R1*8 |

    \section \mark \default
    R1 |
    g4-^ r4 r2 |

    R1*2 |

    R1*2 |
    c,4-^ r4 r2 |
    R1 |

    e'8 g r4 r2 |
    e8 g e g e g e g |
    f8 g r4 r2 |
    g,1 |

    \break

    f'8 g r4 r2 |
    f8 g f g d' b g f |
    e4 r4 r2 |
    r1 |
    
    \break

    e8 g r4 r2 |
    e8 g e g e g e g |
    f8 g r4 r2 |
    R1 |

    \break

    f8 g r4 r2 |
    f8 g f g d' b g f |
    e4 r4 r2 |

    \bar "|."
  }
}


Trombone = {
  \global
  \clef bass

  \relative c {
    \section \mark \default
    R1*15 |
    r8 e\noBeam e e b' b a a|
    \break
    \section \mark \default
    
    e8 e r dis e a r4 |

    r8 e\noBeam e e b' b a a|
    f8 f r e f b r4 |

    r8 f\noBeam f f c' c b b|
    \break
    
    f8 f r e f b r4 |
    
    r8 f\noBeam f f c' c b b |
    a4 r4 r2 |
    R1 |

    \break
    \section \mark \default

    R1*8 |

    \section \mark \default
    R1*8 |
    \break

    \section \mark \default


    e8 e e e g g g g |
    a8 a a a c4 c |
    b4 r4 r2 |
    g,1\ff |

    \break

    f'8 f f f g g g g |
    a8 a a a b4 b |
    a4 r4 r2 |
    R1 |

    \section \mark \default
    R1*8 |

    \section \mark \default
    R1 |
    d4-^ r4 r2 |

    R1*2 |

    R1*2 |
    g,4-^ r4 r2 |
    R1 |

    \section \mark \default
    R1*3 |
    g,1\ff |
    R1*4 |
    \break

    \section \mark \default
    e'8 g a a a4 b|
    e,4 e8 g  a a b b|
    f8 g a a a4 b |
    f4 r4 r2 |
    f8 g a a a4 b|
    f4 f8 g a a b b|
    
    c4 r4 r2 |

    \bar "|."
  }
}


% Concert pitch parts (for score)
accordionPartC = \new Staff \with { instrumentName = "Accordion" } \Accordion
trumpetPartC = \new Staff \with { instrumentName = "Trumpet" } \Trumpet
saxPartC = \new Staff \with { instrumentName = "Bari Sax" } \transpose c c' \Sax
trombonePartC = \new Staff \with { instrumentName = "Trombone" } \Trombone

% Transposed parts (for individual parts)
trumpetPartBb = \new Staff \transpose bes c' \Trumpet
bariSaxPartEb = \new Staff \transpose ees c' \Sax

#(set-global-staff-size 24)

% Score -- all parts at concert pitch
\book {
  \bookOutputName "perez2-score"
  \header {
    title = \title
    tagline = \revisionInfo
    instrument = "Score"
  }
  \score {
    <<
      \accordionPartC
      \trumpetPartC
      \saxPartC
      \trombonePartC
    >>
    \layout {
      #(layout-set-staff-size 20)
    }
  }
}

% Accordion
\book {
  \bookOutputName "perez2-accordion"
  \header {
    title = \title
    tagline = \revisionInfo
    instrument = "Accordion (Patricia)"
  }
  \score {
    \new Staff \Accordion
    \layout {
      indent = 0
      #(layout-set-staff-size 24)
    }
  }
}

% Trumpet in Bb
\book {
  \bookOutputName "perez2-trumpet"
  \header {
    title = \title
    tagline = \revisionInfo
    instrument = \markup { "Trumpet in B" \flat }
  }
  \score {
    \compressMMRests \trumpetPartBb
    \layout {
      indent = 0
      #(layout-set-staff-size 30)
    }
  }
}

% Bari Sax in Eb
\book {
  \bookOutputName "perez2-bari-sax"
  \header {
    title = \title
    tagline = \revisionInfo
    instrument = \markup { "Bari Sax in E" \flat }
  }
  \score {
    \compressMMRests \bariSaxPartEb
    \layout {
      indent = 0
      #(layout-set-staff-size 26)
    }
  }
}

% Trombone
\book {
  \bookOutputName "perez2-trombone"
  \header {
    title = \title
    tagline = \revisionInfo
    instrument = "Trombone"
  }
  \score {
    \new Staff \compressMMRests \Trombone
    \layout {
      indent = 0
      #(layout-set-staff-size 28)
    }
  }
}
