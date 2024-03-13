\version "2.24.3"

% TODO:
% [ ] staff stencil (see barril-key)
% [ ] add the rest of the rhythms
%   * corve
%   * seis corrido
%   * rule
% [x] split up in to different files
% [x] Add sica improvisations

\include "barril.ly"

\header { 
  title = "Bomba Rhythms"
}

\include "barril-key.ly"
\include "shared.ly"
\include "sica.ly"
\include "yuba.ly"
\include "cuembe.ly"
\include "holande.ly"
\include "hoyomula.ly"
\include "cunya.ly"
\include "calinda.ly"
\include "guembe.ly"

\include "sica-improvisations.ly"
