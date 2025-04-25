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

aClap = \relative c'' {
  \xNotesOn
  bes4
  \xNotesOff
}

theClap = \relative c'' {
  \xNotesOn

  \repeat unfold 4 { bes4 } |

  \xNotesOff
}

firstClap = \relative c'' {
  \xNotesOn

  bes4^\markup { \italic "clap" }

  \repeat unfold 3 { bes4 } |

  \xNotesOff
}

verseClaps = \relative c'' {

  \tag #'full { R1 }
  \tag #'withoutFirstBeat { r4 r2 }

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
    r8 c ees4 g |
  aes4 r8 c, ees4 aes |
  g4 \vivirMiVida
}

prechorusMelodyPickup = \relative c {
  % y para 
  c8 ees d |
}


prechorusMelody = \relative c {
  % [y para] que
  ees4 r8 d ees4 r8 d |
  ees4 r8 ees ees ees f g |
  g8. f16 ees4 r4 f16 f8 f16 |
}

prechorusMelodyFirstEnding = \relative c {
  f8. ees16 d4 r8 % r4. 
}

prechorusMelodySecondEnding = \relative c {
  f2~ f8 ees~ees16 d8. |
}


highAccents = \relative c''' {
  r4 c-^\sfz r c-^\sfz | r c-^\sfz r2 |
}

prechorusLastBarRoot = \relative c'' {
  <f bes>8 r8 <f bes>8 r8
  \tuplet 3/2 { <f bes>8 <f bes>8 <f bes>8 } <f bes>8 r8 |
}


versePiano = \relative c' {
  g8. <c ees>16~<c ees>8 g8~g16 <c ees>8. g8. aes16~ |
  aes8. <c ees>16~<c ees>8 aes8~aes16 <c ees>8. aes8. g16~ |
  g8. <bes ees>16~<bes ees>8 g8~g16 <bes ees>8. g8. f16~ |
  f8. <bes d>16~<bes d>8 f8~f16 <bes d>8. f8.  % last 16th left out
}

prechorusPiano = \relative c' {
  <g c ees>4-. \mp \repeat unfold 3 { <g c ees>4-. }
  \repeat unfold 4 { <aes c ees>-. }
  \repeat unfold 4 { <g bes ees>-. }
  \repeat unfold 4 { <f bes d>-. }
}

prechorusPianoWithAccents = \relative c' {
  <g c ees>4-. <g c ees>4-^ \sfz
  <g c ees>-. \mp <g c ees>-^ \sfz
  <aes c ees>-. \mp <aes c ees>-^ \sfz
  <aes c ees>-. \mp <aes c ees>-.

  \repeat unfold 4 { <g bes ees>-. }

  <f bes d>8 r8 <f bes d>8 r8
  \tuplet 3/2 { <f bes d>8 <f bes d>8 <f bes d>8 } <f bes d>8 r8 |
}


chorusPianoA = \relative c' {
  g8. g16 <c ees>8 <c ees> g16 <c ees>8 g16 <c ees>8 <c ees> |
  aes8. aes16 <c ees>8 <c ees> aes16 <c ees>8 aes16 <c ees>8 <c ees> |

  g8. g16 <bes ees>8 <bes ees> g16 <bes ees>8 g16 <bes ees>8 <bes ees> |
  f8. f16 <bes d>8 <bes d> f16 <bes d>8 f16 <bes d>8 <bes d> |
}

chorusPianoB = \relative c' {
  <c ees>16 g8 <c ees>16 g8 <c ees> g16 <c ees>8 g16 <c ees>8 <c ees> |
  <c ees>16 aes8 <c ees>16 aes8 <c ees> aes16 <c ees>8 aes16 <c ees>8 <c ees> |
  <bes ees>16 g8 <bes ees>16 g8 <bes ees> g16 <bes ees>8 g16 <bes ees>8 <bes ees> |
  <bes d>16 f8 <bes d>16 f8 <bes d> f16 <bes d>8 f16 <bes d>8 <bes d> |
}

chorusPianoC = \relative c' {
  <c ees>8. g16    <c ees>8 <c ees>      g16 <c ees>8 g16      <c ees>8 <c ees> |
  <c ees>8. aes16  <c ees>8 <c ees>      aes16 <c ees>8 aes16  <c ees>8 <c ees> |

  <bes ees>8. g16  <bes ees>8 <bes ees>  g16 <bes ees>8 g16    <bes ees>8 <bes ees> |
  <bes d>8. f16    <bes d>8 <bes d>      f16 <bes d>8 f16      <bes d>8 <bes d> |
}

chorusPiano = \relative c' {
  % this is close, but it needs to land on the high note

  g16 <ees c>8 g16~ g16 <ees c>16 g8            g16 <ees c>8 g16~      g8 bes |
  aes16 <ees c>8 aes16~ aes16 <ees c>16 aes8            aes16 <ees c>8 aes16~      aes8 aes |

  g16 <ees bes>8 g16~ g16 <ees bes>16 g8            g16 <ees bes>8 g16~      g8 g |
  <d bes>8. f16~f16 <d bes>16 f8            <d bes>16 f8 <d bes>16      f8 f |
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
  bes8. d16~d8 f8~f4 r4 |
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
  \key c \minor

  \mark \markup \box "Intro"

  \firstClap
  \repeat unfold 5 { \theClap }

  \transpose c c' {
    r4 \vivirMiVida

    \break \mark \markup \box "Intro Chorus"
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
}

% lower woodwinds
partTwo = \relative c' {
  \key c \minor

  \break \mark \markup \box "Intro"

  r4 \voyAReir
  c4 \voyAReir

  \break \mark \markup \box "Intro Chorus"

  c4 \voyAReir
  c4 \voyAReir

  \repeat volta 2 {
    \break \mark \markup \box "Verse"

    c4 
    \keepWithTag #'withoutFirstBeat \verseClaps R1

    \break \mark \markup \box "Prechorus"

    \transpose c c' {
      \prechorusPiano
      \prechorusPianoWithAccents
    }

    \break \mark \markup \box "Chorus"

    r4 \voyAReir
    c4 \voyAReir
  }
}

% melodica
pianoPart = \relative c' {
  \key c \minor

  \break \mark \markup \box "Intro"

  \versePiano g16~ |
  \versePiano g16~ |

  \break \mark \markup \box "Intro Chorus"

  \chorusPiano
  \chorusPiano

  \repeat volta 2 {
    \break \mark \markup \box "Verse"

    \versePiano g16~ |
    \versePiano r16 |

    \break \mark \markup \box "Prechorus"

    \prechorusPiano
    \prechorusPianoWithAccents

    \break \mark \markup \box "Chorus"

    \chorusPiano
    \chorusPiano
  }
}

partThree = \relative c' {
  \key c \minor

  \mark \markup \box "Intro"

  \versePiano g16~ |
  \versePiano g16 |

  \break \mark \markup \box "Intro Chorus"

  g8 \bendAfter -4 r8 r4 r2 | R1*3

  \trombone bes4 |

  \repeat volta 2 {
    \break \mark \markup \box "Verse"

    \versePiano g16~ |
    \versePiano r16 |

    \break \mark \markup \box "Prechorus"

    \trombone

    % pickup 
    ees8 d |

    \prechorusMelody
    \prechorusMelodySecondEnding


    \break \mark \markup \box "Chorus"

    | R1*4

    % TODO: Maybe another counter melody here
    \trombone bes4 |
  }
}

partFour = \relative c {
  \key c \minor

  \mark \markup \box "Intro"

  % Move the center-line clap for treble clef to center-line for bass clef
  \transpose bes d, {
    \firstClap
    \repeat unfold 6 { \theClap }
    R1
  }

  \break \mark \markup \box "Intro Chorus"
  % \transpose c c, {
    \chorusPiano
    \chorusPiano
  % }

  \repeat volta 2 {
    \break \mark \markup \box "Verse"

    % Move the center-line clap for treble clef to center-line for bass clef
    \transpose bes d, {
      \keepWithTag #'full \verseClaps r2 r8 
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
}

bassPart = \relative c {
  \clef bass
  \key c \minor

  \mark \markup \box "Intro"

  \bassIntro
  \bassIntro

  \break \mark \markup \box "Intro Chorus"

  \bassChorus
  \bassChorus

  \repeat volta 2 {
    \break \mark \markup \box "Verse"

    \bassVerse
    \bassVerse

    \break \mark \markup \box "Prechorus"

    \bassVerse
    \bassVerse % Prechorus ending

    \break \mark \markup \box "Chorus"

    \bassChorus
    \bassChorus 
  }
}


pianoPartC = \new Staff \transpose c c' \pianoPart

% Individual parts for printing
leadPartC = \new Staff \partOne
leadPartBb = \new Staff \transpose bes c \partOne
leadPartEb = \new Staff \transpose ees c \partOne

middlePartC = \new Staff \partTwo
middlePartBb = \new Staff \transpose bes c' \partTwo
% middlePartEb = \new Staff \transpose ees c \partTwo

lowPartC = \new Staff { \clef bass \partThree }
lowPartBb = \new Staff { \clef treble \transpose bes c'' \partThree }
% lowPartEb = \new Staff \transpose ees c \partThree

otherLowPartC = \new Staff { \clef bass \partFour }
otherLowPartBb = \new Staff { \clef treble \transpose bes c'' \partFour }
otherLowPartEb = \new Staff { \clef treble \transpose ees c'' \partFour }

bassC = \new Staff \bassPart
% bassBb = \new Staff \transpose bes c \bassPart
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
        \leadPartC
        \middlePartC
        \lowPartC
        \otherLowPartC

        \bassC
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
  \score { \compressMMRests { \leadPartC } \layout {} }
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
  \score { \compressMMRests { \leadPartC } \layout {} }
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
  \score { \compressMMRests { \leadPartBb } \layout {} }
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
  \score { \compressMMRests { \transpose c c' \leadPartBb } \layout {} }
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
  \score { \compressMMRests { \leadPartEb } \layout {} }
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
  \score { \middlePartBb \layout {} }
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
  \score { \middlePartBb \layout {} }
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
  \score { \middlePartBb \layout {} }
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
  \score { \compressMMRests { \otherLowPartEb } \layout {} }
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
  \score { \compressMMRests { \otherLowPartBb } \layout {} }
}

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

