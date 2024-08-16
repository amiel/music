\version "2.24.4"

\header {
  title = "Westcoast Lullaby"
  composer = "Roger Holdstock"
  % Remove default LilyPond tagline
  tagline = ##f
}

\layout {
  indent = 0.0

  \context {
    \Score
    \remove "Bar_number_engraver"
  }
}


chorus = \lyricmode {
  ""4 Go8 to sleep4 now | don't4 you cry2 | \break

  ""4 Here's8 your west4 -- coast | lull -- a -- by2 | \break

  Fish4 won't swim2 | birds4 won't fly2 | \break

  ""2 Until4 the | morn4 -- ing when4 you | \break
  rise1 | ""1 | \break
}

verseI = \lyricmode {
  ""4 Birds8 have flown4 home | to their nest2 | \break

  ""4 You8 know we all4 could8 | use4 some rest2 | \break

  Close4 your eyes2 | day4 is done2 |

  \time 2/4 ""2 \time 4/4 | \break

  Sleep4 now til the | mor2 -- _4 ning | comes2 ""2 | \break
}

verseII = \lyricmode {
  Halyards humming in the breeze \break
  Sailboats resting from the seas \break
  City sailors home once more \break
  To sleep in bed safe on the shore \break
}


verseIII = \lyricmode {
  Moon is rising on the bay \break
  Ski run lights shine far away \break
  Between the clouds a star breaks through \break
  All are watching over you \break
}

chorusChords = \chordmode {
 e2 e | a b | \break
 cis:m cis:m | a b | \break
 a b | e a | \break
 a a | a b | \break
 e e | e e | \break
}

verseChords = \chordmode {
  a2 b | e cis:m | \break
  fis:m fis:m | b b | \break

  a b | e a |

  \time 2/4 a \time 4/4 | \break

  a a | b b | b b |  \break
}


{
  <<
    \new ChordNames
    % \with {
    %   \override BarLine.bar-extent = #'(-2 . 2)
    %   \consists "Bar_engraver"
    % }
    {
      \chorusChords
      \verseChords
    }

    \new Lyrics = "lyrics" {
      \chorus

      \verseI
    }

  >>
}
