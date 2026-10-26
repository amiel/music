\version "2.26.0"
\pointAndClickOff

formulaTitle = "Blues Background Formula (with roots)"

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  The formula, written in C.  Everything else is a transposition of it.
%%
%%  An alternate to blues-background-formula.ly: the 9th of the IV and V
%%  brought down to the root, so every chord states its own root and
%%  spells a chord a non-jazz player recognizes on sight.
%%
%%    I   =  I6        1 3 5 6   of the key
%%    IV  =  IV7       1 b3 4 6  of the key -- the 5th, flat 7th, root
%%                     and 3rd of the IV, a complete dominant 7th
%%    V   =  V7sus4    1 2 4 5   of the key -- the 4th, 5th, flat 7th
%%                     and root of the V
%%
%%  Voiced close.  The 1 of the key sits on top and never moves; every
%%  other change moves two voices.
%%
%%  The tagged bottom note of each stack is the root, printed only on the
%%  concert bass-clef staff -- see blues-background-formula.ly.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

formulaNotes = {
  \key c \major
  \omit Staff.TimeSignature
  \cadenzaOn
  <\tag #'root c'  e'   g'  a'  c''>1  s1*2
  <\tag #'root f   ees' f'  a'  c''>1  s1*2
  <\tag #'root g   d'   f'  g'  c''>1
}

formulaChordNames = \chordmode {
  \cadenzaOn
  c1:6  s1*2  f1:7  s1*2  g1:7sus4
}

\include "_formula-sheet.ly"
