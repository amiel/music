\version "2.24.4"

date = #(strftime "%Y-%m-%d" (localtime (current-time)))

revisionInfo = \markup { \concat { "Revision " \date } }

title = \markup "Perez 2"

\pointAndClickOff

%%%%%%%%%%%%%%%%%
% modules
%

melodyPart = {
  \key c \major
  \relative c' {
    \break \mark \markup \box "Intro"

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
    e4 r \tiny <c'' e>2 |
    <c d>4 \normalsize r2.^\markup { trumpet } |
    
    \break
    \break \mark \markup \box "Horns"

    e,,8 g r2. |
    e8 g e g e g e g |
    f8 g r2. |
    R1 |

    \break

    f8 g r2. |
    f8 g f g d' b g f |
    e4 r2. |
    r8 \tiny <dis' e>8 <dis e>4 \normalsize r2 |

    \break \mark \markup \box "No Horns"

    e,8 g r2. |
    e8 g r g r g r g |
    f8 g r2. |
    r8 \tiny e''\bendAfter -5 \normalsize r2. |

    \break

    f,,8 g r2. |
    f8 g f g d' b g f |
    e8 g r4 r8 \tiny <ees'' d> \normalsize r4 |
    R1 |

    \break \mark \markup \box "Bridge"

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

    e,8 e e e g g g g |
    a8 a a a c4 c |
    b4 r <g b ees>2 |
    g,,2.-> r4 |

    \break

    f''8 f f f g g g g |
    a8 a a a b4 b |
    a4 r8 b,8 r4 a4 |
    r4 \tiny <ees' d> <ees d> \normalsize r4 |

    \break

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

    <d d'>1 |
    b''8-^ b,8 c b d c b a |
    g2. c4 |
    e2 f2 |

    e1 |
    d1 |
    <c e'>4-^ r4 \tiny \grace {e32(d c)} b4 r4 | 
    \grace {e32(d c)} a4 <d ees> <d ees> \normalsize r4 |

    \break


    \break \mark \markup \box "Chorus"

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
    \break \mark \markup \box "Horns"

    e,8 g r2. |
    e8 g e g e g e g |
    f8 g r2. |
    \tiny r8 <d ees>8 r8 <d ees>8 r8 <d ees>8 r8 <d ees>8 \normalsize |

    \break

    f8 g r2. |
    f8 g f g d' b g f |
    e4 r2. |
  }
}


melodyPartC = \new Staff \melodyPart
%% melodyPartBb = \new Staff \transpose bes c' \melodyPart
%% melodyPartEb = \new Staff \transpose ees c \melodyPart

#(set-global-staff-size 24)

\book {
  \bookOutputName "perez2"
  \header {
    title = \title
    tagline = \revisionInfo
    instrument = "(Patricia)" 
  }
  \score {
    \melodyPartC
    \layout {}
  }
}
