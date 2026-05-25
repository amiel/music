\version "2.24.4"

% automatically converted by musicxml2ly from Tico-Tico.xml
\pointAndClickOff

% A 
% B
% A
% C
% A

date = #(strftime "%Y-%m-%d" (localtime (current-time)))

revisionInfo = \markup { \concat { "Revision " \date } }

title = \markup "Tico Tico"

\header {
  title = \title
  tagline = \revisionInfo
  instrument = "Trombone" 
}

PartPOneVoiceOne =  \relative e'' {
      \clef "bass"
  \time 2/4
  \key a \minor

  \partial 8. \small e16 dis16 e16 | % 0

  \section \mark \default
  \repeat volta 2 {
          f16 e8 a16 r16 e16 dis16 e16 | % 1
          f16 e8 gis16 r16 e16 dis16 e16 | % 2
          f16 e16 d'16 b16 gis16 e16 d16 des16 | % 3
          c4 r16 a'16 as16 g16 | % 4
          f16 a8 d16 r16 c16 a16 f16 | % 5
          e16 a8 c16 r16 c16 b16 ais16 | % 6
          b16 b,16 dis16 fis16 a16 c16 b16 a16 | % 7
\barNumberCheck #8          gis4 r16 e16 dis16 e16 | %8
          f16 e8 a16 r16 e16 dis16 e16 | % 9
   f16 e8 gis16 r16 e16 dis16 e16 | % 10
          f16 e16 d'16 b16 gis16 e16 d16 des16 | % 11
          c4 r16 a'16 as16 g16 | % 12
          f16 a8 d16 r16 c16 a16 f16 | % 13
          e16 a8 c16 r16 c16 b16 ais16 | % 14
          b16 e,16 gis16 b16 e16 d16 c16 b16 | % 15

    \alternative {
      { \barNumberCheck #16 a8 \normalsize r8 r16 a,16^\markup "to B" cis16 e16 \bar "||" | } % 16
    
      { a4 r16 \small b,16^\markup "to C" a16 as16 | } % 17
    }
  }

  \section \mark \default

    \key a \major 
  \normalsize
         a'16 a,16 cis16 gis'16 ~ gis16 a,16 cis16 fis16 | % 18
         fis16 a,16 cis16 e16 ~ e16 a,16 cis16 fis16 | % 19
         fis16 a,16 cis16 e16 ~ e16 a,16 cis16 fis16 | % 20
         fis16 b,16 d16 e16 ~ e16 d16 e16 fis16 | % 21
         a16 d,16 e16 gis16 ~ gis16 d16 e16 fis16 | % 22
         fis16 b,16 d16 e16 ~ e16 d16 e16 fis16 | % 23
\barNumberCheck #24         a16 d,16 e16 gis16 ~ gis16 d16 e16 fis16 | % 24
         fis16 a,16 cis16 e16 ~ e16 a,16 cis16 e16 | % 25
         a16 a,16 cis16 gis'16 ~ gis16 a,16 cis16 fis16 | % 26
         fis16 a,16 cis16 e16 ~ e16 a,16 cis16 e16 | % 27
         fis16 e16 cis16 ais16 fis'16 e16 cis16 ais16 | % 28

         b16 ais16 b16 cis16 d8 r8 | % 29

         d16 cis16 d16 e16 fis16 gis16 a16 b16 | % 30
         cis16 d16 dis16 e16 fis16 e16 d16 cis16 | % 31
\barNumberCheck #32         b16 a16 gis16 fis16 e16 d16 cis16 b16 | % 32

             a4 r16 \small e'16^\markup "to A" dis16 e16 \bar ":|." | % 33

     % CODA

  % C

  \section \mark \default
     \key a \minor


         \small g,16 c16 e16 g16 c16 e,16 g16 gis16 | % 34
         a8.-. f16-. r16 b,16 a16 as16 | % 35
         g16 b16 d16 g16 b16 d,16 f16 g16 | % 36

         a8.-. e16-. r16 \normalsize <e c'>16 <e c'>16 <e c'>16 | % 37

%%          <e c'>16( <g b>16) <g b>16 <g b>16 ~ <g b>16 <f a>16 <f a>16 <f a>16  | % 38
%%      <f a>16( <d f>16) <d f>16 <d f>16 ~ <d f>16 <d b'>16 <d b'>16 <d b'>16  | % 39
 %% \barNumberCheck #40     <d b'>16( <e g>16) <e g>16 <d b'>16 <f a>16 <d f>16 <d f>16 <f a>16 | % 40



          <e c'>8 <g b>16 <g b>16 <g b>8 <f a>16 <f a>16 | % 38
          <f a>16 <d f>8 <d f>16 ~ <d f>16 <d b'>16 <d b'>16 <d b'>16 | % 39
  \barNumberCheck #40     <d b'>8 <f a>16 <f a>16 <f a>8 <e g>16 <e g>16  | %40

    <e g>16 <c e>8 <c e>16( <c e>16) \small b16 a aes |


         g16 c16 e16 g16 c16 e,16 g16 gis16 | % 42
         a8.-. f16-. r16 b,16 a16 as16 | % 43
         g16 b16 d16 g16 b16 d,16 f16 g16 | % 44
         a8.-. e16-. r16 c16 b16 bes16 | % 45

  \normalsize

  <f' a>8 r <fis a> r  | %46

 <g b>8 r <g a> r | % 47
  <f a>8 r <f g> r  | % 48



%%          a16 gis16 a16 b16 d16 c16 b16 c16 | % 46
%%          e16 g,16 c16 e16 g16 ges16 f16 e16 | % 47
%% \barNumberCheck #48         d16 c16 b16 a16 g16 f16 e16 d16 | % 48

       
  <e g>8 r
  \small r16 e'16^\markup "to A" dis16 e16 \bar ":|." | % 49
 }

% The score definition
\score {
        
  <<
      % \context ChordNames = "PartPOneVoiceOneChords" { \transpose ees c \PartPOneVoiceOneChords}
            % \set Staff.instrumentName = "Track 1"
            
             \context Staff << 
                 % \mergeDifferentlyDottedOn\mergeDifferentlyHeadedOn
                 \context Voice = "PartPOneVoiceOne" {
        \transpose c c,, \PartPOneVoiceOne
      }
                 >>
             >>
        
    \layout {}
    % To create MIDI output, uncomment the following line:
    %  \midi {\tempo 4 = 120 }
  }

