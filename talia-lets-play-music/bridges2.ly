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
      s2 s4 r8 c'8(| c1) |
      s2 s4 r8 c8(| c4.) d8(d2) |
    }
    \\
    {
      \voiceThree
      s2 r8 f,4.( | f1) |
      s2 r8 g4.( | f1) |
    }
    \\
    {
      \voiceFour
      r4 r8 d8(d2)( | d1) |
      r4 r8 d8(d2)( | d1) |
    }
  >>
}

lowerB = \relative c' {
  <<
    {
      \voiceOne
      r4 c2.( | c1)
      s4 c2.( | c1)
    }
    \\
    {
      \voiceTwo
      s1 | s1 |
      s8 g8( g2.)( | g1) |
    }
    \\
    {
      \voiceFour
      d1( | d1) |
      d1( | d1) |
    }
  >>
}


%%
%% upperB = \relative c' {
%%   <<
%%     {
%%       \voiceOne
%%       s2 s4 s8 c'8(| c1) |
%%       s2 s4 s8 c8(| c4.) d8(d2) |
%%     }
%%     \\
%%     {
%%       \voiceTwo
%%       s2 s8 f,4.( | s1) |
%%       s2 s8 g4.( | s1) |
%%     }
%%     \\
%%     {
%%       \voiceFour
%%       s4 s8 d8(s2 | s1) |
%%       s4 s8 d8(s2 | s1) |
%%     }
%%   >>
%% }
%%
%% lowerB = \relative c' {
%%   <<
%%     {
%%       \voiceOne
%%       s4 c8( s4. | s1)
%%       s4 s8( s4. | s1)
%%     }
%%     \\
%%     {
%%       \voiceTwo
%%       s1 | s1 |
%%       s8 g8( s2 | s1) |
%%     }
%%     \\
%%     {
%%       \voiceFour
%%       d4( s2.| s1) |
%%       d8( s2.. | s1) |
%%     }
%%   >>
%%
%%   %%
%%   %% <<
%%   %%   {
%%   %%     \voiceOne
%%   %%     d,4 c'8 s8 s2 | s1 |
%%   %%   }
%%   %%   \\
%%   %%   {
%%   %%     \voiceTwo
%%   %%     d,8 g c8 s8 s2 | s1 |
%%   %%   }
%%   %% >>
%% }
%%


\score {
  \new PianoStaff <<
    \new Staff = "upper" { \upperA \upperB }
    \new Staff = "lower" { \lowerA \lowerB }
  >>
  \layout { }
}
