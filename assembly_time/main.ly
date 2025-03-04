
\version "2.22.2"


\header { 
  title = "Assembly Time"
  subtitle = "Chorus"
  tagline = \markup { \smaller { for the } Lincoln Parent Band }
}

theChords = \chordmode {
  \set noChordSymbol = ""

  \partial 8 r8 |
  c2 f2 | f2 c2 | f2 c2 | g1 |
  f1 | c2 a2:m | f2 g2 | c1 |
}


melodyLyrics = \lyricmode {
  A -- | sse -- mb -- ly time,
  a -- | sse -- mb -- ly time,
  come on in and | sing |
  Lin -- coln fam -- i -- ly, |
  ga -- ther 'round, 
  a -- | sse -- mb -- ly time is here
}

melody = \relative c'' {
  \key c \major
  \partial 8 g8 |
  g8 g g a~a4 r8 a8 |
  a8 a a g~g4 r4 |
  c8 c4 c4 r8 a4 |
  g2 r2 |
  c8 c4 c4 c8 a4 |
  g4 g a r8 a8 |
  g8 g g g~g4 e |
  c2 r2 |
}

top = \relative c'' {
  \key c \major
  \partial 8 r8 |
  r1 |
  r1 |
  r1 |
  r4 r8\mf g r a b4 |
  c2\p a |
  g4 gis a r |
  r1 |
  r8\f g a4 c r4 |
}

middle = \relative c' {
  \key c \major
  \partial 8 r8 |
  r1 |
  r1 |
  r1 |
  r4 r8\mf b r d g4 |
  a2\p f |
  e4\mp\< d c \! r |
  r1 |
  r8\f g' f4 e r4 |
}

bottom = \relative c' {
  \key c \major
  \partial 8 r8 |
  r1 |
  r1 |
  r1 |
  r4 r8\mf d r c g4 |
  f2\p c'4 f,4 |
  c'4\mp\< b a \! r |
  r1 |
  r8\f b d4 c4 c, |
}


\pointAndClickOff

\book {
  \bookOutputName "main"

  \score { 
    <<
      \new Staff \melody
       \new Staff \with { midiInstrument = "trumpet" } \top
       \new Staff \with { midiInstrument = "clarinet" } \middle
       \new Staff \with { midiInstrument = "trombone" } \bottom
    >>
  \midi { \tempo 4 = 130 }
  }
}

\book {

  \header { 
    subtitle = \markup { Chorus in concert pitch }
  }

  \layout { }

  \bookOutputName "assembly-time-concert"
  \score { 
    <<
      \new ChordNames { \theChords }

      \new Staff \new Voice = "melody" \melody
   
      \new Lyrics \lyricsto melody { \melodyLyrics }

        % \transpose bes c' 
       \new Staff \with {
         instrumentName = \markup { middle parts }
       }
        \partCombine #'(2 . 3) \top \middle

        % \transpose ees c'' 
       \new Staff \with {
         instrumentName = \markup { low part }
      }
      {
        \clef "bass"
        \bottom
      }
    >>
  }
}


\book {

  \header { 
    subtitle = \markup { Chorus for B \flat parts }
  }


  \layout{}
  \bookOutputName "assembly-time-b-flat"
  \score { 
    <<
        \transpose bes c' 
      \new ChordNames { \theChords }

        \transpose bes c' 
      \new Staff \new Voice = "melody" \melody
   
      \new Lyrics \lyricsto melody { \melodyLyrics }

        \transpose bes c' 
       \new Staff \with {
         instrumentName = \markup { middle parts }
       }
        \partCombine #'(2 . 3) \top \middle

        \transpose bes c''
       \new Staff \with {
         instrumentName = \markup { low part }
      }
      {
        \bottom
      }

    >>
  }
}


\book {

  \header { 
    subtitle = \markup { Chorus for E \flat parts }
  }

  \layout{}
  \bookOutputName "assembly-time-e-flat"
  \score { 
    <<
        \transpose ees c' 
      \new ChordNames { \theChords }

        \transpose ees c' 
      \new Staff \new Voice = "melody" \melody
   
      \new Lyrics \lyricsto melody { \melodyLyrics }

        \transpose ees c' 
       \new Staff \with {
         instrumentName = \markup { middle parts }
       }
        \partCombine #'(2 . 3) \top \middle

        \transpose ees c'
       \new Staff \with {
         instrumentName = \markup { low part }
      }
      {
        \bottom
      }

    >>
  }
}

