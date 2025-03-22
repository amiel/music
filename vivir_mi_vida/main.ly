\version "2.24.4"

% NOTES about arrangement
%
% Intro:
% 
%   1. voice (part 2) + piano (part 3)
%   2. "
%   3. percussion, voice (part 2), piano (part 4)
%   4. " + trombone
%
% Verse:
%
%   1. piano, percussion, vocal
%   2. "
%   3. " + trombone
%   4. " + trumpet
%
% Chorus:
%
% ??


%%%%%%%%%%%%%%%%%
% modules
%

aClap = \relative c'' {
  \xNotesOn
  bes4
  \xNotesOff
}

theClap = \relative c'' {
  \xNotesOn

  \repeat unfold 4 { bes4 } |

  \xNotesOff
}

firstClap = \relative c'' {
  \xNotesOn

  bes4^\markup { \italic "clap" }

  \repeat unfold 3 { bes4 } |

  \xNotesOff
}

verseClaps = \relative c'' {
  \xNotesOn
    R1
    r2 bes4^\markup { \italic "clap" } bes4 |
    bes4 r4 r2 |

    \repeat unfold 2 {
      r2 bes4 bes4 |
      bes4 r4 r2 |
    }

  \xNotesOff
}

verse = \relative c' {
  % a veces llega la lluvia
  r8 c8 c d ees ees c ees~ | ees8 ees~ees4 r2 |

  % para limpiar las herida
  r8 ees ees c ees ees c ees~ | ees ees( d4) r2 |

  % a veces solo una gota
  r8 c c d ees d c c~ | c bes( c16 bes aes8~ aes4) r4 |

  % puede vencer la sequia
  r8 ees' ees ees ees ees c ees~ | ees ees( f4) r2 |
}

vivirMiVida = \relative c' {
  % one beat missing to allow for landing the melody on 1
    r8 ees8 ees4 g4 |
  f4 r8 f8 \tuplet 3/2 { f4 ees d } |
}

% Define common musical phrases for reuse
voyAReir = \relative c' {
  % one beat missing to allow for landing the melody on 1
    r8 c ees4 g |
  aes4 r8 c, ees4 aes |
  g4 \vivirMiVida
}

versePiano = \relative c' {
  g8. <c ees>16~<c ees>8 g8~g16 <c ees>8. g8. aes16~ |
  aes8. <c ees>16~<c ees>8 aes8~aes16 <c ees>8. aes8. g16~ |
  g8. <bes ees>16~<bes ees>8 g8~g16 <bes ees>8. g8. f16~ |
  f8. <bes d>16~<bes d>8 f8~f16 <bes d>8. f8.  % last 16th left out
}

chorusPiano = \relative c' {
  g8. g16 <c ees>8 <c ees> g16 <c ees>8 g16 <c ees>8 <c ees> |
  aes8. aes16 <c ees>8 <c ees> aes16 <c ees>8 aes16 <c ees>8 <c ees> |
  g8. g16 <bes ees>8 <bes ees> g16 <bes ees>8 g16 <bes ees>8 <bes ees> |
  f8. f16 <bes d>8 <bes d> f16 <bes d>8 f16 <bes d>8 <bes d> |
}

trombone = \relative c' {
  \repeat unfold 2 { r8. c16 r bes c8~ c4 r4 | } 
  r8. ees16 r d ees8~ ees4 r4 | 
  r8. d16 r c d8~d4 bes |
}

bassIntro = \relative c {
  c4 r r2 | aes4 r r2 | ees'4 r r2 | bes4 r4 r2 |
}

bassVerse = \relative c {
  c8. ees16~ees8 g8~g4 r4 |
  aes,8. c16~c8 ees8~ees4 r4 |
  ees,8. g16~g8 bes8~bes4 r4 |
  bes8. d16~d8 f8~f4 r4 |
}

bassChorus = \relative c {
  c8. g16 g8 c8 r8. c16 ees8 aes, |
  r8. aes16 ees8 aes r8. aes16 aes8 ees |
  r8. bes16 bes8 ees r8. ees16 ees8 bes |
  r8. f'16 f8 bes r8. bes16 ees bes c8 |
}


%%%%%%%%%%%%%%%%
% parts
%

% Define each part

% trumpets
partOne = \relative c' {
  \key c \minor

  \mark \markup \box "Intro"

  \firstClap
  \repeat unfold 5 { \theClap }

  \transpose c c' {
    r4 \vivirMiVida

    \mark \markup \italic salsa
    % TODO: High c with fall
    <<
      { c''4\bendAfter -4 } \\ 
      { c'4 }
    >>
    r4 r2  |

    R1 |
    r4 \vivirMiVida |
    c'4 r4 r2 |
    
    R1 |
    r4 \vivirMiVida |
  }

  \mark \markup \box "Verse"

  \verse

}

partTwo = \relative c' {
  \key c \minor

  \mark \markup \box "Intro"

  r4 \voyAReir
  c4 \voyAReir

  \mark \markup \italic salsa

  c4 \voyAReir
  c4 \voyAReir

  \mark \markup \box "Verse"

  \verseClaps
}

