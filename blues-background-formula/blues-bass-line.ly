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
%%  One cell, three notes, every bar: the root on 1, the 5th on the
%%  and-of-2, the 6th on 3, and beat 4 off to breathe.  The 5th and 6th
%%  go up from the I and down from the IV and V, which keeps the whole
%%  line inside a ninth and makes the three chords sound different from
%%  each other without changing the rule.
%%
%%  Three bars break the pattern, and they are the three that mark the
%%  form: bar 4 swaps the 6th for the flat 7th to pull to the IV, bar 8
%%  walks up chromatically into the V, and bar 12 turns it around and
%%  lands on the 5th, which is the V root, to send it back to the top.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

bassLine = {
  \key c \major
  \clef bass
  \time 4/4
  %% printed tempo is hidden (the feel is stated above the score); this
  %% is here so the \midi block plays back at the right speed
  \tempo 4 = 104
  \repeat volta 2 {
    c,4  r8 g,8   a,4   r4     |  % 1   1 5 6
    c,4  r8 a,8   g,4   r4     |  % 2   1 6 5
    c,4  r8 g,8   a,4   r4     |  % 3
    c,4  r8 g,8   bes,4 r4     |  % 4   flat 7 pulls to the IV
    \break
    f,4  r8 c,8   d,4   r4     |  % 5
    f,4  r8 d,8   c,4   r4     |  % 6
    c,4  r8 g,8   a,4   r4     |  % 7
    c,4  r8 e,8   f,4   fis,4  |  % 8   walk up into the V
    \break
    g,4  r8 d,8   e,4   r4     |  % 9
    f,4  r8 c,8   d,4   r4     |  % 10
    c,4  r8 g,8   a,4   r4     |  % 11
    c,4  r8 g,8   bes,4 g,4    |  % 12  turnaround, landing on the V root
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
}

\header {
  title = "Blues Bass Line"
  subtitle = \markup \concat {
    "A background bass line for the 12-bar blues in concert "
    #(pitch-name-markup concert-tonic)
  }
  tagline = ##f
}

\markup \vspace #0.2
\markup \fill-line { #(form-grid-markup) }
\markup \vspace #0.8

\markup \fill-line {
  \line {
    \bold "Medium shuffle"
    \hspace #0.8
    \rhythm { 8[ 8] } = \rhythm { \tuplet 3/2 { 4 8 } }
    \hspace #1.5
    \normal-text \italic "root · 5th · 6th, every bar"
  }
}

\markup \vspace #0.3

\score {
  <<
    \new ChordNames \with { chordChanges = ##t }
      \transpose c, #bass-tonic \bassChords
    \new Staff \with { midiInstrument = "tuba" }
      \transpose c, #bass-tonic \bassLine
  >>
  \layout {
    #(layout-set-staff-size 32)
    system-system-spacing.padding = #9
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

\markup \vspace #0.6

\markup \fill-line {
  \column {
    \fontsize #-1 \override #'(baseline-skip . 2.6) \column {
      \line { \bold "The rests are breaths." "Take them — the line is meant to leave holes for the backgrounds to sit in." }
      \line { "Bar 4 leans on the flat 7th, bar 8 walks up into the V, bar 12 turns it around. Everything else is the same three notes: root, 5th, 6th." }
      \line { "To end: hold the first note of bar 12." }
    }
  }
}
