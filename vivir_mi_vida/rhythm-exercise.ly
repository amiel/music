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

montuno = \relative c'' {
  b8. ees16~ees8 g8~g16 ees8. g8. aes16~ |
  aes8. ees16~ees8 aes8~aes16 ees8. aes8. g16~ |
  g8. ees16~ees8 g8~g16 ees8. g8. f16~ |
  f8. d16~d8 f8~f16 d8. f8. g16~ |
}


firstEx = \relative c'' {
  b8.^\markup{ 1 } b16~b8 b8~b16 b8. b8.^\markup{ 4 } r16 |
}

secondEx = \relative c'' {
  r8. b16~b8 b8~b16 b8. b8. r16 |
}


%%%%%%%%%%%%%%%%
% parts
%

rhythmPractice = \relative c {
  \xNotesOn

  \repeat volta 2 {
    \firstEx
  }

  \repeat volta 2 {
    \secondEx
  }

  \xNotesOff
}

\book { \bookOutputName "rhythm-practice" \header { title = "Rhythm Practice" } \score { \compressMMRests { \new Staff \rhythmPractice } \layout {} } }
