\version "2.22.2"

\header {
  title = "Pacific Salmon"
  % subtitle = "(tune)"
  % composer = "Me"
  % meter = "moderato"
  % piece = "Swing"
  % tagline = \markup {
    % \column {
      % "LilyPond example file by Amelie Zapf,"
      % "Berlin 07/07/2003"
    % }
  % }
}
% To make the example display in the documentation
% \paper {
 %  paper-width = 130
% }
%#(set-global-staff-size 16)
% \include "english.ly"


%% insert chord name style stuff here.

%%%%%%%%%%%% Keys'n'thangs %%%%%%%%%%%%%%%%%

Key = {
  \key d \major
}

Timeline = {
  \time 5/4
  \repeat unfold 4 { s2. s2 | }
  \repeat volta 2 {
    \repeat unfold 8 { s2. s2 | }
  }

  \time 6/8
  
  \repeat volta 2 {
    \repeat unfold 8 { s2. | }
  }

}

% ##### Vocal Part

vocal = \transpose c c \relative c'' {
  \Key
  \repeat unfold 4 { R1*5/4 }

  \repeat volta 2 {
    a2. fis2 |
    e2. d2 |
    fis1*5/4 |
    R1*5/4 |
    a2. fis2 |
    e2. fis2 |
    d1*5/4 |
    R1*5/4 |
  }

  \repeat volta 2 {
    r4. e4. |
    fis4 d8 d4 e8 |
    fis4 a8 g4 e8 |
    a,2. |

    r4. e'4. |
    fis4 d8 d4 e8 |
  }
  \alternative {
    { fis4 d8 d4 e8 | fis2. | }
    { fis4 d8 d4 d16 e | fis4 e16 d fis8 \breathe e d | }
  }

  \repeat volta 2 {
    c4. c |
    e4 g8 fis4. | 
    fis4 d8~d4. |
    R1*6/8 |

    c4. c |
    e8 e r16 g fis8 r d |
    fis2. |
    R1*6/8 |
  }
}

vocalHarmony = \transpose c c \chordmode {
  \repeat unfold 4 { d2. g2 }
  \repeat volta 2 {
    \repeat unfold 8 { d2. g2 }
  }

  \repeat volta 2 {
    a2.:m |
    s2. |
    d2. |
    s2. |
    a2.:m |
    s2. |
  }
  \alternative {
    { d2. | s2. | }
    { d2. | s2. | }
  }

  \repeat volta 2 {
    \repeat unfold 2 {
      c2. |
      g2. |
      d2.:sus4 |
      d2.: |
    }
  }
}

aOne = \lyricmode {
  Sal -- mon | swim in | streams |
  When they | are ba -- | bies 
}

aTwo = \lyricmode {
  O -- cean | bound they | go |
  Grow and | come back | home 
}

bOne = \lyricmode {
  What | tells them  it is | time to  leave the | sea 
  To | jour -- ney back they | fight to swim up -- | stream
}

bTwo = \lyricmode {
  Egg-and | yolk are lay -- ing | safe -- ly in a | redd
  Alevin | hatch and grow to |

  % Pass through 1st ending
  % durations are required but ignored
  \skip4 \skip8 \skip4 \skip8 | \skip2. |

  frye and smolt in a | sil -- ve -- ry coat, They are
}

cOne = \lyricmode { 
  Chum pink | co -- ho and | sock -- eye |
  Steel -- head | cut -- throat chin -- ook is | King
}

% ############ Horns ############

% ------ Trumpet ------
trpt = \transpose c d \relative c'' {
  \Key
  R1*5/4 |
}
trumpet = {
  \clef treble
  <<
    \trpt
  >>
}


%%%%%%%%% It All Goes Together Here %%%%%%%%%%%%%%%%%%%%%%

\score {
  <<
    \new StaffGroup = "melody" <<
      \new ChordNames { \vocalHarmony }
      \new Staff \with { instrumentName = "Vocals" }
      \new Voice = "Vocals" <<
        \Timeline
        \vocal
      >>
      \new Lyrics \lyricsto Vocals { \aOne \bOne  }
      \new Lyrics \lyricsto Vocals { \aTwo \bTwo \cOne }
    >>

    \new StaffGroup = "horns" <<
      \new Staff = "trumpet" \with { instrumentName = "Trumpet" }
      \Timeline
      \trumpet
      % \new Staff = "altosax" \with { instrumentName = "Alto Sax" }
      % \altoSax
      % \new ChordNames = "barichords" \with { instrumentName = "Trumpet" }
      % \bariHarmony
      % \trombone
    >>
  >>

  \layout {
    \context { \Staff \RemoveEmptyStaves }
    \context {
      \Score
      \override BarNumber.padding = #3
      \override RehearsalMark.padding = #2
      skipBars = ##t
    }
  }
  \midi { }
}
