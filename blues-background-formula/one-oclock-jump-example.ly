\version "2.26.0"
\pointAndClickOff

\include "_bass-line.ly"
\include "swing.ly"

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  The One O'Clock Jump riff, harmonized four ways close by the formula.
%%  An example for the question of what the formula does with notes
%%  outside the chord.
%%
%%  Written in F, and printed in the project's concert key (set in
%%  _form.ly), as a separate part for each transposition of the band --
%%  one PDF apiece, with all four lines on each.  The note names in these
%%  comments are the F ones.
%%
%%  The riff is played three times, over the I, the IV and the V/IV of the
%%  form; its last two bars are always over the I.  Under each melody note
%%  go the next three notes of that bar's formula chord below it:
%%
%%    I   F6       F A C D
%%    IV  B-flat9  F A-flat C D
%%    V   C9sus4   F G B-flat D
%%
%%  B-flat is outside the I's pool and the IV's.  Wherever the riff hits
%%  it over either chord, it is treated as a passing tone: B-flat, G and
%%  E over C -- a C7, the V7 for a moment -- the same notes every time.
%%  Over the V, B-flat is in the pool and voiced like any chord tone.  So
%%  is the V's root, C, though the pool doesn't have it.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Every part's written tonic lands between the F above middle C and the
%% E above that.  That keeps all four lines mostly on the staff in any
%% transposition: lower, and the fourth part sinks into ledger lines
%% below; higher, and the lead climbs off the top.
#(define (part-tonic p)
   (ly:make-pitch (if (< (ly:pitch-notename p) 3) 1 0)
                  (ly:pitch-notename p)
                  (ly:pitch-alteration p)))

%% two octaves down, for the sousaphone -- see bass-tonic in _bass-line.ly
#(define example-bass-tonic
   (ly:make-pitch -2
                  (ly:pitch-notename concert-tonic)
                  (ly:pitch-alteration concert-tonic)))

%% Music written in F, moved to the key a part is written in.
inKey =
#(define-music-function (tonic music) (ly:pitch? ly:music?)
   #{ \transpose f' #tonic #music #})

global = {
  \key f \major
  \time 4/4
}

lead = {
  %% I
  r8 c'' r bes' d''4. bes'8 |
  c''4 d''8 c'' r bes'4. |
  a'8 f' a' f' bes'4 c''8 a'~ |
  a'2 r2 | \break
  %% IV
  r8 c'' r bes' d''4. bes'8 |
  c''4 d''8 c'' r bes'4. |
  a'8 f' a' f' bes'4 c''8 a'~ |
  a'2 r2 | \break
  %% V, IV
  r8 c'' r bes' d''4. bes'8 |
  c''4 d''8 c'' r bes'4. |
  a'8 f' a' f' bes'4 c''8 a'~ |
  a'2 r2 \bar "|."
}

second = {
  r8 a' r g' c''4. g'8 |
  a'4 c''8 a' r g'4. |
  f'8 d' f' d' g'4 a'8 f'~ |
  f'2 r2 |

  r8 aes' r g' c''4. g'8 |
  aes'4 c''8 aes' r g'4. |
  f'8 d' f' d' g'4 a'8 f'~ |
  f'2 r2 |

  r8 bes' r g' bes'4. g'8 |
  aes'4 c''8 aes' r g'4. |
  f'8 d' f' d' g'4 a'8 f'~ |
  f'2 r2
}

third = {
  r8 f' r e' a'4. e'8 |
  f'4 a'8 f' r e'4. |
  d'8 c' d' c' e'4 f'8 d'~ |
  d'2 r2 |

  r8 f' r e' aes'4. e'8 |
  f'4 aes'8 f' r e'4. |
  d'8 c' d' c' e'4 f'8 d'~ |
  d'2 r2 |

  r8 g' r f' g'4. f'8 |
  f'4 aes'8 f' r e'4. |
  d'8 c' d' c' e'4 f'8 d'~ |
  d'2 r2
}

fourth = {
  r8 d' r c' f'4. c'8 |
  d'4 f'8 d' r c'4. |
  c'8 a c' a c'4 d'8 c'~ |
  c'2 r2 |

  r8 d' r c' f'4. c'8 |
  d'4 f'8 d' r c'4. |
  c'8 a c' a c'4 d'8 c'~ |
  c'2 r2 |

  r8 f' r d' f'4. d'8 |
  d'4 f'8 d' r c'4. |
  c'8 a c' a c'4 d'8 c'~ |
  c'2 r2
}

chordSymbols = \chordmode {
  f1:6 s1*3 | bes1:9 s1 f1:6 s1 | c1:9sus4 bes1:9 f1:6 s1
}

\paper {
  #(set-paper-size "letter")
  ragged-last-bottom = ##f
}

\header {
  title = "One O'Clock Jump"
  tagline = \revisionInfo
}

\layout {
  #(layout-set-staff-size 22)
  \context {
    \ChordNames
    chordRootNamer = #chord-root-namer
  }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  One part: a PDF of its own, named for the part's suffix.
%%
%%  `from'/`to' give the instrument's transposition the usual LilyPond
%%  way -- concert `from' is written as `to'.  `bass' writes the part in
%%  bass clef, an octave below where the treble parts would put it.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

part =
#(define-void-function (suffix heading from to bass)
     (string? markup? ly:pitch? ly:pitch? boolean?)
   (let* ((written (part-tonic (written-tonic from to)))
          (tonic (if bass (ly:pitch-transpose written (ly:make-pitch -1 0 0))
                     written))
          (clef (if bass #{ \clef bass #} #{ #})))
     ;; a \book can't be returned to the top level, so hand it over the
     ;; way a top-level \book would be
     (toplevel-book-handler #{
       \book {
         \bookOutputSuffix #suffix
         \header { instrument = #heading }
         \score {
           <<
             \new ChordNames \inKey #tonic \chordSymbols
             \new StaffGroup <<
               \new Staff \with { instrumentName = "1" }
                 \inKey #tonic { #clef \global \lead }
               \new Staff \with { instrumentName = "2" }
                 \inKey #tonic { #clef \global \second }
               \new Staff \with { instrumentName = "3" }
                 \inKey #tonic { #clef \global \third }
               \new Staff \with { instrumentName = "4" }
                 \inKey #tonic { #clef \global \fourth }
             >>
           >>
         }
       }
     #})))

\part "C"       "C"                                 c' c' ##f
\part "C-bass"  "C bass clef"                       c' c' ##t
\part "Bb"      \markup \concat { "B" \flat }      bes c' ##f
\part "Eb"      \markup \concat { "E" \flat }      ees c' ##f
\part "F"       "F"                                 f c' ##f

%% Audio only, in concert pitch: the four parts swung, over the
%% sousaphone line.
\book {
  \score {
    \tripletFeel 8 <<
      \new Staff \with { midiInstrument = "alto sax" }
        \inKey #(part-tonic concert-tonic) { \global \lead }
      \new Staff \with { midiInstrument = "alto sax" }
        \inKey #(part-tonic concert-tonic) { \global \second }
      \new Staff \with { midiInstrument = "tenor sax" }
        \inKey #(part-tonic concert-tonic) { \global \third }
      \new Staff \with { midiInstrument = "tenor sax" }
        \inKey #(part-tonic concert-tonic) { \global \fourth }
      \new Staff \with { midiInstrument = "tuba" }
        \transpose c, #example-bass-tonic \bassLine
    >>
    \midi { }
  }
}
