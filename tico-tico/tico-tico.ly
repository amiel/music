\version "2.24.4"

% automatically converted by musicxml2ly from Tico-Tico.xml
\pointAndClickOff

PartPOneVoiceOne =  \relative e' {
      \clef "treble"
  \time 2/4
  \key a \minor

  \partial 8. e16 dis16 e16 | % 2

    \repeat volta 2 {
          f16 e8 a16 r16 e16 dis16 e16 | % 3
          f16 e8 gis16 r16 e16 dis16 e16 | % 4
          f16 e16 d'16 b16 gis16 e16 d16 des16 | % 5
          c4 r16 a'16 as16 g16 | % 6
          f16 a8 d16 r16 c16 a16 f16 | % 7
          e16 a8 c16 r16 c16 b16 ais16 | % 8
          b16 b,16 dis16 fis16 a16 c16 b16 a16 | % 9
          gis4 r16 e16 dis16 e16 | \barNumberCheck #9
          f16 e8 a16 r16 e16 dis16 e16 | % 11
          f16 e8 gis16 r16 e16 dis16 e16 | % 12
          f16 e16 d'16 b16 gis16 e16 d16 des16 | % 13
          c4 r16 a'16 as16 g16 | % 14
          f16 a8 d16 r16 c16 a16 f16 | % 15
          e16 a8 c16 r16 c16 b16 ais16 | % 16
          b16 e,16 gis16 b16 e16 d16 c16 b16 | % 17
      \alternative {
        { a8 r8 r16 e16 dis16 e16 | } 
        { a8 r8 r16 a16 cis16 e16 | }
      } 
  }
  
  \key a \major 

 \repeat volta 2 {
         a16 a,16 cis16 gis'16 ~ gis16 a,16 cis16 fis16 | \barNumberCheck #19
         fis16 a,16 cis16 e16 ~ e16 a,16 cis16 fis16 | % 21
         fis16 a,16 cis16 e16 ~ e16 a,16 cis16 fis16 | % 22
         fis16 b,16 d16 e16 ~ e16 d16 e16 fis16 | % 23
         a16 d,16 e16 gis16 ~ gis16 d16 e16 fis16 | % 24
         fis16 b,16 d16 e16 ~ e16 d16 e16 fis16 | % 25
         a16 d,16 e16 gis16 ~ gis16 d16 e16 fis16 | % 26
         fis16 a,16 cis16 e16 ~ e16 a,16 cis16 e16 | % 27
         a16 a,16 cis16 gis'16 ~ gis16 a,16 cis16 fis16 | % 28
         fis16 a,16 cis16 e16 ~ e16 a,16 cis16 e16 | % 29
         fis16 e16 cis16 ais16 fis'16 e16 cis16 ais16 | \barNumberCheck #29
         b16 ais16 b16 cis16 d8 r8 | % 31
         d,16 cis16 d16 e16 fis16 gis16 a16 b16 | % 32
         cis16 d16 dis16 e16 fis16 e16 d16 cis16 | % 33
         b16 a16 gis16 fis16 e16 d16 cis16 b16 | % 34
     }
     \alternative { {
             a4 r16 a'16 cis16 e16 }
         {
             | % 35
             a,,4 r16 e'16 dis16 e16 }
         } \bar "||"

     % CODA

     \key a \minor

     a4 r16 b,16 a16 as16

     \repeat volta 2 {
         | % 37
         g16 c16 e16 g16 c16 e16 g16 gis16 | % 38
         a8.-. f16-. r16 b,,16 a16 as16 | % 39
         g16 b16 d16 g16 b16 d16 f16 g16 | \barNumberCheck #39

         a8.-. e16-. r16 <e c'>16 <e c'>16 <e c'>16 | % 41
         <e c'>16( <g b>16) <g b>16 <g b>16 ~ <g b>16 <f a>16 <f a>16 <f a>16  | %42
     <f a>16( <d f>16) <d f>16 <d f>16 ~ <d f>16 <d b'>16 <d b'>16 <d b'>16  | %43
     <d b'>16( <e g>16) <e g>16 <d b'>16 <f a>16 <d f>16 <d f>16 <f a>16 | %44






         %% <e c'>8 <g b>16 <g b>16 <g b>8 <f a>16 <f a>16 | % 42
         %% <f a>16 <d f>8 <d f>16 ~ <d f>16 <d b'>16 <d b'>16 <d b'>16 | % 43
         %% d8 b'8 f16 a16 f16 a16 f8 a8 e16 g16 e16 g16 | % 44

     <e g>4 r16 b,16 a16 as16 | % 45




         g16 c16 e16 g16 c16 e16 g16 gis16 | % 46
         a8.-. f16-. r16 b,,16 a16 as16 | % 47
         g16 b16 d16 g16 b16 d16 f16 g16 | % 48
         a8.-. e16-. r16 c16 b16 bes16 | % 49
         a16 gis16 a16 b16 d16 c16 b16 c16 | \barNumberCheck #50
         e16 g,16 c16 e16 g16 ges16 f16 e16 | % 51
         d16 c16 b16 a16 g16 f16 e16 d16 | % 52
     }
     \alternative {
       { c4 r16 b16 a16 as16 }
             | % 53
       { c4 r16 e16 dis16 e16 }
     }
 }

 PartPOneVoiceOneChords =  \chordmode {
     \partial 8. s8. | % 1
     \repeat volta 2 {
         | % 2
         a16:m s8 s16 s16 s16 s16 s16 | % 3
         e16:7 s8 s16 s16 s16 s16 s16 | % 4
         s16 s16 s16 s16 s16 s16 s16 s16 | % 5
         a4:m s16 s16 s16 s16 | % 6
         d16:m s8 s16 s16 s16 s16 s16 | % 7
         a16:m s8 s16 s16 s16 s16 s16 | % 8
         b16:7 s16 s16 s16 s16 s16 s16 s16 | % 9
         e4:7 s16 s16 s16 s16 | \barNumberCheck #9
         a16:m s8 s16 s16 s16 s16 s16 | % 11
         e16:7 s8 s16 s16 s16 s16 s16 | % 12
         s16 s16 s16 s16 s16 s16 s16 s16 | % 13
         a4:m s16 s16 s16 s16 | % 14
         d16:m s8 s16 s16 s16 s16 s16 | % 15
         a16:m s8 s16 s16 s16 s16 s16 | % 16
         e16:7 s16 s16 s16 s16 s16 s16 s16 }
     \alternative { {
             | % 17
             a8:m s8 s16 s16 s16 s16 }
         } | % 18
     a8:m s8 s16 s16 s16 s16

   \repeat volta 2 {
         | % 19
         s16 s16 s16 s16 a16:1 s16 s16 s16 | \barNumberCheck #19
         a16:6 s16 s16 s16 a16:5 s16 s16 s16 | % 21
         a16:6 s16 s16 s16 a16:5 s16 s16 s16 | % 22
         e16:9 s16 s16 s16 e16:7 s16 s16 s16 | % 23
         e16:7/+a s16 s16 s16 e16:1 s16 s16 s16 | % 24
         e16:9 s16 s16 s16 e16:7 s16 s16 s16 | % 25
         e16:7/+a s16 s16 s16 e16:7 s16 s16 s16 | % 26
         a16:6 s16 s16 s16 a16:5 s16 s16 s16 | % 27
         a16:5 s16 s16 s16 a16:1 s16 s16 s16 | % 28
         a16:6 s16 s16 s16 a16:5 s16 s16 s16 | % 29
         fis16:7 s16 s16 s16 s16 s16 s16 s16 | \barNumberCheck #29
         b16:m s16 s16 s16 s8 s8 | % 31
         d16:5 s16 s16 s16 dis16:1 s16 s16 s16 | % 32
         a16:5 s16 s16 s16 fis16:7 s16 s16 s16 | % 33
         b16:m s16 s16 s16 e16:7 s16 s16 s16 }
     \alternative { {
             | % 34
             s4 s16 s16 s16 s16 }
         {
             | % 35
             a4:5 s16 s16 s16 s16 }
         } \bar "||"
     a4:5 s16 s16 s16 s16 \repeat volta 2 {
         | % 37
         c16:5 s16 s16 s16 s16 s16 s16 s16 | % 38
         g8.:7 s16 s16 s16 s16 s16 | % 39
         s16 s16 s16 s16 s16 s16 s16 s16 | \barNumberCheck #39
         c8.:5 s16 s16 s16 s16 s16 | % 41
         s8 s16 s16 s8 s16 s16 | % 42
         g8:7 s8 s16 s16 s16 s16 | % 43
         s8 s16 s16 s8 s16 s16 | % 44
         c16:5 s8 s16 s16 s16 s16 s16 | % 45
         s16 s16 s16 s16 s16 s16 s16 s16 | % 46
         g8.:7 s16 s16 s16 s16 s16 | % 47
         g16:7 s16 s16 s16 s16 s16 s16 s16 | % 48
         c8.:5 s16 s16 s16 s16 s16 | % 49
         f16:5 s16 s16 s16 fis16:1 s16 s16 s16 | \barNumberCheck #50
         c16:5 s16 s16 s16 a16:7 s16 s16 s16 | % 51
         d16:m s16 s16 s16 g16:7 s16 s16 s16 }
     \alternative { {
             | % 52
             c4:5 s16 s16 s16 s16 }
         {
             | % 53
             c4:5 e16:7 s16 s16 s16 }
         } }


% The score definition
\score {
        
      % \context ChordNames = "PartPOneVoiceOneChords" { \PartPOneVoiceOneChords}
        \new Staff {  \PartPOneVoiceOne }
            % \set Staff.instrumentName = "Track 1"
            
            %% \context Staff << 
            %%     % \mergeDifferentlyDottedOn\mergeDifferentlyHeadedOn
            %%     \context Voice = "PartPOneVoiceOne" {  \PartPOneVoiceOne }
            %%     >>
            %% >>
        
    \layout {}
    % To create MIDI output, uncomment the following line:
    %  \midi {\tempo 4 = 120 }
  }

