\version "2.12.0"

global = {
  \time 4/4
  \tempo 4 = 93 
%{  \tempo 4 = 185%}
}

Key = { \key ees \major }

\include "alto.ily"
\include "tenor1.ily"
\include "tenor2.ily"
\include "bari.ily"

\score {
  \new StaffGroup <<
    \new Staff = "alto" \altoSax
    \new Staff = "tenor1" \tenorSaxOne
    \new Staff = "tenor2" \tenorSaxTwo
    \new Staff = "bari" \bariSax
  >>
  \layout { }
  \midi { }
}