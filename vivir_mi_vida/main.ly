\version "2.24.4"

date = #(strftime "%Y-%m-%d" (localtime (current-time)))

revisionInfo = \markup { \concat { "Revision " \date } }

title = \markup "Vivir Mi Vida"
composer = \markup "by Marc Anthony"
arranger = \markup "arr. Amiel Martin"

\pointAndClickOff

%%%%%%%%%%%%%%%%%
% modules
%

voyAReirLyrics = \lyricmode {
  Voy a re -- ir
  voy a go -- zar
}

introLyrics = \lyricmode {
  \voyAReirLyrics
  Vi -- vir mi vi -- da
  la la la \tag theLastLa { la }
}

verseClaps = \relative c'' {

  \tag full { R1 }
  \tag withoutFirstBeat { r4 r2 }

  \xNotesOn
    r2 bes4^\markup { \italic "clap" } bes4 |
    bes4 r4 r2 |

    \repeat unfold 2 {
      r2 bes4 bes4 |
      bes4 r4 r2 |
    }

  \xNotesOff
}

verse = \relative c'' {
  % a veces llega la lluvia
  r8 c8 c d ees ees c ees~ | ees8 ees~ees4 r2 |

  % para limpiar las herida
  r8 ees ees c ees ees c ees~ | ees ees( d4) r2 |

  % a veces solo una gota
  r8 c c d ees d c c~ | c bes( c16 bes aes8~ aes4) r4 |

  % puede vencer la sequia
  r8 ees' ees ees ees ees c ees~ | ees ees( f4) r2 |
}

vivirMiVida = \relative c' {
  % one beat missing to allow for landing the melody on 1
    r8 ees8 ees4 g4 |

  f4 r8 f8 \tuplet 3/2 { f4 ees d } |
}

% Define common musical phrases for reuse
voyAReir = \relative c' {
  % one beat missing to allow for landing the melody on 1
    r8 c8 ees4 g4 |
  aes4 r8 c, ees4 aes |
  g4
}

introSingPlay = \relative c' {
  r4 r8 ^\markup { \italic "sing and clap the beat" } c8 ees4 g4 |
  aes4 r8 c, ees4 aes |
  g4 \vivirMiVida

  c,4 \voyAReir

    r8 ees8 ^\markup { \italic "play" } ees4 g4 |
  f4 r8 f8 \tuplet 3/2 { f4 ees d } |
}


outroSing = \relative c' {
  % one beat missing to allow for landing the melody on 1
   r8 ^\markup { \italic "sing and clap the beat" } c8 ees4 g4 |
  aes4 r8 c, ees4 aes |
  g4 \vivirMiVida

  c,4 \voyAReir \vivirMiVida
}

lastBar = \relative c' {
  c4-- r4 r2 \bar "|."
}

introSing = \relative c' {
  r4 \outroSing
}

prechorusMelodyPickup = \relative c {
  % y para 
  c8 ees d |
}


prechorusMelody = \relative c {
  % [y para] que
  ees4-> r8 d ees4-> r8 d |
  ees4-> r8 ees( ees ees f g |
  g8. f16 ees4) r4 f16 f8 f16 |
}

prechorusMelodyFirstEnding = \relative c {
  f8.( ees16 d4) r8 % r4.
}

prechorusMelodySecondEnding = \relative c {
  f2~f8 ees~ees16 d8. |
}


