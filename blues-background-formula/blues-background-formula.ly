\version "2.26.0"
\pointAndClickOff

\include "_form.ly"

%%  How big this sheet is drawn.  The concert key and the grid's size
%%  live in _form.ly, shared with blues-bass-line.ly.
#(define formula-staff-size 31)
#(define formula-line-width 168)

%% The written tonic for an instrument pitched so that concert `from'
%% is written as `to'.
#(define (written-tonic from to)
   (simplify-key
    (normalize-octave (ly:pitch-transpose concert-tonic (ly:pitch-diff to from)))))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  The formula, written in C.  Everything else is a transposition of it.
%%
%%    I   =  I6    3 5 6 1  (bottom to top)
%%    IV  =  IV6   6 1 3 5  (bottom to top)
%%    V   =  V11   the same four notes as IV, over the V root -- which
%%                 makes them the 5th, flat 7th, 9th and 11th of the V
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
  <\tag #'root f   d'  f'  a'  c''>1  s1*2
  <\tag #'root g   d'  f'  a'  c''>1
}

formulaChordNames = \chordmode {
  \cadenzaOn
  c1:6  s1*2  f1:6  s1*2  g1:11
}

formulaRomans = \lyricmode {
  \markup \bold "I"  1  \skip 1*2
  \markup \bold "IV" 1  \skip 1*2
  \markup \bold "V"  1
}

%% ...and the same material in the chosen concert key.
concertNotes      = \transpose c' #concert-tonic \formulaNotes
concertChordNames = \transpose c' #concert-tonic \formulaChordNames

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Layouts
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

formulaLayout = \layout {
  #(layout-set-staff-size formula-staff-size)
  indent = 0
  line-width = #(* formula-line-width mm)
  ragged-right = ##f
  \context { \Score \omit BarNumber }
  \context {
    \ChordNames
    chordRootNamer = #chord-root-namer
    \override ChordName.font-size = #1
  }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  One key block: the formula on the left, the 12-bar grid on the right.
%%
%%  `from'/`to' give the instrument's transposition the usual LilyPond
%%  way -- concert `from' is written as `to'.  `bass' adds a bass-clef
%%  staff an octave down, for the trombone/sousaphone end of the band.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

keyBlock =
#(define-scheme-function (heading from to bass)
     (markup? ly:pitch? ly:pitch? boolean?)
   #{
     \markup {
       \left-column {
           \line {
             \bold \fontsize #2 #heading
             \hspace #0.8
             \normal-text \fontsize #-1 \concat {
               "(written in "
               #(pitch-name-markup (written-tonic from to))
               ")"
             }
           }
         \vspace #0.3
         \score {
           <<
             \new Lyrics \with {
               \override VerticalAxisGroup.staff-affinity = #DOWN
               \override VerticalAxisGroup.nonstaff-relatedstaff-spacing.padding = #1.2
             } \formulaRomans
             \new ChordNames \transpose #concert-tonic #(written-tonic from to) \concertChordNames
             \new Staff \removeWithTag #'root
               \transpose #concert-tonic #(written-tonic from to) \concertNotes
             #(if bass
                  #{ \new Staff
                       { \clef bass \transpose c' c \concertNotes } #}
                  #{ #})
           >>
           \formulaLayout
         }
       }
     }
   #})

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  The page
%%
%%  No how-it-works note here on purpose: leaving it off buys enough room
%%  to draw everything larger, and the explanation travels with the sheet
%%  in the email instead.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\paper {
  #(set-paper-size "letter")
  top-margin = 11\mm
  bottom-margin = 9\mm
  left-margin = 13\mm
  right-margin = 13\mm
  markup-system-spacing.padding = #1
  %% the air between key blocks is what separates them -- there is no rule.
  %% This is a minimum; on a page with room to spare the blocks spread out
  %% to fill it.  3 is as much as the tightest keys can afford and still
  %% stay on one page.
  markup-markup-spacing.padding = #3
}

\header {
  title = "Blues Background Formula"
  subtitle = \markup \concat {
    "Harmonizing improvised backgrounds over a 12-bar blues in concert "
    #(pitch-name-markup concert-tonic)
  }
  tagline = ##f
}


%%  The 12-bar form, once: roman numerals only, the same in every key.
\markup \vspace #0.2
\markup \fill-line { #(form-grid-markup) }
\markup \vspace #0.6

\keyBlock "C"  c' c' ##t

\keyBlock \markup \concat { "B" \flat }  bes c' ##f

\keyBlock \markup \concat { "E" \flat }  ees c' ##f

\keyBlock "F"  f c' ##f
