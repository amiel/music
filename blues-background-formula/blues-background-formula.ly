\version "2.26.0"
\pointAndClickOff

formulaTitle = "Blues Background Formula"

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  The formula, written in C.  Everything else is a transposition of it.
%%
%%    I   =  I6        1 3 5 6   of the key
%%    IV  =  IV9       1 b3 5 6  of the key -- the 5th, flat 7th, 9th and
%%                     3rd of the IV, root omitted
%%    V   =  V9sus4    1 2 4 6   of the key -- the 4th, 5th, flat 7th and
%%                     9th of the V
%%
%%  Voiced close so each change moves as little as possible: 1 and 6 sit
%%  on top and never move; the IV lowers one voice a half step, and the V
%%  lowers two.
%%
%%  The degree numbers live in the note at the top of the page rather
%%  than on the staff -- printed beside the noteheads they crowd the
%%  close-voiced stacks badly.
%%
%%  The tagged bottom note of each stack is the root.  It is printed only
%%  on the concert bass-clef staff, where the sousaphone reads it -- it is
%%  their note, so it is drawn full size.  Every other part gets
%%  \removeWithTag and shows the four harmony notes alone.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

formulaNotes = {
  \key c \major
  \omit Staff.TimeSignature
  \cadenzaOn
  <\tag #'root c'  e'  g'  a'  c''>1  s1*2
  <\tag #'root f   ees' g'  a'  c''>1  s1*2
  <\tag #'root g   d'   f'  a'  c''>1
}

formulaChordNames = \chordmode {
  \cadenzaOn
  c1:6  s1*2  f1:9  s1*2  g1:9sus4
}

\include "_formula-sheet.ly"