highAccents = \relative c''' {
  r4 c-^\sfz r c-^\sfz | r c-^\sfz r2 |
}

prechorusLastBarRoot = \relative c'' {
  <f bes>8 r8 <f bes>8 r8
  \tuplet 3/2 { <f bes>8 <f bes>8 <f bes>8 } <f bes>8 r8 |
}


%% versePiano = \relative c' {
%%   g8. <c ees>16~<c ees>8 g8~g16 <c ees>8. g8. aes16~ |
%%   aes8. <c ees>16~<c ees>8 aes8~aes16 <c ees>8. aes8. g16~ |
%%   g8. <bes ees>16~<bes ees>8 g8~g16 <bes ees>8. g8. f16~ |
%%
%%   \tag lastMeasure {
%%     f8. <bes d>16~<bes d>8 f8~f16 <bes d>8. f8.  % last 16th left out
%%   }
%% }

versePianoSimplified = \relative c' {
  g8. <c ees>16~<c ees>8 g8 g16 <c ees>8. g8. aes16 |
  aes8. <c ees>16~<c ees>8 aes8 aes16 <c ees>8. aes8. g16 |
  g8. <bes ees>16~<bes ees>8 g8 g16 <bes ees>8. g8. f16 |

  \tag lastMeasure {
    f8. <bes d>16~<bes d>8 f8 f16 <bes d>8. f8.  % last 16th left out
  }
}


prechorusPiano = \relative c' {
  <g c ees>4-. \mp \repeat unfold 3 { <g c ees>4-. }
  \repeat unfold 4 { <aes c ees>-. }
  \repeat unfold 4 { <g bes ees>-. }
  \repeat unfold 4 { <f bes d>-. }
}

prechorusPianoWithAccents = \relative c' {
  <g c ees>4-. <g c ees>4-^ \sfz
  <g c ees>-. <g c ees>-^ \sfz
  <aes c ees>-. <aes c ees>-^ \sfz
  <aes c ees>-. <aes c ees>-.

  \repeat unfold 4 { <g bes ees>-. }

  <f bes d>8 r8 <f bes d>8 r8
  \tuplet 3/2 { <f bes d>8 <f bes d>8 <f bes d>8 } <f bes d>8 r8 |
}

chorusPiano = \relative c' {
 g8. g16~ g16 <ees c>16 g8 g16 <ees c>8 g16~ g8 bes |
 aes8. aes16~ aes16 <ees c>16 aes8 aes16 <ees c>8 <ees c>16 aes8 aes |

 g8. g16~ g16 <ees bes>16 g8 g16 <ees bes>8 g16~ g8 g |
 f8. f16~f16 <d bes>16 f8 f16 <d bes>8 <d bes>16 f8 f |
}

trombone = \relative c' {
  \repeat unfold 2 { r8. c16 r bes c8~ c4 r4 | } 
  r8. ees16 r d ees8~ ees4 r4 | 
  r8. d16 r c d8~d4 % missing last beat
}

bassIntro = \relative c {
  c4 r r2 | aes4 r r2 | ees'4 r r2 | bes4 r4 r2 |
}

bassVerse = \relative c {
  c8. ees16~ees8 g8~g4 r4 |
  aes,8. c16~c8 ees8~ees4 r4 |
  ees,8. g16~g8 bes8~bes4 r4 |
  \tag lastMeasure { bes8. d16~d8 f8~f4 r4 | }
}

bassPrechorusLastMeasure = \relative c {
  bes8 r8 bes8 r8
  \tuplet 3/2 { bes8 bes8 bes8 } bes8 r8 |
}

bassChorus = \relative c {
  c8. g16 g8 c8 r8. c16 ees8 aes, |
  r8. aes16 ees8 aes r8. aes16 aes8 ees |
  r8. bes16 bes8 ees r8. ees16 ees8 bes |
  r8. f'16 f8 bes r8. bes16 ees bes c8 |
}


%%%%%%%%%%%%%%%%
% parts
%

% Define each part

% higher woodwinds
partOne = \relative c' {
  \tempo 4 = 100
  \key c \minor

  \break \mark \markup \box "Intro"

  \transpose c c' {
    \introSingPlay

    \break \mark \markup \box "Chorus"
    <<
      { c''4\bendAfter -4 } \\ 
      { c'4 }
    >>
    r4 r2  |

    R1 |
    r4 \vivirMiVida |
    c'4 r4 r2 |
    
    R1 |
    r4 \vivirMiVida |
  }

  \repeat volta 2 {
    \break \mark \markup \box "Verse"

    \verse

    \break \mark \markup \box "Prechorus"

    R1*4

    \highAccents
    R1 \prechorusLastBarRoot


    \transpose c c' {
      \break \mark \markup \box "Chorus"
      R1*2 |
      r4 \vivirMiVida |
      c'4 r4 r2 |
      
      R1 |
      r4 \vivirMiVida |
    }
  }


  \break \mark \markup \box "Outro"
 
   \transpose c c' {
    c'4 \outroSing \lastBar
  }
}

partOnePianoChorus = \relative c' {
  \key c \minor

  \break \mark \markup \box "Intro"

  \transpose c c' {
    \introSing
  }

  \transpose c c'' {
    \break \mark \markup \box "Chorus"

    \chorusPiano
    \chorusPiano
  }

  \repeat volta 2 {
    \break \mark \markup \box "Verse"

    \verse

    \break \mark \markup \box "Prechorus"

    R1*4

    \highAccents
    R1 \prechorusLastBarRoot


    \transpose c c'' {
      \break \mark \markup \box "Chorus"

      \chorusPiano
      \chorusPiano
    }
  }

  \transpose c c' {
    \mark \markup \box "Outro"
    r4 \outroSing
    \lastBar
  }
}



% lower woodwinds
partTwo = \relative c' {
  \tempo 4 = 100
  \key c \minor

  \break \mark \markup \box "Intro"

  \introSing

  \break \mark \markup \box "Chorus"

  c4 \voyAReir \vivirMiVida
  c4 \voyAReir \vivirMiVida

  \repeat volta 2 {
    \break \mark \markup \box "Verse"

    c4 
    \keepWithTag withoutFirstBeat \verseClaps R1

    \break \mark \markup \box "Prechorus"

    \transpose c c' {
      \prechorusPiano
      \prechorusPianoWithAccents
    }

    \break \mark \markup \box "Chorus"

    r4 \voyAReir \vivirMiVida
    c4 \voyAReir \vivirMiVida
  }

  \break \mark \markup \box "Outro"

  c4 \outroSing
  \lastBar
}

% melodica
pianoPart = \relative c' {
  \tempo 4 = 100
  \key c \minor

  \break \mark \markup \box "Intro"

  \versePianoSimplified g16~ |
  \versePianoSimplified r16 |

  \break \mark \markup \box "Chorus"

  \chorusPiano
  \chorusPiano

  \repeat volta 2 {
    \break \mark \markup \box "Verse"

    \versePianoSimplified g16~ |
    \versePianoSimplified r16 |

    \break \mark \markup \box "Prechorus"

    \prechorusPiano
    \prechorusPianoWithAccents

    \break \mark \markup \box "Chorus"

    \chorusPiano
    \chorusPiano
  }


  \break \mark \markup \box "Outro"

  \versePianoSimplified g16~ |
  \versePianoSimplified r16 |

  <g c ees>4-- r4 r2 \bar "|."
}

partThree = \relative c' {
  \tempo 4 = 100
  \key c \minor

  \mark \markup \box "Intro"

  \versePianoSimplified g16~ |
  \versePianoSimplified r16 |

  \break \mark \markup \box "Chorus"

  g4 \bendAfter -4 r2. | R1*3

  % R1*4 |

  \trombone bes4 |

  \repeat volta 2 {
    \break \mark \markup \box "Verse"

    \versePianoSimplified g16~ |

    \removeWithTag lastMeasure \versePianoSimplified

    f8. <bes d>16~<bes d>8 f8 r8

    \prechorusMelodyPickup |

    \break \mark \markup \box "Prechorus"

    \prechorusMelody
    \prechorusMelodyFirstEnding
    \prechorusMelodyPickup

    \prechorusMelody
    \prechorusMelodySecondEnding


    \break \mark \markup \box "Chorus"

    c4 r2. | R1*3

    \trombone bes'4 |
  }

  \break \mark \markup \box "Outro"

  \versePianoSimplified g16~ |
  \versePianoSimplified r16 |

  <ees g>4-- r2. \bar "|."
}

partFour = \relative c {
  \tempo 4 = 100
  \key c \minor

  \mark \markup \box "Intro"

  \transpose c c, {
    \introSing
  }

  \break \mark \markup \box "Chorus"
  \chorusPiano
  \chorusPiano

  \repeat volta 2 {
    \break \mark \markup \box "Verse"

    % Move the center-line clap for treble clef to center-line for bass clef
    \transpose bes d, {
      \keepWithTag full \verseClaps r2 r8 
    }

    \prechorusMelodyPickup

    \break \mark \markup \box "Prechorus"

    \prechorusMelody
    \prechorusMelodyFirstEnding
    \prechorusMelodyPickup
    \prechorusMelody
    \prechorusMelodySecondEnding


    \break \mark \markup \box "Chorus"
    \chorusPiano
    \chorusPiano
  }

  \break \mark \markup \box "Outro"

  \transpose c c, {
    r4 \outroSing
    \lastBar
  }
}

bassPart = \relative c {
  \tempo 4 = 100
  \key c \minor

  \mark \markup \box "Intro"

  \bassIntro
  \bassIntro

  \break \mark \markup \box "Chorus"

  \bassChorus
  \bassChorus

  \repeat volta 2 {
    \break \mark \markup \box "Verse"

    \bassVerse
    \bassVerse

    \break \mark \markup \box "Prechorus"

    \bassVerse
    \removeWithTag lastMeasure \bassVerse
    \bassPrechorusLastMeasure

    \break \mark \markup \box "Chorus"

    \bassChorus
    \bassChorus 
  }

  \break \mark \markup \box "Outro"
  \bassIntro \break
  \bassIntro

  R1 \bar "|."
}


pianoPartC = \transpose c c' \pianoPart

% Individual parts for printing
leadPartC = \partOne
leadPartCPianoChorus = \partOnePianoChorus
leadPartBb = \transpose bes c \partOne
leadPartEb = \transpose ees c \partOne

middlePartC = \partTwo
middlePartBb = \transpose bes c' \partTwo
% middlePartEb = \new Staff \transpose ees c \partTwo

lowPartC = { \clef bass \partThree }
lowPartBb = { \clef treble \transpose bes c'' \partThree }
% lowPartEb = \new Staff \transpose ees c \partThree

otherLowPartC = { \clef bass \partFour }
otherLowPartBb = { \clef treble \transpose bes c'' \partFour }
otherLowPartEb = { \clef treble \transpose ees c'' \partFour }

bassC = { \clef bass \bassPart }
bassBb = { \clef treble \transpose bes c''' \bassPart }
% bassEb = \new Staff \transpose ees c \bassPart

