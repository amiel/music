\version "2.24.0"

red = \relative c' {
  \override NoteHead.color = #red
  <c e g>4 <c e g> <c e g> <c e g> 

}

blue = \relative c' {
  \override NoteHead.color = #blue
  <c f a>4 <c f a> <c f a> <c f a>
}

yellow = \relative c' {
  \override NoteHead.color = #(x11-color 'gold)
  <b d g>4 <b d g> <b d g> <b d g> 
}

halfRed = \relative c' {
  \override NoteHead.color = #(x11-color 'red)
  <c e g>4 <c e g>
}

halfYellow = \relative c' {
  \override NoteHead.color = #(x11-color 'gold)
  <b d g>4 <b d g>
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

      % intro

      \red |
      \blue |
      \red |
      \yellow |

      \break

      \red |
      \blue |
      \halfRed \halfYellow |
      \red |

      \break

      % verse

      \red |
      \blue |
      \red |
      \yellow |

      \break

      \red |
      \blue |
      \halfRed \halfYellow |
      \red |

      \break

      % pre-chorus

      \red |
      \blue |
      \red |
      \yellow |

      \break

      \red |
      \blue |
      \halfRed \halfYellow |
      \red |

      \break

      % Chorus

      \red |
      \blue |
      \red |
      \yellow |

      \break

      \red |
      \blue |
      \halfRed \halfYellow |
      \red |

      \break

      \red |
      \blue |
      \red |
      \yellow |

      \break

      \red |
      \blue |
      \halfRed \halfYellow |
      \red |

      \break



    }
  }

  \new Lyrics {
    \lyricmode {

      % intro

      Oh,8. oh, oh, oh, oh4 | _1 |
      Oh,8. oh, oh, oh, oh4 | _1 |

      Oh,8. oh, oh, oh, oh4 | _1 |
      Oh,8. oh, oh, oh, oh4 | _4.

      % Verse

      I8 messed up to -- night, |

      \sectionLabel "Verse"
      _4. I8 lost a -- no -- ther | fight4 _4.

      Lost8 to my -- | self,4 but8 I'll just start a -- gain |

      _4. I8 keep fall -- ing down, |

      _4 I8 keep on hit -- ting the | ground4.

      I8 al -- ways get up | now,4 _2 see8 what's | next1 

      % pre-chorus

      \sectionLabel "Pre-chorus"
      Birds4. don't just4 | fly,4. they fall4 | down4. and get8 up | _1 |

      No4. -- bo -- dy4 | learns4. with -- out4 | get4. -- tin' it4 | wrong2 _8 

      % Chorus

      I8 won't give |

      \sectionLabel "Chorus"
      up,4 no,8 I won't give in4 |
      _4 'Til8 I reach4 the8 end, | _8 and then I'll start a -- gain4 |
      _4 No,8 I won't leave,4. | _4. I8 wan -- na try eve -- | ry -- thing4
      I8 wan -- na try even8 | though4. I8 could fail _4 |

      _2 _8 I8 won't give |

      up,4 no,8 I won't give in4 |
      _4 'Til8 I reach4 the8 end, | _8 and then I'll start a -- gain4 |
      _4 No,8 I won't leave,4. | _4. I8 wan -- na try eve -- | ry -- thing4
      I8 wan -- na try even8 | though4. I8 could fail _4 |

      _1 |

      Oh, oh, oh, oh, oh
      Try everything
      Oh, oh, oh, oh, oh
      Try everything
      Oh, oh, oh, oh, oh
      Try everything
      Oh, oh, oh, oh, oh
 
%       Oh,8. oh, oh, oh, oh4 | _1 |
%       Oh,8. oh, oh, oh, oh4 | _1 |
% 
%       Oh,8. oh, oh, oh, oh4 | _1 |
%       Oh,8. oh, oh, oh, oh4 | _4.


      Look how far you've come, you filled your heart with love
      Baby, you've done enough, take a deep breath
      Don't beat yourself up, no need to run so fast
      Sometimes we come last, but we did our best
      I won't give up, no, I won't give in
      'Til I reach the end, and then I'll start again
      No, I won't leave, I wanna try everything
      I wanna try even though I could fail
      I won't give up, no, I won't give in
      'Til I reach the end, and then I'll start again
      No, I won't leave, I wanna try everything
      I wanna try even though I could fail
      I'll keep on making those new mistakes
      I'll keep on making them every day
      Those new mistakes
      Oh, oh, oh, oh, oh
      Try everything
      Oh, oh, oh, oh, oh
      Try everything
      Oh, oh, oh, oh, oh
      Try everything
      Oh, oh, oh, oh, oh
      Try everything

    }
  }
>>
