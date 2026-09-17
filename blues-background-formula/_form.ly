\version "2.26.0"

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%  Shared by blues-background-formula.ly and blues-bass-line.ly: the
%%  concert key, the pitch spelling both sheets use, and the 12-bar grid
%%  that sits at the top of each of them.
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%  CONFIGURATION -- this is the only thing you need to change.
%%
%%  Set the concert key here and both sheets follow: every transposition,
%%  every chord symbol and every title is derived from this one pitch.
%%
%%  LilyPond pitch names: c d e f g a b, with "es" for flat and "is"
%%  for sharp -- bes = B-flat, ees = E-flat, fis = F-sharp.  Octave
%%  marks are ignored; the music always lands in a readable register.
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

concertTonic = f

%%  How big the grid is drawn.  Both sheets share these so that the two
%%  grids are the same size and read as the same chart.
#(define grid-roman-size 4.5)
#(define grid-column-width 18)
#(define grid-baseline 6.5)

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
%% description serves every key, four bars to a row.
%%   I I I I | IV IV I I | V IV I I
%% The cdr is the extension to print over the numeral, or #f for none.
#(define blues-form
   '(((0 . #f) (0 . #f) (0 . #f) (0 . #f))
     ((3 . #f) (3 . #f) (0 . #f) (0 . #f))
     ((4 . "7") (3 . #f) (0 . #f) (0 . #f))))

#(define roman-numerals (vector "I" "II" "III" "IV" "V" "VI" "VII"))

%% The grid carries roman numerals only, which makes it the same chart for
%% every key and every transposition -- so it is drawn once per page
%% rather than once per part.  The chords it works out to are already
%% named over each staff.
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