pianoPart = \relative c' {
  \key c \minor

  \mark \markup \box "Intro"

  \versePiano g16~ |
  \versePiano g16~ |

  \mark \markup \italic salsa

  \chorusPiano
  \chorusPiano

  \mark \markup \box "Verse"

  \versePiano g16~ |
  \versePiano r16 |
}

partThree = \relative c' {
  \clef bass
  \key c \minor

  \mark \markup \box "Intro"

  \versePiano g16~ |
  \versePiano g16 |

  \mark \markup \italic salsa

  g8 \bendAfter -4 r8 r4 r2 | R1*3

  \trombone

  \mark \markup \box "Verse"

  \versePiano g16~ |
  \versePiano r16 |
}

partFour = \relative c {
  \clef bass
  \key c \minor

  \mark \markup \box "Intro"

  % Move the center-line clap for treble clef to center-line for bass clef
  \transpose bes d, {
    \firstClap
    \repeat unfold 6 { \theClap }
    R1
  }

  \mark \markup \italic salsa
  \chorusPiano
  \chorusPiano

  \mark \markup \box "Verse"

  % Move the center-line clap for treble clef to center-line for bass clef
  \transpose bes d, {
    \verseClaps
  }
}

bassPart = \relative c {
  \clef bass
  \key c \minor

  \mark \markup \box "Intro"

  \bassIntro
  \bassIntro

  \mark \markup \italic salsa

  \bassChorus
  \bassChorus

  \mark \markup \box "Verse"

  \bassVerse
  \bassVerse
}


pianoPartC = \new Staff \transpose c c' \pianoPart

% Individual parts for printing
leadPartC = \new Staff \partOne
leadPartBb = \new Staff \transpose bes c' \partOne
leadPartEb = \new Staff \transpose c ees \partOne

middlePartC = \new Staff \partTwo
middlePartBb = \new Staff \transpose c bes \partTwo
middlePartEb = \new Staff \transpose c ees \partTwo

lowPartC = \new Staff \partThree
lowPartBb = \new Staff \transpose c bes \partThree
lowPartEb = \new Staff \transpose c ees \partThree

otherLowPartC = \new Staff \partFour
otherLowPartBb = \new Staff \transpose c bes \partFour
otherlowPartEb = \new Staff \transpose c ees \partFour

bassC = \new Staff \bassPart
bassBb = \new Staff \transpose c bes \bassPart
bassEb = \new Staff \transpose c ees \bassPart

% Full Score in C
\book {
  \bookOutputName "full_score_C"
  \header { title = "Full Score (C)" }
  \score {
    <<
      \new StaffGroup <<
        \leadPartC
        \middlePartC
        \lowPartC
        \otherLowPartC
        \bassC
      >>
    >>
    \layout {}
  }
}

\book { \bookOutputName "piano" \header { title = "Piano (C)" } \score { \compressMMRests { \pianoPartC } \layout {} } }

% Individual part books with filenames
\book { \bookOutputName "lead_C" \header { title = "Lead Part (C)" } \score { \compressMMRests { \leadPartC } \layout {} } }
\book { \bookOutputName "lead_Bb" \header { title = "Lead Part (B-flat)" } \score { \compressMMRests { \leadPartBb } \layout {} } }

%\book { \bookOutputName "lead_Bb" \header { title = "Lead Part (B-flat)" } \score { \compressMMRests { \leadPartBb } \layout {} } }
%\book { \bookOutputName "lead_Eb" \header { title = "Lead Part (E-flat)" } \score { \leadPartEb \layout {} } }
%
%\book { \bookOutputName "middle_C" \header { title = "Middle Part (C)" } \score { \middlePartC \layout {} } }
%\book { \bookOutputName "middle_Bb" \header { title = "Middle Part (B-flat)" } \score { \middlePartBb \layout {} } }
%\book { \bookOutputName "middle_Eb" \header { title = "Middle Part (E-flat)" } \score { \middlePartEb \layout {} } }

\book {
  \bookOutputName "low1_C"
  \header { title = "Low Background Part 1 (C)" }
  \score { \compressMMRests { \lowPartC } \layout {} }
}

\book {
  \bookOutputName "low1_Bb"
  \header { title = "Low Background Part 1 (B-flat)" }
  \score { \compressMMRests { \lowPartBb } \layout {} }
}

%\book { \bookOutputName "low1_Eb" \header { title = "Low Background Part 1 (E-flat)" } \score { \lowPartEb \layout {} } }
%
%\book { \bookOutputName "low2_C" \header { title = "Low Background Part 2 (C)" } \score { \lowPart2C \layout {} } }
%
%\book { \bookOutputName "low2_Bb" \header { title = "Low Background Part 2 (B-flat)" } \score { \lowPart2Bb \layout {} } }
%
%\book {
%  \bookOutputName "low2_Eb"
%  \header {
%    title = "Low Background Part 2 (E-flat)"
%  }
%  \score { \lowPart2Eb \layout {} }
%}
%
%\book { \bookOutputName "bass_C" \header { title = "Bass Part (C)" } \score { \bassC \layout {} } }
%\book { \bookOutputName "bass_Bb" \header { title = "Bass Part (B-flat)" } \score { \bassBb \layout {} } }
%\book { \bookOutputName "bass_Eb" \header { title = "Bass Part (E-flat)" } \score { \bassEb \layout {} } }
