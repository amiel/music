\version "2.24.4"

date = #(strftime "%Y-%m-%d" (localtime (current-time)))

revisionInfo = \markup { \concat { "Revision " \date " in B" \flat " minor" } }

title = \markup "Get Up Stand Up"
composer = \markup "by Bob Marley"

\pointAndClickOff

%%%%%%%%%%%%%%%%%
% modules
%
explanationText = \markup {
  \wordwrap {
    Only play verse if someone wants to sing the verse.

    To get really fancy, some people can pick a note from the c minor chord and play offbeats.
  }

}

melodyPart = {
  \transpose c bes {
    \key c \minor
    \relative c' {

      \break \mark \markup \box "Chorus"
      \repeat volta 2 {
        \repeat unfold 2 {
          bes16 c r8  d16 ees r8 r2 |
          bes16 c8 ees16~ees16 bes c8 r2 |
        }
      }


      \break \mark \markup \box "Verse"
      \repeat volta 4 {
        R1*2
      }

    }
  }
}

bassPart = \relative c {
  \transpose c bes {
    \key c \minor
    \relative c' {

      \break \mark \markup \box "Chorus"
      \repeat volta 2 {
        c4 r r16 g' ees8~ees16 d ees d |
        c4 r8. c16 g8 g4 bes8 |

        c4 r r16 g' ees8~ees16 d ees d |
        c4 c16 c8 c16 g8 g4 bes8 |
      }

      \break \mark \markup \box "Verse"
      \repeat volta 4 {
        \tuplet 3/2 { ees8 f g } ees2 r8. c16 |
        \tuplet 3/2 { ees8 f g } bes,8 c8~c4 r8. c16 |
      }

    }
  }
}


melodyPartC = \new Staff \melodyPart
melodyPartBb = \new Staff \transpose bes c' \melodyPart
melodyPartEb = \new Staff \transpose ees c \melodyPart
melodyPartF = \new Staff \transpose f c \melodyPart

bassC = \new Staff { \clef bass \transpose c c,, \bassPart }
bassBb = \new Staff { \clef treble \transpose bes c' \bassPart }
bassEb = \new Staff { \clef treble \transpose ees c \bassPart }
bassF = \new Staff { \clef treble \transpose f c \bassPart }

#(set-global-staff-size 24)

\book {
  \bookOutputName "get-up-stand-up-c"
  \header {
    title = \title
    composer = \composer
    tagline = \revisionInfo
    instrument = "Concert C" 
  }
  \score {
    <<
      \new StaffGroup <<
        \melodyPartC
        \bassC
      >>
    >>
    \layout {}
  }

  \explanationText
}

\book {
  \bookOutputName "get-up-stand-up-b-flat"
  \header {
    title = \title
    composer = \composer
    tagline = \revisionInfo
    instrument = \markup { B\flat }
  }
  \score {
    <<
      \new StaffGroup <<
        \melodyPartBb
        \bassBb
      >>
    >>
    \layout {}
  }

  \explanationText
}

\book {
  \bookOutputName "get-up-stand-up-e-flat"
  \header {
    title = \title
    composer = \composer
    tagline = \revisionInfo
    instrument = \markup { E\flat }
  }
  \score {
    <<
      \new StaffGroup <<
        \melodyPartEb
        \bassEb
      >>
    >>
    \layout {}
  }

  \explanationText
}

\book {
  \bookOutputName "get-up-stand-up-f"
  \header {
    title = \title
    composer = \composer
    tagline = \revisionInfo
    instrument = \markup { F }
  }
  \score {
    <<
      \new StaffGroup <<
        \melodyPartF
        \bassF
      >>
    >>
    \layout {}
  }

  \explanationText
}


