% \relative c' {
%   \clef treble  % Sets the clef to treble
%   \time 4/4     % Sets the time signature to 4/4
%   \key c \major % Sets the key signature to C major

%   \bar "|."
% }


upper = \relative c'' {
  \clef treble
  \key c \major
  \time 4/4

  g8[ f] e d e4 c |
  e8[ d] e f g2 |
  g8[ f] e d e4 c |
  e8[ f] e d c2 |

   \bar "|."
}

lower = \relative c {
  \clef bass
  \key c \major
  \time 4/4

  <c g>2
  <c g> |
  <c g>
  <c g> |
<c g>2
  <c g> |
  <c g>
  <c g> |


   \bar "|."
}

\score {
  \new PianoStaff <<
    \set PianoStaff.instrumentName = #"Piano  "
    \new Staff = "upper" \upper
    \new Staff = "lower" \lower
  >>
  \layout { }
  \midi { }
}
