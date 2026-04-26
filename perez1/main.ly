\version "2.24.4"

date = #(strftime "%Y-%m-%d" (localtime (current-time)))

revisionInfo = \markup { \concat { "Revision " \date } }

title = \markup "Perez 1"

\pointAndClickOff

%%%%%%%%%%%%%%%%%
% modules
%

Trumpet {
  \key g \major
  \clef treble

}

Trombone = {
  \key g \major
  \clef bass

  \relative c {
    \partial 4 d4 |
    b'4 r r c8 a |
    b4 r c8 b a g |
    a4 r r2 |

    r2. d,4 | a'4 r r b8 g |
    a4 r b8 a g fis |
    g4 r r2 |

    r2. g4 | d'4 r r e8 cis |
    d4 r b8 cis d e |
    fis4 r r g8 e |
    fis4 r g8 fis e d |
    e4  r r fis8 d |
    e4 r fis8 e d cis |
    d4 r r2 |
    R1 |
  }
}


trombonePartC = \new Staff \Trombone
trumpetPartBb = \new Staff \transpose bes c' \Trumpet
%% melodyPartEb = \new Staff \transpose ees c \melodyPart

#(set-global-staff-size 24)

\book {
  \bookOutputName "perez1"
  \header {
    title = \title
    tagline = \revisionInfo
    subtitle = "Drop Sequence"
    instrument = "trombone" 
  }
  \score {
    \trumpetPartBb
    \trombonePartC
    \layout {}
  }
}
