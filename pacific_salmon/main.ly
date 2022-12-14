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
  \key g \major
}

Timeline = {
  \time 5/4
  \repeat unfold 4 { s2. s2 | }
  \repeat volta 2 {
    \repeat unfold 8 { s2. s2 | }
      \mark \markup { "Fine" }
  }

  \time 6/8
  
  \repeat volta 2 {
    \repeat unfold 6 { s2. | }
  }
  \alternative {
    { s2. | s2. |}
    { s2. | s2. |}
  }

  \repeat volta 2 {
    \repeat unfold 6 { s2. | }
  }
  \alternative {
    { s2. | s2. |}
    { s2. | \mark \markup { \small "D.C. al fine" } s2. |}
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
    
  }
  \alternative {
    { fis2. | r4. r8 e d | }
    { fis2. | R1*6/8 | }
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
    c2. |
    g2. |
    d2.:sus4 |
    d2.: |

    c2. |
    g2. |
    
  }
  \alternative {
    { d2.:sus4 | d2.: | }
    { d2.:sus4 | d2.: | }
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

  They are
}

% ############ Horns ############

% ------ Trumpet ------
trpt = \transpose c c \relative c'' {
  \Key

  \repeat unfold 4 { R1*5/4 | }

  \repeat volta 2 {
    \repeat unfold 8 { R1*5/4 | }
  }

  \repeat volta 2 {
    \repeat unfold 6 { R1*6/8 | }
  }
  \alternative {
    { R1*6/8 | R1*6/8 }
    { r4. fis~ \pp \< | fis4.~fis8 \! \breathe e \mf d | }
  }

  \repeat volta 2 {
    c4. c |
    b4. b |
    a4. a8 c g' |
    fis8 d4~d4. |

    c4. c |
    b4. b |
  }
  \alternative {
    {a4. a4. | a4. a8 \breathe e' d | }
    {a4. a | a2. | }
  }
}
trumpet = {
  \clef treble
  <<
    \trpt
  >>
}

clar = \transpose c c \relative c'' {
  \Key

  \repeat unfold 4 { R1*5/4 | }

  \repeat volta 2 {
    \repeat unfold 8 { R1*5/4 | }
  }

  \repeat volta 2 {
    \repeat unfold 6 { R1*6/8 | }
  }
  \alternative {
    { R1*6/8 | R1*6/8 }
    { r4. a~ \pp \< | a4.~a8 \! \breathe g \mf fis | }
  }

  \repeat volta 2 {
    g4. g |
    g4. g |
    g4. g |
    fis4. fis4. |

    g4. g |
    g4. g |
    
  }
  \alternative {
    {g4. e8 e r16 g | fis8 r8 d8 fis8 \breathe g fis | }
    {g4. g | a2. | }
  }
}
clarinet = {
  \clef treble
  <<
    \clar
  >>
}



bart = \transpose c c \relative c' {
  \Key

  \repeat unfold 4 { R1*5/4 | }

  \repeat volta 2 {
    \repeat unfold 8 { R1*5/4 | }
  }

  \repeat volta 2 {
    \repeat unfold 6 { R1*6/8 | }
  }
  \alternative {
    { R1*6/8 | R1*6/8 }
    { r4. d~ \pp \< | d4.~d8 \! \breathe r4 | }
  }

  \repeat volta 2 {
    e4. \mf e |
    e4. d |
    d4. d |
    d4. d |

    e4. e |
    e4. d |
    
  }
  \alternative {
    {d4. d | d4. d | }
    {d4. d | d2. | }
  }
}
baritone = {
  \clef treble
  <<
    \bart
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
      \trumpet

      \new Staff = "clarinet" \with { instrumentName = "Clarinet" }
      \clarinet

      \new Staff = "baritone" \with { instrumentName = "Baritone" }
      \baritone
    >>
  >>

  \layout {
    % \context { \Staff \RemoveEmptyStaves }
    \context {
      \Score
      \override BarNumber.padding = #3
      \override RehearsalMark.padding = #2
      skipBars = ##t
    }
  }
  \midi { }
}
