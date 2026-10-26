\version "2.26.0"

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%  The formula sheet's page, shared by every version of the formula.
%%  The including file defines, in C, before including this:
%%
%%    formulaNotes        the three stacks, root tagged 'root
%%    formulaChordNames   their chord symbols
%%    formulaTitle        the sheet's title
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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

formulaRomans = \lyricmode {
  \markup \bold "I"  1  \skip 1*2
  \markup \bold "IV" 1  \skip 1*2
  \markup \bold "V"  1
}

%% The formula in the chosen concert key.
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
  %% to fill it.  2.75 is as much as the tightest keys can afford and
  %% still stay on one page with the revision line at the foot.
  markup-markup-spacing.padding = #2.75
}

\header {
  title = \formulaTitle
  subtitle = \markup \concat {
    "Harmonizing improvised backgrounds over a 12-bar blues in concert "
    #(pitch-name-markup concert-tonic)
  }
  tagline = \revisionInfo
}


%%  The 12-bar form, once: roman numerals only, the same in every key.
\markup \vspace #0.2
\markup \fill-line { #(form-grid-markup) }
\markup \vspace #0.6

\keyBlock "C"  c' c' ##t

\keyBlock \markup \concat { "B" \flat }  bes c' ##f

\keyBlock \markup \concat { "E" \flat }  ees c' ##f

\keyBlock "F"  f c' ##f
