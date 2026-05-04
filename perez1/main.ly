\version "2.24.4"

date = #(strftime "%Y-%m-%d" (localtime (current-time)))

revisionInfo = \markup { \concat { "Revision " \date } }

title = \markup "Perez 1"

% \pointAndClickOff

%%%%%%%%%%%%%%%%%
% modules
%

global = {
  \key g \major
  \clef treble
  \tempo 4=125
}

Trumpet = {
    \global
  \relative c' {
    
    \repeat segno 2 {
        
      \partial 4 r4 |
      
      \repeat volta 2 {
        R1*5 |
        r8 d'^\markup { \italic "2nd/3rd time" } r2. |
        R1 |
        
        \alternative {
          \volta 1 {
            R1*8 |
            d4 r r2 |
          }
    
          \volta 2 { 
            r2. d,4\glissando | g2. a8 fis |
            g2 e8 fis g a |
            b2. c8 ais |
            b2 c8 b a gis |
            a2. b8 gis |
            a2 b8 a g fis |
            g4 r4 r2 |
            r2 r8 d'8\bendAfter -3 r4 |
          }
        }
      }
      
      \repeat volta 2 {
        R1*2 |
        \alternative {
          { R1*2 }
          { R1 | r4 r8 a d-^ r8 r4 | }
        }
      }
      
      \fine
      \bar "|."
      
      fis8-^ r8 r4 a8-^ r8 r4 |
      d8-^ r8 r4 r2 |\bar "||"
    }
  }
}




Sax = {
  \global
 
 \relative c' {
   \repeat segno 2 {
     \partial 4 r4 |
     
     \repeat volta 2 {
        g8. b16 e8 d r e d4 |
        g,8. b16 e8 d r e d4 |
        fis,8. a16 e'8 d r e d4 |
        fis,8. a16 e'8 d r e d4 |
        fis,8. a16 e'8 d r e d4 |
        fis,8. a16 e'8 d r e d4 |
        g,8. b16 e8 d r e d4 |
       
       \alternative {
         {
           g,8. b16 e8 d r e d4 |
        
            b8. d16 g8 fis r g fis4 |
            b,8. d16 g8 fis r g fis4 |
            a,8. d16 g8 fis r g fis4 |
            a,8. d16 g8 fis r g fis4 |
            g,8. cis16 fis8 e r fis e4 |
            g,8. cis16 fis8 e r fis e4 |
            d4 r4 r2 | R1 |
         }
         
         {
           g,8. b16 e8 d r e d4 |
           
           <c e>1\p |
           q |
           g2\f f |
           e1 |
           <c' e>1\p |
           <d fis> |
           e4 r4 r2 |
           R1 |
         }
       }
     }
     
     \repeat volta 2 {
       d'8 d16 cis(cis) d cis8 d b g16 d g d' |
       cis8 cis16 c(c) cis c8 cis a fis16 d fis cis' |
  
     
       \alternative {
         {
           b8 b16 ais(ais) b ais8 b g e16 cis e b' |
           a8 r8 r4 r2 |
         }
         {
           b8 b16 ais(ais) b16 g8 cis cis16 a(a) cis e8 |
           d8 r r a, d-^ r r4 |
         }
       }
     }
   
     \fine
     \bar "|."
      
      d,8-^ r8 r4 d8-^ r8 r4 |
      d8-^ r8 r4 r2 |\bar "||"
   }
  }
  
}

Trombone = {
  \global

  \relative c {
    \repeat segno 2 {
      \partial 4 d4\glissando |
      \repeat volta 2 {
        b'4 r r c8 a |
        b4 r c8 b a g |
        a4 r r2 |
  
        r2. d,4\glissando | a'4 r r b8 g |
        a4 r b8 a g fis |
        g4 r r2 |
  
        \alternative {
          \volta 1 {
            r2. g4\glissando | d'4 r r e8 cis |
            d4 r b8 cis d e |
            fis4 r r g8 e |
            fis4 r g8 fis e d |
            e4  r r fis8 d |
            e4 r fis8 e d cis |
            d4 r r2 |
            r4 a\bendAfter -4 r d,4 \glissando \bar "" \once \hideNotes \grace { b'32 } |
          }
    
          \volta 2 {   
            R1 |
            
           <c, e>1\p |
           q |
           g'2\f f |
           e1 |
           <c e>1\p |
           <d fis> | 
           e4 r4 r2 |
           r2 r8 d 8\bendAfter -3 r4 |
          }
        }
      }
      
      \repeat volta 2 {
        R1*2 |
        
        \alternative {
          { R1 | r8 d\ff f e d f e d | }
          { R1*2 }
        }
      }
    
     \fine
     \bar "|."
      
      d8-^ r8 r4 fis8-^ r8 r4 |
      fis8-^ r8 r4 r d\glissando \bar "" \once \hideNotes \grace { b'32 } |\bar "||"
    }
  }
}


% Concert pitch parts (for score)
trumpetPartC = \new Staff \with { instrumentName = "Trumpet" } \Trumpet
saxPartC = \new Staff \with { instrumentName = "Bari Sax" } \transpose c c' \Sax
trombonePartC = \new Staff \with { instrumentName = "Trombone" } \Trombone

% Transposed parts (for individual parts)
trumpetPartBb = \new Staff \transpose bes c' \Trumpet
bariSaxPartEb = \new Staff \transpose ees c' \Sax

#(set-global-staff-size 24)

% Score -- all parts at concert pitch
\book {
  \bookOutputName "perez1-score"
  \header {
    title = \title
    tagline = \revisionInfo
    subtitle = "Drop Sequence"
    instrument = "Score"
  }
  \score {
    <<
      \trumpetPartC
      \saxPartC
      \trombonePartC
    >>
    \layout {}
  }
}

% Trumpet in Bb
\book {
  \bookOutputName "perez1-trumpet"
  \header {
    title = \title
    tagline = \revisionInfo
    subtitle = "Drop Sequence"
    instrument = "Trumpet in B\\flat"
  }
  \score {
    \trumpetPartBb
    \layout {}
  }
}

% Bari Sax in Eb
\book {
  \bookOutputName "perez1-bari-sax"
  \header {
    title = \title
    tagline = \revisionInfo
    subtitle = "Drop Sequence"
    instrument = "Bari Sax in E\\flat"
  }
  \score {
    \bariSaxPartEb
    \layout {}
  }
}

% Trombone
\book {
  \bookOutputName "perez1-trombone"
  \header {
    title = \title
    tagline = \revisionInfo
    subtitle = "Drop Sequence"
    instrument = "Trombone"
  }
  \score {
    \new Staff \Trombone
    \layout {}
  }
}
