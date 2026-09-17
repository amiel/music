\version "2.26.0"
\pointAndClickOff

\include "_form.ly"

%% concert-tonic lands in the octave above middle C; the sousaphone reads
%% two octaves down from there.
#(define bass-tonic
   (ly:make-pitch -2
                  (ly:pitch-notename concert-tonic)
                  (ly:pitch-alteration concert-tonic)))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  The line, written in C.
%%
%%  A two-bar riff.  The first bar climbs -- do me mi sol, the blues
%%  flat-3-to-3 on the way up -- and fills all four beats:
%%
%%      4  r8 8  4  4
%%
%%  The second bar answers on the clave: hits on 1, the and-of-2 and 4,
%%  with beat three off -- do sol mi, the climb's notes coming back down.
%%  The flat 3 only works going past it; landing on it on beat 4 with
%%  nowhere to go rubs against the natural 3 in the backgrounds' 6 chord,
%%  so the clave bar takes the major third instead:
%%
%%      4  r8 8  r4 4
%%
%%  The riff sits on whatever chord the bar is on, so the shape never
%%  changes -- only the root it starts from.
%%
%%  Bar 4 swaps the clave bar's last note, the flat 3, for the flat 7,
%%  which pulls into the IV.
%%
%%  Bars 9 and 10 both climb -- the V and the IV get the same figure and
%%  just step down from one to the other, the way that pair of bars
%%  usually goes.
%%
%%  The two bars that end a phrase walk up chromatically into the next
%%  chord instead of answering: bar 8 into the V, from the 3rd, and bar
%%  12 into the I, from the flat 7 below it.  Bar 12 takes beat two off
%%  first, so the chorus stops and picks itself up rather than grooving
%%  straight through -- and there is a breath before the top.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

bassLine = {
  \key c \major
  \clef bass
  \time 4/4
  %% printed tempo is hidden (the feel is stated above the score); this
  %% is here so the \midi block plays back at the right speed
  \tempo 4 = 104
  \repeat volta 2 {
    c,4  r8 ees,8  e,4  g,4    |  % 1   climb:  do me mi sol
    c,4  r8 g,8    r4   e,4    |  % 2   clave:  do sol mi
    c,4  r8 ees,8  e,4  g,4    |  % 3
    c,4  r8 g,8    r4   bes,4  |  % 4   ...te instead of mi, pulling to the IV
    \break
    f,4  r8 aes,8  a,4  c4     |  % 5
    f,4  r8 c8     r4   a,4    |  % 6
    c,4  r8 ees,8  e,4  g,4    |  % 7
    c,4  r8 e,8    f,4  fis,4  |  % 8   fill: walk up into the V
    \break
    g,4  r8 bes,8  b,4  d4     |  % 9   V and IV climb the same way,
    f,4  r8 aes,8  a,4  c4     |  % 10  stepping down from one to the other
    c,4  r8 ees,8  e,4  g,4    |  % 11
    c,4  r4 bes,,4 b,,4        |  % 12  stop, breathe, walk back up into the I
  }
}

bassChords = \chordmode {
  c1 c c c  |  f f c c  |  g:7 f c c
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  The page
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\paper {
  #(set-paper-size "letter")
  top-margin = 11\mm
  bottom-margin = 9\mm
  left-margin = 13\mm
  right-margin = 13\mm
  markup-markup-spacing.padding = #3
  %% with the text gone, let the three systems spread down the page
  ragged-last-bottom = ##f
}

\header {
  title = "12-bar blues bass line"
  tagline = \revisionInfo
}

\markup \vspace #0.2
\markup \fill-line { #(form-grid-markup) }
\markup \vspace #0.8

\score {
  <<
    \new ChordNames \with { chordChanges = ##t }
      \transpose c, #bass-tonic \bassChords
    \new Staff \with { midiInstrument = "tuba" }
      \transpose c, #bass-tonic \bassLine
  >>
  \layout {
    #(layout-set-staff-size 40)
    system-system-spacing.padding = #16
    indent = 0
    ragged-right = ##f
    \context {
      \Score
      \omit MetronomeMark
      %% number every bar, so the line and the grid can be read together
      barNumberVisibility = #all-bar-numbers-visible
      \override BarNumber.break-visibility = #end-of-line-invisible
    }
    \context {
      \ChordNames
      chordRootNamer = #chord-root-namer
      \override ChordName.font-size = #1
    }
  }
  \midi { }
}
