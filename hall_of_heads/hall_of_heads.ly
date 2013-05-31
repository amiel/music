\version "2.12.0"

global = {
  \time 4/4
  \tempo 4 = 93
}

\layout {
  \context {
    \Score
    skipBars = ##t
%     midiInstrument = #"french horn
%     try to mimic Breitkopf
    \override RehearsalMark #'padding = #1
    \override MultiMeasureRest #'padding = #0.5
    restNumberThreshold = #1

    \override RehearsalMark #'font-series = #'bold
    \override RehearsalMark #'font-size = #4.5

    \override Beam #'thickness = #0.6
    \override Beam #'space-function = #(lambda (beam mult) 0.8)
  }
  \context {
    \Staff
    \override VerticalAxisGroup #'minimum-Y-extent = #'(-2.5 . 3.5)
  }
}



Key = { \key ees \major }

\include "alto.ily"
\include "clar.ily"
\include "horn.ily"
\include "bari.ily"

\score {
  \new StaffGroup <<
    \new Staff = "alto" \altoSax
    \new Staff = "clar" \clarinet
    \new Staff = "horn" \horn
    \new Staff = "bari" \bariSax
  >>
%{  \midi { }%}
}
