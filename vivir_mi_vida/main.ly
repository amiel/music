\version "2.24.4"

% Define common musical phrases for reuse
melodyVerse = \relative c' {
  \key c \major
  c4 d e f | g2 e |
}

% Define each part
partOne = \relative c' {
  \melodyVerse
  % Additional music here
}

partTwo = \relative c' {
  \melodyVerse
  % Additional music here
}

partThree = \relative c {
  % Low background part
}

bassPart = \relative c {
  % Bass part
}

% Transpositions
transposedBb = #(define-music-function (m) (ly:music?) \transpose c bes m)
transposedEb = #(define-music-function (m) (ly:music?) \transpose c ees m)

% Individual parts for printing
leadPartC = \new Staff \partOne
leadPartBb = \new Staff \transposedBb \partOne
leadPartEb = \new Staff \transposedEb \partOne

middlePartC = \new Staff \partTwo
middlePartBb = \new Staff \transposedBb \partTwo
middlePartEb = \new Staff \transposedEb \partTwo

lowPartC = \new Staff \partThree
lowPartBb = \new Staff \transposedBb \partThree
lowPartEb = \new Staff \transposedEb \partThree

bassC = \new Staff \bassPart
bassBb = \new Staff \transposedBb \bassPart
bassEb = \new Staff \transposedEb \bassPart

% Full Score in C
\book {
  \score {
    <<
      \new StaffGroup <<
        \leadPartC
        \middlePartC
        \lowPartC
        \bassC
      >>
    >>
    \layout {}
  }
}

% Individual part books
\book {
  \header { title = "Lead Part (C)" }
  \score { \leadPartC \layout {} }
}

\book {
  \header { title = "Lead Part (B-flat)" }
  \score { \leadPartBb \layout {} }
}

\book {
  \header { title = "Lead Part (E-flat)" }
  \score { \leadPartEb \layout {} }
}

\book {
  \header { title = "Middle Part (C)" }
  \score { \middlePartC \layout {} }
}

\book {
  \header { title = "Middle Part (B-flat)" }
  \score { \middlePartBb \layout {} }
}

\book {
  \header { title = "Middle Part (E-flat)" }
  \score { \middlePartEb \layout {} }
}

\book {
  \header { title = "Low Background Part (C)" }
  \score { \lowPartC \layout {} }
}

\book {
  \header { title = "Low Background Part (B-flat)" }
  \score { \lowPartBb \layout {} }
}

\book {
  \header { title = "Low Background Part (E-flat)" }
  \score { \lowPartEb \layout {} }
}

\book {
  \header { title = "Bass Part (C)" }
  \score { \bassC \layout {} }
}

\book {
  \header { title = "Bass Part (B-flat)" }
  \score { \bassBb \layout {} }
}

\book {
  \header { title = "Bass Part (E-flat)" }
  \score { \bassEb \layout {} }
}

