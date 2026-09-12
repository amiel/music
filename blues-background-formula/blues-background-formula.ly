\version "2.26.0"
\pointAndClickOff

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%  CONFIGURATION -- this is the only thing you need to change.
%%
%%  Set the concert key of the whole sheet.  Every transposition, every
%%  chord symbol, the grid and the titles are all derived from this one
%%  pitch, so changing it reprints the whole page in the new key.
%%
%%  LilyPond pitch names: c d e f g a b, with "es" for flat and "is"
%%  for sharp -- bes = B-flat, ees = E-flat, fis = F-sharp.  Octave
%%  marks are ignored; the formula always lands in a readable register.
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

concertTonic = d'

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Nothing below here needs editing to change key.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Every part -- concert or transposed -- gets its tonic dropped into the
%% octave above middle C, so no key and no transposition ever wanders off
%% into ledger lines.  Octave marks on concertTonic are therefore ignored.
#(define (normalize-octave p)
   (ly:make-pitch 0 (ly:pitch-notename p) (ly:pitch-alteration p)))

#(define concert-tonic (normalize-octave concertTonic))

%% Spell a pitch with a real flat/sharp sign, for titles and headings.
#(define (pitch-name-markup p)
   (let* ((letters (vector "C" "D" "E" "F" "G" "A" "B"))
          (letter (vector-ref letters (ly:pitch-notename p)))
          (alt (ly:pitch-alteration p)))
     (make-concat-markup
      (list letter
            (cond ((= alt -1) (make-doubleflat-markup))
                  ((= alt -1/2) (make-flat-markup))
                  ((= alt 1/2) (make-sharp-markup))
                  ((= alt 1) (make-doublesharp-markup))
                  (else ""))))))

%% Same idea for chord symbols.  LilyPond's stock accidental crowds the
%% letter it follows at small staff sizes, so spell chord roots by hand.
#(define (chord-root-namer pitch lowercase?)
   (let* ((letters (vector "C" "D" "E" "F" "G" "A" "B"))
          (letter (vector-ref letters (ly:pitch-notename pitch)))
          (alt (ly:pitch-alteration pitch)))
     (if (= alt 0)
         (make-simple-markup letter)
         (make-concat-markup
          (list letter
                (make-hspace-markup 0.25)
                (make-raise-markup
                 0.4
                 (make-fontsize-markup
                  -3
                  (cond ((= alt -1) (make-doubleflat-markup))
                        ((= alt -1/2) (make-flat-markup))
                        ((= alt 1/2) (make-sharp-markup))
                        (else (make-doublesharp-markup))))))))))

%% The written tonic for an instrument pitched so that concert `from'
%% is written as `to'.
#(define (written-tonic from to)
   (normalize-octave (ly:pitch-transpose concert-tonic (ly:pitch-diff to from))))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  The formula, written in C.  Everything else is a transposition of it.
%%
%%    I   =  I6    3 5 6 1  (bottom to top)
%%    IV  =  IV6   6 1 3 5  (bottom to top)
%%    V   =  V7    the same four notes as IV, over the V root
%%
%%  The small bottom note of each stack is the root -- tuba/sousaphone.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

formulaNotes = {
  \key c \major
  \omit Staff.TimeSignature
  \cadenzaOn
  <\tweak font-size #-3 c'  e'-3  g'-5  a'-6  c''-1>1  s1*2
  <\tweak font-size #-3 f   d'-6  f'-1  a'-3  c''-5>1  s1*2
  <\tweak font-size #-3 g   d'    f'    a'    c''   >1
}

formulaChordNames = \chordmode {
  \cadenzaOn
  c1:6  s1*2  f1:6  s1*2  g1:7
}

formulaRomans = \lyricmode {
  \markup \bold "I"  1  \skip 1*2
  \markup \bold "IV" 1  \skip 1*2
  \markup \bold "V"  1
}

%% 12-bar blues:  I I I I | IV IV I I | V IV I I
gridLineOne   = \chordmode { c1:6  c:6  c:6  c:6 }
gridLineTwo   = \chordmode { f1:6  f:6  c:6  c:6 }
gridLineThree = \chordmode { g1:7  f:6  c:6  c:6 }

