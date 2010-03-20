\version "2.12.0"


  
\header {
  title = "''No Fast'' Funk"
  composer = "R. Peterson"
}


highpart =  \context Voice  \relative c'' {
  f4 f8. d16( d2) |
  f8 d16 a' r f[ r d]( d8.) a16 c d r8 |
  g4 f8. d16( d8.) a16 c d8. |
  f4 c d2 |
  f4 f8. d16( d2) |
  f8 d16 a' r f[ r d]( d8.) a16 c d r8 |
  g4 f8. d16( d8.) a16 c d8. |
  d'1 |
  d,,4-^ r4 r2 |
}


global = {
  \time 4/4
  \key c \major
  \clef treble
}


sarabandeCelloStaff = \context Staff <<
  \highpart
  \global
>>



\book {
  \score{
    \sarabandeCelloStaff
    \layout { }
    


    \header{
      opus = "" 
      piece ="the High Part at A" }
  }
}

