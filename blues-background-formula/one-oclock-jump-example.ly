\version "2.26.0"
\pointAndClickOff

\include "_bass-line.ly"
\include "swing.ly"

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  The One O'Clock Jump riff, harmonized four ways close by the formula.
%%  An example for the question of what the formula does with notes
%%  outside the chord.
%%
%%  Written in concert F, like the rest of this project, and printed in
%%  exampleTonic below -- D-flat, the key of Kyle's email.  The note names
%%  in these comments are the F ones.
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

exampleTonic = des

%%  Nothing below here needs editing to change key.

#(define example-tonic (simplify-key (normalize-octave exampleTonic)))
%% two octaves down, for the sousaphone -- see bass-tonic in _bass-line.ly
#(define example-bass-tonic
   (ly:make-pitch -2
                  (ly:pitch-notename example-tonic)
                  (ly:pitch-alteration example-tonic)))

%% Music written in F, moved to the example's key -- and up an octave
%% from where that lands, which keeps the lower parts off ledger lines.
inKey =
#(define-music-function (music) (ly:music?)
   #{ \transpose f #example-tonic #music #})

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

\score {
  <<
    \new ChordNames \with {
      chordRootNamer = #chord-root-namer
    } \inKey \chordSymbols
    \new StaffGroup <<
      \new Staff \with { instrumentName = "1" }
        \inKey { \global \lead }
      \new Staff \with { instrumentName = "2" }
        \inKey { \global \second }
      \new Staff \with { instrumentName = "3" }
        \inKey { \global \third }
      \new Staff \with { instrumentName = "4" }
        \inKey { \global \fourth }
    >>
  >>
  \layout {
    #(layout-set-staff-size 22)
  }
}

%% Audio only: the four parts swung, over the sousaphone line.
\score {
  \tripletFeel 8 <<
    \new Staff \with { midiInstrument = "alto sax" }
      \inKey { \global \lead }
    \new Staff \with { midiInstrument = "alto sax" }
      \inKey { \global \second }
    \new Staff \with { midiInstrument = "tenor sax" }
      \inKey { \global \third }
    \new Staff \with { midiInstrument = "tenor sax" }
      \inKey { \global \fourth }
    \new Staff \with { midiInstrument = "tuba" }
      \transpose c, #example-bass-tonic \bassLine
  >>
  \midi { }
}
