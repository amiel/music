
\version "2.22.2"


\header { 
  title = "Iko Iko Tag"
  tagline = "in F"
}

theChords = \chordmode {
  \set noChordSymbol = ""

  ees1
}


melody = \relative c' {
  \key f \major

  ees4 r8  ges g bes c bes |
  ees8 ees4 ges8~ges4 r4 |
  <ges ees>8 <ges ees>4 ees8~ees2 |
  r4 <ees, ges bes>4 <ees ges bes> r4 |
}


\pointAndClickOff

\book {
  \header { 
    subtitle = \markup { C treble instruments }
  }

  \layout { }

  \bookOutputName "iko-iko-tag-c-treble"
  \score { 
    <<
      \new ChordNames { \theChords }

      \new Staff \new Voice = "melody" \melody
    >>
  }
}

\book {
  \header { 
    subtitle = \markup { C bass instruments }
  }

  \layout { }

  \bookOutputName "iko-iko-tag-c-bass"
  \score { 
    <<
      \new ChordNames { \theChords }

      \transpose c c,,
      \new Staff \new Voice = "melody"
      {
        \clef "bass"
        \melody
      }

    >>
  }
}


\book {
  \header { 
    subtitle = \markup { B \flat treble instruments }
  }

  \layout { }

  \bookOutputName "iko-iko-tag-b-flat-treble"
  \score { 
    <<
      \transpose bes c' 
      \new ChordNames { \theChords }

      \transpose bes c' 
      \new Staff \new Voice = "melody" \melody
    >>
  }
}

\book {

  \header { 
    subtitle = \markup { E \flat treble instruments }
  }

  \layout { }

  \bookOutputName "iko-iko-tag-e-flat-treble"
  \score { 
    <<
      \transpose ees c 
      \new ChordNames { \theChords }

      \transpose ees c 
      \new Staff \new Voice = "melody" \melody
    >>
  }
}