%% ...and the same material in the chosen concert key.
concertNotes      = \transpose c' #concert-tonic \formulaNotes
concertChordNames = \transpose c' #concert-tonic \formulaChordNames
concertGridOne    = \transpose c' #concert-tonic \gridLineOne
concertGridTwo    = \transpose c' #concert-tonic \gridLineTwo
concertGridThree  = \transpose c' #concert-tonic \gridLineThree

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Layouts
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

gridLayout = \layout {
  #(layout-set-staff-size 13)
  indent = 0
  line-width = 64\mm
  ragged-right = ##f
  \context {
    \Score
    \omit BarNumber
    %% four bars to a line, always
    \override NonMusicalPaperColumn.line-break-permission = ##f
  }
  \context { \ChordGrid chordRootNamer = #chord-root-namer }
}

formulaLayout = \layout {
  #(layout-set-staff-size 30)
  indent = 0
  line-width = 92\mm
  ragged-right = ##f
  \context { \Score \omit BarNumber }
  \context {
    \Staff
    fingeringOrientations = #'(left)
    \override Fingering.font-size = #-4
    \override Fingering.padding = #0.3
    %% keep each number beside its own notehead instead of letting
    %% LilyPond spread the column apart to avoid the digits touching
    \override FingeringColumn.padding = #0
  }
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
#(define-scheme-function (heading instruments from to bass)
     (markup? markup? ly:pitch? ly:pitch? boolean?)
   #{
     \markup {
       \fill-line {
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
           \fontsize #-2 \italic #instruments
           \vspace #0.3
           \score {
             <<
               \new Lyrics \with {
                 \override VerticalAxisGroup.staff-affinity = #DOWN
               } \formulaRomans
               \new ChordNames \transpose #concert-tonic #(written-tonic from to) \concertChordNames
               \new Staff \transpose #concert-tonic #(written-tonic from to) \concertNotes
               #(if bass
                    #{ \new Staff \with { \omit Fingering }
                         { \clef bass \transpose c' c \concertNotes } #}
                    #{ #})
             >>
             \formulaLayout
           }
         }
         \hspace #2
         \column {
           \score { \new ChordGrid \transpose #concert-tonic #(written-tonic from to) \concertGridOne   \gridLayout }
           \score { \new ChordGrid \transpose #concert-tonic #(written-tonic from to) \concertGridTwo   \gridLayout }
           \score { \new ChordGrid \transpose #concert-tonic #(written-tonic from to) \concertGridThree \gridLayout }
         }
       }
     }
   #})

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  The page
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\paper {
  #(set-paper-size "letter")
  top-margin = 11\mm
  bottom-margin = 9\mm
  left-margin = 13\mm
  right-margin = 13\mm
  markup-system-spacing.padding = #1
}

\header {
  title = "Blues Background Formula"
  subtitle = \markup \concat {
    "Harmonizing improvised backgrounds over a 12-bar blues in concert "
    #(pitch-name-markup concert-tonic)
  }
  tagline = ##f
}

\markup \fill-line {
  \column {
    \fontsize #-1 \override #'(baseline-skip . 2.6) \column {
      \line { \bold "How it works:"
              "one person makes up a background rhythm on the tonic; everyone repeats it." }
      \line { "Next time around each player picks" \italic any
              "one note out of the formula and moves it with the chords of the blues." }
      \line { \concat { \bold "I" \super 6 } "= 3 5 6 1" \bold "·"
              \concat { \bold "IV" \super 6 } "= 6 1 3 5" \bold "·"
              \concat { \bold "V" \super 7 } "= the same four notes as IV"
              \concat { "(5 " \flat "7 9 11 over the V root)." } }
      \line { "The small bottom note of each stack is the root — tuba/sousaphone."
              "Horns choose from the four numbered notes above it." }
    }
  }
}

\markup \vspace #0.4

\keyBlock "C"
          \markup "flute · bells · trombone · sousaphone — bass clef reads the lower staff"
          c' c' ##t

\keyBlock \markup \concat { "B" \flat }
          \markup "trumpet · clarinet · soprano & tenor sax · baritone · bass sax"
          bes c' ##f

\keyBlock \markup \concat { "E" \flat }
          \markup "alto sax · bari sax"
          ees c' ##f

\keyBlock "F"
          \markup "french horn"
          f c' ##f
