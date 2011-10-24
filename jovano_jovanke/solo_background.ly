\header{
  filename = "test.ly"
  composer          = "Amiel Martin"
  title             = "Jovano Jovanke"
  subtitle          = "Solo background part"

  copyright         = "Creative Commons Attribution-ShareAlike 2.5"
  maintainer        = "Amiel Martin"
  lastupdated       = "2011/10/20"
}

\version "2.8.6"

chordnames = \relative c {
  c8 c c c4 b
}

%   \autoBeamOn
%   \set Staff.beatGrouping = #'(3 2 2)

rhythmpart = \relative c' {
  \set Staff.instrumentName = #"Rhythm"
  \clef percussion

  e8 r r  r4   e8 r |
  e8 r r  r4   e8 r |

}

bass = \relative c {
  \set Staff.instrumentName = #"Bass"
  \clef bass

  e4  r8  b4   d4   |
  e4  r8  b4   d4   |
}



\score {
  <<
    \time 7/8

    \chords {
      \set chordChanges = ##t
      \chordnames
    }
    \new RhythmicStaff = "rhythm" \rhythmpart
    \new Staff = "Bass" \bass
  >>
}