
\version "2.8.6"

\header{
%   composer          = "Amiel Martin"
  title             = \markup { "Stelle Salenti" \medium{ (Soaring Star) } }
%   subtitle          = "(Soaring Star)"
  tagline = \markup {
         Structure:
         A\small\raise #1 {1}
         \hspace #2
         A\small\raise #1 {2}
         \hspace #2
         B*4
         \hspace #2
         A\small \raise #1 3
         \hspace #2
         C*2
         \hspace #2
         A\small \raise #1 2
         \hspace #2
         B*8
         \hspace #2
         A \small \raise #1 3
         \hspace #2
         C*2
         \hspace #2
         A \small \raise #1 1
      }


  instrument = "C Instruments"

  maintainer        = "Amiel Martin"
  lastupdated       = "2012/05/20"

}


\layout {
%     indent = #0
  \context { \ChordNames
     \override ChordName #'font-size = #1
%      \override ChordName #'font-series = #'bold
  }
}