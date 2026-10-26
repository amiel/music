\version "2.26.0"
\pointAndClickOff

\include "_bass-line.ly"

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  The page
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\paper {
  #(set-paper-size "letter")
  top-margin = 11\mm
  bottom-margin = 9\mm
  left-margin = 13\mm
  right-margin = 13\mm
  markup-markup-spacing.padding = #3
  %% with the text gone, let the three systems spread down the page
  ragged-last-bottom = ##f
}

\header {
  title = "12-bar blues bass line"
  tagline = \revisionInfo
}

\markup \vspace #0.2
\markup \fill-line { #(form-grid-markup) }
\markup \vspace #0.8

\score {
  <<
    \new ChordNames \with { chordChanges = ##t }
      \transpose c, #bass-tonic \bassChords
    \new Staff \with { midiInstrument = "tuba" }
      \transpose c, #bass-tonic \bassLine
  >>
  \layout {
    #(layout-set-staff-size 40)
    system-system-spacing.padding = #16
    indent = 0
    ragged-right = ##f
    \context {
      \Score
      \omit MetronomeMark
      %% number every bar, so the line and the grid can be read together
      barNumberVisibility = #all-bar-numbers-visible
      \override BarNumber.break-visibility = #end-of-line-invisible
    }
    \context {
      \ChordNames
      chordRootNamer = #chord-root-namer
      \override ChordName.font-size = #1
    }
  }
  \midi { }
}
