
\version "2.22.2"

melody = \relative c''' {
  r8 bes ges4 ees bes |
  aes' aes aes8( bes) f ges( |
  ges4) r ges8 f4 ees8 |
  des8 bes4 des8 bes8 aes ges aes |
  bes ees des2 r8 ces8 |
  bes8 aes4 ges8 ees ges aes des |
  bes1
}

blyrics = \lyricmode {
  Li- o lei- a |
  lei- a li- a le

  O lai- e |
  lai- e lai- a lai- e lai- i lai- a

  o | lai- e lai- i lai- e lai- a
}

% \transpose ees c {
%    \melody
% }

\score {
  <<
    \new Voice = "one" {
      \time 4/4
      \melody
    }
    \new Lyrics \lyricsto "one" {
      \blyrics
    }
  >>
}