#(set-global-staff-size 22)

% Full Score in C
\book {
  \bookOutputName "vivir mi vida - score"
  \header {
    title = \title
    composer = \composer
    arranger = \arranger
    tagline = \revisionInfo
    instrument = "Full Score (C)" 
  }
  \score {
    <<
      \new StaffGroup <<
        \new Staff \leadPartC
        \new Staff \middlePartC
        \new Staff \lowPartC
        \new Staff \otherLowPartC

        \new Staff \bassC
      >>
    >>
    \layout {}
    % \midi {}
  }
}

%% piano

\book {
  \bookOutputName "vivir mi vida - melodica"
  \header {
    title = \title
    composer = \composer
    arranger = \arranger
    tagline = \revisionInfo
    instrument = "Melodica" 
  }
  \score { \compressMMRests { \pianoPartC } \layout {} }
}


%% lead part

\book {
  \bookOutputName "vivir mi vida - flute"
  \header {
    title = \title
    composer = \composer
    arranger = \arranger
    tagline = \revisionInfo
    instrument = "Flute" 
  }
  \score {
    <<
      \new Voice = "flute" { \compressMMRests { \leadPartCPianoChorus } }
      \new Lyrics \lyricsto "flute" {
        \introLyrics \removeWithTag theLastLa \introLyrics

        % this is literally just the number of notes between the intro and the outro
        \repeat unfold 177 { \skip 4 }

        \introLyrics \introLyrics
      }
    >>

    \layout { }
  }
}

