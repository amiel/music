
\version "2.8.6"

#(set-global-staff-size 17)


\header{
%   composer          = "Amiel Martin"
  title             = "Stelle Salenti"
  subtitle          = "(Soaring Star)"
  tagline = \markup {
     Roadmap:
     A\super{1}
     \hspace #2
     A\super{2}
     \hspace #2
     B*4
     \hspace #2
     A\super{3}
     \hspace #2
     C*2
     \hspace #2
     A\super 2
     \hspace #2
     B*8
     \hspace #2
     A\super{3}
     \hspace #2
     C*2
     \hspace #2
     A\super{1}
  }

  maintainer        = "Amiel Martin"
  lastupdated       = "2012/05/20"
}

% It don't work...
% \paper {
%   between-system-padding = #1
% }

\layout {
%     indent = #0
  \context {
    \ChordNames
     \override ChordName #'font-size = #1
%      \override ChordName #'font-series = #'bold
  }
}