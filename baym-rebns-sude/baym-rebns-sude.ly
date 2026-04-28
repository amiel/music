\version "2.24.4"
% automatically converted by musicxml2ly from Baym-rebns-sude.xml
\pointAndClickOff

PartPOneVoiceOne =  \relative cis' {
    \repeat volta 2 {
        \clef "treble" \time 2/4 \key c \major | % 1
        cis16 d16 e8 e8 e8 | % 2
        e2 | % 3
        gis16 a16 b8 a16 gis16 f8 | % 4
        e2 | % 5
        gis4 a4 | % 6
        b4 a4 | % 7
        gis4. f8 | % 8
        gis8 f8 e8 d8 | % 9
        cis16 d16 e8 e8 e8 | \barNumberCheck #10
        e2 | % 11
        e16 f16 gis8 f16 e16 d8 | % 12
        d2 | % 13
        d'8 c8 b8 a8 | % 14
        gis8 d8 e8 f8 | % 15
        e2 ~ | % 16
        e4 r4 }
    \repeat volta 2 {
        | % 17
        e8 a8 gis8 a8 | % 18
        b8 c8 b8 e,8 | % 19
        a4. b16 c16 | \barNumberCheck #20
        a2 | % 21
        d4 e4 | % 22
        d4 c4 | % 23
        b4. a8 | % 24
        b8 a8 gis4 | % 25
        gis4 a4 | % 26
        b4 a4 | % 27
        gis4. f8 | % 28
        gis8 f8 e8 d8 | % 29
        gis8 a8 a8 a8 | \barNumberCheck #30
        gis16 b16 a16 gis16 f16 e16 d16 f16 | % 31
        e4 ~ e16 gis16 b16 gis16 | % 32
        e2 }
    \repeat volta 2 {
        | % 33
        c'16 b16 c16 b16 c16 b16 a8 | % 34
        a16 gis16 a16 gis16 a16 gis16 f8 | % 35
        e16 f16 gis8 f16 e16 d8 | % 36
        d2 | % 37
        gis8 a8 a8 a8 | % 38
        gis16 b16 a8 gis8 a8 | % 39
        b4 ~ b16 a16 gis16 f16 | \barNumberCheck #40
        e2 | % 41
        c'16 b16 c16 b16 c16 b16 a8 | % 42
        a16 gis16 a16 gis16 a16 gis16 f8 | % 43
        e16 f16 gis8 f16 e16 d8 | % 44
        d2 | % 45
        d'8 c8 b8 a8 | % 46
        gis8 d8 e8 f8 | % 47
        e2 ~ | % 48
        e2 }
    }

PartPOneVoiceOneChords =  \chordmode {
    \repeat volta 2 {
        | % 1
        e16 s16 s8 s8 s8 | % 2
        s2 | % 3
        e16 s16 s8 d16:m s16 s8 | % 4
        e2 | % 5
        s4 a4:m | % 6
        e4 a4:m | % 7
        e4. s8 | % 8
        s8 s8 s8 s8 | % 9
        e16 s16 s8 s8 s8 | \barNumberCheck #10
        s2 | % 11
        s16 s16 s8 d16:m s16 s8 | % 12
        s2 | % 13
        s8 s8 s8 s8 | % 14
        s8 s8 s8 s8 | % 15
        e2 | % 16
        s4 s4 }
    \repeat volta 2 {
        | % 17
        a8:m s8 s8 s8 | % 18
        e8:7 s8 s8 s8 | % 19
        a4.:m s16 s16 | \barNumberCheck #20
        s2 | % 21
        d4:m e4:7 | % 22
        s4 a4:m | % 23
        e4. s8 | % 24
        s8 s8 s4 | % 25
        e4 a4:m | % 26
        e4 a4:m | % 27
        e4. s8 | % 28
        s8 s8 s8 s8 | % 29
        d8:m s8 s8 s8 | \barNumberCheck #30
        s16 s16 s16 s16 s16 s16 s16 s16 | % 31
        e4 s16 s16 s16 s16 | % 32
        s2 }
    \repeat volta 2 {
        | % 33
        a16:m s16 s16 s16 s16 s16 s8 | % 34
        d16:m s16 s16 s16 s16 s16 s8 | % 35
        e16 s16 s8 d16:m s16 s8 | % 36
        s2 | % 37
        s8 s8 s8 s8 | % 38
        s16 s16 s8 s8 s8 | % 39
        e4 s16 s16 s16 s16 | \barNumberCheck #40
        s2 | % 41
        a16:m s16 s16 s16 s16 s16 s8 | % 42
        d16:m s16 s16 s16 s16 s16 s8 | % 43
        e16 s16 s8 d16:m s16 s8 | % 44
        s2 | % 45
        d8:m s8 s8 s8 | % 46
        s8 s8 s8 s8 | % 47
        e2 | % 48
        s2 }
    }


% The score definition
\score {
    <<
        
        \context ChordNames = "PartPOneVoiceOneChords" { \PartPOneVoiceOneChords}
        \new Staff
        <<
            \context Staff << 
                \mergeDifferentlyDottedOn\mergeDifferentlyHeadedOn
                \context Voice = "PartPOneVoiceOne" {  \PartPOneVoiceOne }
                >>
            >>
        
        >>
    \layout {}
    % To create MIDI output, uncomment the following line:
    %  \midi {\tempo 4 = 120 }
    }