\book {
  \bookOutputName "vivir mi vida - bells"
  \header {
    title = \title
    composer = \composer
    arranger = \arranger
    tagline = \revisionInfo
    instrument = "Bells" 
  }
  \score {
    <<
      \new Voice = "bells" { \compressMMRests { \leadPartC } }
      \new Lyrics \lyricsto "bells" {
        \introLyrics \voyAReirLyrics

        % this is literally just the number of notes between the intro and the outro
        \repeat unfold 84 {  \skip 4 }

        \introLyrics \introLyrics
      }

      % \new RhythmicStaff { 
      %   \transpose bes d {
      %     \firstClap
      %     \repeat unfold 5 { \theClap }
      %   }
      % }
    >>

    \layout {}
  }
}

\book {
  \bookOutputName "vivir mi vida - trumpet 1"
  \header {
    title = \title
    composer = \composer
    arranger = \arranger
    tagline = \revisionInfo
    instrument = "Trumpet 1" 
  }
  \score { 
    <<
      \new Voice = "trumpet" { \compressMMRests { \leadPartBb } }
      \new Lyrics \lyricsto "trumpet" {
        \introLyrics \voyAReirLyrics

        % this is literally just the number of notes between the intro and the outro
        \repeat unfold 84 {  \skip 4 }

        \introLyrics \introLyrics
      }

    >>
    \layout {}
  }
}

