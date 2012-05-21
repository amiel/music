
bass = \relative c {
  \set Score.markFormatter = #format-mark-circle-letters
  \set Staff.instrumentName = #"Bass"
  \key g \minor

  \mark \markup { \box "A" }

  \repeat volta 3 {
    g4. g8 d'4. d8 |
    ees4. ees8 d4. d8 |
    c4. c8 bes4. bes8 |
    a4. a8 d4 d, |

    g4. g8 a4. a8 |
    bes2. c4~ |
    c1 |
  }

  \alternative {
    { a2 a4 r4 | }
    { r2 r4 a4 | }
    {
      \time 2/4
      r2 |
      \time 4/4

      g4 g g g8 d |
      g4 g g g4 |
    }
  }

  \mark \markup { \box "B" }

  \repeat volta 4 {
    \repeat percent 2 {
      g4 r8 bes8 r4 d4 |
    }
%     g,4 r8 bes8 r4 d4 |
    c4 r8 ees8 r4 g4 |
  }

  \alternative {
    { a,4 r8 ees'8 d4 d,4 | }
    { a'4 r8 ees'8-> d4-> d,4 | }
  }


  \mark \markup { \box "C" }

  \repeat volta 2 {
    \repeat percent 3 {
      c'4\f c c c8 c |
      c4\p c c c8 c |
    }

    c4\f c c c8 c |
  }

  \alternative {
    { c4\p c c c8 c |}
    { c1 |}
  }



}
