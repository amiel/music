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

concertTonic = f

%%  How much room there is to draw in.  The more sections share a page,
%%  the smaller everything has to be.
#(define formula-staff-size 37)
#(define formula-line-width 90)
#(define grid-roman-size 2.4)
#(define grid-hint-size -0.4)
#(define grid-column-width 11)
#(define grid-baseline 6)
#(define grid-top-offset 4.6)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Nothing below here needs editing to change key.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Every part -- concert or transposed -- gets its tonic dropped into the
%% octave above middle C, so no key and no transposition ever wanders off
%% into ledger lines.  Octave marks on concertTonic are therefore ignored.
#(define (normalize-octave p)
   (ly:make-pitch 0 (ly:pitch-notename p) (ly:pitch-alteration p)))

%% Transposing by interval can land a part in a key nobody wants to read
%% -- concert B puts the E-flat instruments in G-sharp major, eight sharps
%% -- so any key needing more than six accidentals gets respelled as its
%% enharmonic equivalent (G-sharp major becomes A-flat major).
#(define key-fifths (vector 0 2 4 -1 1 3 5))     % C D E F G A B
#(define semitones-above-c (vector 0 2 4 5 7 9 11))

#(define (key-accidentals p)
   (+ (vector-ref key-fifths (ly:pitch-notename p))
      (* 14 (ly:pitch-alteration p))))

%% The same sounding pitch spelled one letter name up (+1) or down (-1).
#(define (respell p direction)
   (let* ((semitones (modulo (+ (vector-ref semitones-above-c (ly:pitch-notename p))
                                (* 2 (ly:pitch-alteration p)))
                             12))
          (letter (modulo (+ (ly:pitch-notename p) direction) 7))
          (raw (/ (- semitones (vector-ref semitones-above-c letter)) 2)))
     (ly:make-pitch 0 letter
                    (cond ((> raw 1) (- raw 6))
                          ((< raw -1) (+ raw 6))
                          (else raw)))))

#(define (simplify-key p)
   (let ((accidentals (key-accidentals p)))
     (cond ((> accidentals 6) (respell p 1))
           ((< accidentals -6) (respell p -1))
           (else p))))

#(define concert-tonic (simplify-key (normalize-octave concertTonic)))

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

%% The 12-bar blues, as scale degrees rather than notes, so that one
%% description serves every key: (degree . seventh?), four bars to a row.
%%   I I I I | IV IV I I | V IV I I
#(define blues-form
   '(((0 . #f) (0 . #f) (0 . #f) (0 . #f))
     ((3 . #f) (3 . #f) (0 . #f) (0 . #f))
     ((4 . #t) (3 . #f) (0 . #f) (0 . #f))))

#(define roman-numerals (vector "I" "II" "III" "IV" "V" "VI" "VII"))

%% Degree 0/3/4 above the tonic is a unison/fourth/fifth up.
#(define (chord-root tonic degree)
   (ly:pitch-transpose tonic (ly:make-pitch 0 degree 0)))

#(define (chord-symbol-markup root seventh?)
   (make-concat-markup
    (cons (chord-root-namer root #f)
          (if seventh? (list (make-super-markup "7")) '()))))

%% One bar of the chart: roman numeral first -- that is the thing being
%% learned -- with the chord it works out to in this key as a hint.
#(define (grid-cell-markup tonic degree seventh?)
   (make-concat-markup
    (list (make-bold-markup
           (make-fontsize-markup grid-roman-size (vector-ref roman-numerals degree)))
          (make-hspace-markup 0.7)
          (make-fontsize-markup
           grid-hint-size (chord-symbol-markup (chord-root tonic degree) seventh?)))))

#(define (grid-markup tonic)
   (make-override-markup
    (cons 'baseline-skip grid-baseline)
    (make-column-markup
     (map (lambda (row)
            (make-concat-markup
             (map (lambda (cell)
                    (make-pad-to-box-markup
                     (cons 0 grid-column-width) '(0 . 0)
                     (grid-cell-markup tonic (car cell) (cdr cell))))
                  row)))
          blues-form))))

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
%%    V   =  V7    the same four notes as IV, over the V root
%%
%%  The degree numbers live in the note at the top of the page rather
%%  than on the staff -- printed beside the noteheads they crowd the
%%  close-voiced stacks badly.
%%
%%  The tagged bottom note of each stack is the root.  It is printed only
%%  on the concert bass-clef staff, where the sousaphone reads it; every
%%  other part gets \removeWithTag and shows the four harmony notes alone.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

formulaNotes = {
  \key c \major
  \omit Staff.TimeSignature
  \cadenzaOn
  <\tag #'root \tweak font-size #-3 c'  e'  g'  a'  c''>1  s1*2
  <\tag #'root \tweak font-size #-3 f   d'  f'  a'  c''>1  s1*2
  <\tag #'root \tweak font-size #-3 g   d'  f'  a'  c''>1
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
         \hspace #2
         %% nudged down so the first row of the grid meets the top of the staff
         \column { \vspace #grid-top-offset #(grid-markup (written-tonic from to)) }
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
  %% to fill it.  2 is what the tightest keys need to stay on one page.
  markup-markup-spacing.padding = #2
}

\header {
  title = "Blues Background Formula"
  subtitle = \markup \concat {
    "Harmonizing improvised backgrounds over a 12-bar blues in concert "
    #(pitch-name-markup concert-tonic)
  }
  tagline = ##f
}


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
