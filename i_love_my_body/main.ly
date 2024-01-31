\version "2.24.0"

#(set-global-staff-size 38)

\pointAndClickOff


\header { 
  title = "I Love My Body"
  tagline = ""
}



red = \relative c' {
  \override NoteHead.color = #red
  <c e g>2 <c e g>
}

blue = \relative c' {
  \override NoteHead.color = #blue
  <c f a>2 <c f a>
}

yellow = \relative c' {
  \override NoteHead.color = #(x11-color 'gold)
  <b d g>2 <b d g>
}

<<
%   \new RhythmicStaff {
%     \new Voice = "voiceRhythm" \relative c {
%       \time 4/4
%       e8. e e e f4 | r1 |
%       e8. e e e d4 | r1 |
%       e8. e e e f4 | r1 |
%       e8. e d d c4 | r4 r8 c c c c c~ |
%       c4 r8 c c c c c~ | c4
% 
%       % I messed up tonight, verse
% 
%     }
%   }

  \new Staff {
    \new Voice = "myChords" \relative c' {
      \time 4/4

      \repeat volta 2 {

      \red |
      \red |
      \yellow |
      \yellow |

      \break

      \red |
      \red |
      \yellow |
      \yellow |

      \break

      \red |
      \blue |
      \red |
      \red |

      \break

      \red |
      \blue |
      \red |
      \red |

      \break

    }

    }
  }

  % \new Lyrics {
  %   \lyricmode {

  %     % intro

  %     Oh,8. oh, oh, oh, oh4 | _1 |
  %     Oh,8. oh, oh, oh, oh4 | _1 |
  %   }
  % }
>>
