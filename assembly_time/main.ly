
\version "2.22.2"


\header { 
  title = "Assembly Time"
  subtitle = "Chorus"
  composer = \markup { \smaller { for the } Lincoln Parent Band }
}

theChords = \chordmode {
  \set noChordSymbol = ""

  \partial 8 r8 |
  c2 f2 | f2 c2 | f2 c2 | g1 |
  f2 g2 | c2 a2:m | f2 g2 | c1 |
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
  r4 r8 b r d g4 |
  g2 b, |
  g4 gis a r |
  r1 |
  r8 g a4 c r4 |
}

middle = \relative c'' {
  \key c \major
  \partial 8 r8 |
  r1 |
  r1 |
  r1 |
  r4 r8 g r a b4 |
  a2 g |
  e4 d c r |
  r1 |
  r8 g' f4 e r4 |
}

bottom = \relative c' {
  \key c \major
  \partial 8 r8 |
  r1 |
  r1 |
  r1 |
  r2 r4 g,4 |
  c2 d |
  c4 b a r |
  r1 |
  r2 c4 c, |
}



\score {
  <<
    \new ChordNames { \theChords }

    \new Staff \new Voice = "melody" \melody

    \new Lyrics \lyricsto melody { \melodyLyrics }

     % \transpose bes c' 
     \new Staff \with {
       instrumentName = \markup { B \flat }
       midiInstrument = "trumpet"
     }
      \partCombine #'(2 . 3) \top \middle

     % \transpose ees c'' 
     \new Staff \with {
      instrumentName = \markup { E \flat }
      midiInstrument = "baritone sax"
    }
    {
      \clef "bass"
      \bottom
    }

  >>

   % \midi { \tempo 4 = 130 }
}
