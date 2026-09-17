\version "2.26.0"
\pointAndClickOff

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%  A bass line to go under the background formula -- same 12-bar blues,
%%  same concert key.  Set the key here; everything else follows.
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

concertTonic = f

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  Nothing below here needs editing to change key.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#(define grid-roman-size 4.5)
#(define grid-column-width 18)
#(define grid-baseline 6.5)

%% Same helpers as blues-background-formula.ly, so the two sheets agree.
#(define (normalize-octave p)
   (ly:make-pitch 0 (ly:pitch-notename p) (ly:pitch-alteration p)))

#(define key-fifths (vector 0 2 4 -1 1 3 5))     % C D E F G A B
#(define semitones-above-c (vector 0 2 4 5 7 9 11))

#(define (key-accidentals p)
   (+ (vector-ref key-fifths (ly:pitch-notename p))
      (* 14 (ly:pitch-alteration p))))

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

%% ...and two octaves down, where the sousaphone lives.
#(define bass-tonic
   (ly:make-pitch -2
                  (ly:pitch-notename concert-tonic)
                  (ly:pitch-alteration concert-tonic)))

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

%%  The same 12-bar grid that sits on top of the formula sheet.
#(define blues-form
   '(((0 . #f) (0 . #f) (0 . #f) (0 . #f))
     ((3 . #f) (3 . #f) (0 . #f) (0 . #f))
     ((4 . "7") (3 . #f) (0 . #f) (0 . #f))))

#(define roman-numerals (vector "I" "II" "III" "IV" "V" "VI" "VII"))

#(define (form-cell-markup degree extension)
   (make-bold-markup
    (make-fontsize-markup
     grid-roman-size
     (make-concat-markup
      (cons (vector-ref roman-numerals degree)
            (if extension (list (make-super-markup extension)) '()))))))

#(define (form-grid-markup)
   (make-override-markup
    (cons 'baseline-skip grid-baseline)
    (make-column-markup
     (map (lambda (row)
            (make-concat-markup
             (map (lambda (cell)
                    (make-hcenter-in-markup
                     grid-column-width
                     (form-cell-markup (car cell) (cdr cell))))
                  row)))
          blues-form))))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  The line, written in C.
%%
%%  A two-bar riff.  The first bar climbs -- do me mi sol, the blues
%%  flat-3-to-3 on the way up -- and fills all four beats:
%%
%%      4  r8 8  4  4
%%
%%  The second bar answers on the clave: hits on 1, the and-of-2 and 4,
%%  with beat three off.  Same three notes coming back down, do sol me,
%%  so the pair is one idea said twice, the second time with a hole in it:
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
    c,4  r8 g,8    r4   ees,4  |  % 2   clave:  do sol me
    c,4  r8 ees,8  e,4  g,4    |  % 3
    c,4  r8 g,8    r4   bes,4  |  % 4   ...te instead of me, pulling to the IV
    \break
    f,4  r8 aes,8  a,4  c4     |  % 5
    f,4  r8 c8     r4   aes,4  |  % 6
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
  tagline = ##f
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
