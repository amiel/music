\version "2.24.4"

date = #(strftime "%Y-%m-%d" (localtime (current-time)))

revisionInfo = \markup { \concat { "Revision " \date } }

title = \markup "Perez 1"

% \pointAndClickOff

%%%%%%%%%%%%%%%%%
% modules
%



Trumpet = {
  \key g \major
  \clef treble
  
  \relative c' {
    \partial 4 r4 |
    \repeat volta 2 {
      R1*5 |
      r8 d'^\markup { \italic "2nd time" } r2. |
      R1 |
    }

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
}




Sax = {
  \key g \major
  \clef treble
 
 \relative c' {
   \partial 4 r4 |
   
   \repeat volta 2 {
      g8. b16 e8 d r e d4 |
      g,8. b16 e8 d r e d4 |
      fis,8. a16 e'8 d r e d4 |
      fis,8. a16 e'8 d r e d4 |
      fis,8. a16 e'8 d r e d4 |
      fis,8. a16 e'8 d r e d4 |
      g,8. b16 e8 d r e d4 |
   }
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
  
}

Trombone = {
  \key g \major
  \clef bass
 

  \relative c {
    \partial 4 d4\glissando |
    \repeat volta 2 {
      b'4 r r c8 a |
      b4 r c8 b a g |
      a4 r r2 |

      r2. d,4\glissando | a'4 r r b8 g |
      a4 r b8 a g fis |
      g4 r r2 |
    }

    \alternative {
      \volta 1 {
        r2. g4\glissando | d'4 r r e8 cis |
        d4 r b8 cis d e |
        fis4 r r g8 e |
        fis4 r g8 fis e d |
        e4  r r fis8 d |
        e4 r fis8 e d cis |
        d4 r r2 |
        r4 a\bendAfter -4 r d,4  |
      }

      \volta 2 {   
        R1 |
        
       <c e>1\p |
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
}


trombonePartC = \new Staff \Trombone
trumpetPartBb = \new Staff \transpose bes c' \Trumpet
bariSaxPartEb = \new Staff \transpose ees c' \Sax
%% melodyPartEb = \new Staff \transpose ees c \melodyPart

#(set-global-staff-size 24)

\book {
  \bookOutputName "perez1"
  \header {
    title = \title
    tagline = \revisionInfo
    subtitle = "Drop Sequence"
    instrument = "trombone" 
  }
  \score {
 
    <<
        \trumpetPartBb
        \bariSaxPartEb
        \trombonePartC
    >>
      
    \layout {}
  }
}