\book {
  \bookOutputName "vivir mi vida - soprano sax"
  \header {
    title = \title
    composer = \composer
    arranger = \arranger
    tagline = \revisionInfo
    instrument = "Soprano Sax" 
  }
  \score { 
    <<
      \new Voice = "sax" { \compressMMRests { \transpose c c' { \leadPartBb } } }
      \new Lyrics \lyricsto "sax" {
        \introLyrics \voyAReirLyrics

        % this is literally just the number of notes between the intro and the outro
        \repeat unfold 84 {  \skip 4 }

        \introLyrics \introLyrics
      }

    >>
    \layout {}
 }
}

\book {
  \bookOutputName "vivir mi vida - alto sax"
  \header {
    title = \title
    composer = \composer
    arranger = \arranger
    tagline = \revisionInfo
    instrument = "Alto Sax" 
  }
  \score { 
    <<
      \new Voice = "sax" { \compressMMRests { \leadPartEb } }
      \new Lyrics \lyricsto "sax" {
        \introLyrics \voyAReirLyrics

        % this is literally just the number of notes between the intro and the outro
        \repeat unfold 84 { \skip 4 }

        \introLyrics \introLyrics
      }
    >>
    \layout {}
  }
}

%% middle parts

\book {
  \bookOutputName "vivir mi vida - trumpet 2"
  \header {
    title = \title
    composer = \composer
    arranger = \arranger
    tagline = \revisionInfo
    instrument = "Trumpet 2" 
  }
  \score {
    <<
      \new Voice = "trumpet" { \compressMMRests { \middlePartBb } }
      \new Lyrics \lyricsto "trumpet" {
        \introLyrics \introLyrics

        % this is literally just the number of notes between the intro and the outro
        \repeat unfold 111 { \skip 4 }

        \introLyrics \introLyrics
      }
    >>

    \layout {}
  }

}

\book {
  \bookOutputName "vivir mi vida - clarinet"
  \header {
    title = \title
    composer = \composer
    arranger = \arranger
    tagline = \revisionInfo
    instrument = "Clarinet" 
  }

  \score {
    <<
      \new Voice = "clarinet" { \compressMMRests { \middlePartBb } }
      \new Lyrics \lyricsto "clarinet" {
        \introLyrics \introLyrics

        % this is literally just the number of notes between the intro and the outro
        \repeat unfold 111 { \skip 4 }

        \introLyrics \introLyrics
      }
    >>

    \layout {}
  }
}

\book {
  \bookOutputName "vivir mi vida - tenor sax"
  \header {
    title = \title
    composer = \composer
    arranger = \arranger
    tagline = \revisionInfo
    instrument = "Tenor Sax" 
  }
  \score {
    <<
      \new Voice = "sax" { \middlePartBb }
      \new Lyrics \lyricsto "sax" {
        \introLyrics \introLyrics

        % this is literally just the number of notes between the intro and the outro
        \repeat unfold 111 { \skip 4 }

        \introLyrics \introLyrics
      }
    >>

    \layout {}
  }
}

%% trombone

\book {
  \bookOutputName "vivir mi vida - trombone"
  \header {
    title = \title
    composer = \composer
    arranger = \arranger
    tagline = \revisionInfo
    instrument = "Trombone" 
  }
  \score { \compressMMRests { \lowPartC } \layout {} }
}

\book {
  \bookOutputName "vivir mi vida - baritone"
  \header {
    title = \title
    composer = \composer
    arranger = \arranger
    tagline = \revisionInfo
    instrument = "Baritone (B-flat)" 
  }
  \score { \compressMMRests { \lowPartBb } \layout {} }
}

%% other low parts

\book {
  \bookOutputName "vivir mi vida - bari sax"
  \header {
    title = \title
    composer = \composer
    arranger = \arranger
    tagline = \revisionInfo
    instrument = "Bari Sax" 
  }
  \score {
    <<
      \new Voice = "sax" { \compressMMRests { \otherLowPartEb } }
      \new Lyrics \lyricsto "sax" {
        \introLyrics \removeWithTag theLastLa \introLyrics

        % this is literally just the number of notes between the intro and the outro
        \repeat unfold 173 { \skip 4 }

        \introLyrics \introLyrics
      }
    >>
    \layout { }
  }
}

\book {
  \bookOutputName "vivir mi vida - tenor sax alternate"
  \header {
    title = \title
    composer = \composer
    arranger = \arranger
    tagline = \revisionInfo
    instrument = "Tenor Sax (alternate)" 
  }
  \score {
    <<
      \new Voice = "sax" { \compressMMRests { \otherLowPartBb } }
      \new Lyrics \lyricsto "sax" {
        \introLyrics \removeWithTag theLastLa \introLyrics

        % this is literally just the number of notes between the intro and the outro
        \repeat unfold 173 { \skip 4 }

        \introLyrics \introLyrics
      }
    >>
    \layout {}
  }
}

% meh, just play the tenor part
% \book {
  % \bookOutputName "vivir mi vida - bass sax alternative"
  % \header {
    % title = \title
    % composer = \composer
    % arranger = \arranger
    % tagline = \revisionInfo
    % instrument = "Bass Sax (alternate)"
  % }
  % \score { \compressMMRests { \otherLowPartBb } \layout {} }
% }

%% bass

\book {
  \bookOutputName "vivir mi vida - tuba"
  \header {
    title = \title
    composer = \composer
    arranger = \arranger
    tagline = \revisionInfo
    instrument = "Tuba" 
  }
  \score { \compressMMRests { \bassC } \layout {} }
}

\book {
  \bookOutputName "vivir mi vida - bass sax"
  \header {
    title = \title
    composer = \composer
    arranger = \arranger
    tagline = \revisionInfo
    instrument = "Bass Sax" 
  }
  \score { \compressMMRests { \bassBb } \layout {} }
}

