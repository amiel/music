\version "2.24.4"

%%%%%%%%%%%%%%%%%
% modules
%

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

bassIntro = \relative c {
  c4 r r2 | aes4 r r2 | ees'4 r r2 | bes4 r4 r2 |
}

bassChorus = \relative c {
  c8. g16 g8 c8~ c8.
}

montuno = \relative c' {
  g8. <c ees>16~<c ees>8 g8~g16 <c ees>8. g8. aes16~ |
  aes8. <c ees>16~<c ees>8 aes8~aes16 <c ees>8. aes8. g16~ |
  g8. <bes ees>16~<bes ees>8 g8~g16 <bes ees>8. g8. f16~ |
  f8. <bes d>16~<bes d>8 f8~f16 <bes d>8. f8. g16~ |
}

%%%%%%%%%%%%%%%%
% parts
%

% Define each part
partOne = \relative c' {
  \key c \minor

  \firstClap
  \repeat unfold 5 { \theClap }
  r4 \vivirMiVida

  c4 r4 r2
  R1*5

  % \firstClap
  % \repeat unfold 4 { \theClap }
  r4 \vivirMiVida
}

partTwo = \relative c' {
  \key c \minor

  r4 \voyAReir
  c4 \voyAReir
  c4 \voyAReir
  c4 \voyAReir
}

partThree = \relative c' {
  \key c \minor
  \clef bass
  \montuno
  \montuno
}

partFour = \relative c {
  \key c \minor
  \clef bass

  % Move the center-line clap for treble clef to center-line for bass clef
  \transpose bes d, {
    \firstClap
    \repeat unfold 7 { \theClap }

    \repeat unfold 7 { \theClap }
    R1
  }
}

bassPart = \relative c {
  \key c \minor
  \clef bass
  \bassIntro
  \bassIntro
}


% Individual parts for printing
leadPartC = \new Staff \partOne
leadPartBb = \new Staff \transpose c bes \partOne
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

% Individual part books with filenames
\book { \bookOutputName "lead_C" \header { title = "Lead Part (C)" } \score { \compressMMRests { \leadPartC } \layout {} } }

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
