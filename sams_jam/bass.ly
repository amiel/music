\version "2.22.2"

basse = \relative c, {
  \key c \major
  d8. e16 fis  a b d r16 d8. r4 |
  f,8. g16 a c d f( f4) r4 |
  g,8. a16 c d f g r16 g8. r4 |
  a16[ aes r g] r[ f r d] r[ c r a] r[ g f r] |
  % a16 aes8 g16 r16 f8 d16 r c8  a16 r g16 f8  |
}

% \score {
%   <<
%     \new Staff \transpose bes c'' {
%       \time 4/4
%       \basse
%     }
% 
%     \new Staff \relative {
%       \clef bass
%       \time 4/4
%       \basse
%     }
%   >>
% }

