\version "2.12.2"

global = {
  \key c \major
  \time 2/2
}
sopranonotes = \relative c' {
	e1 |
	a2 a |
	g2. \melisma f8 e |
	d4. c8 d2 |
	c4 \melismaEnd c' c c |
	b4 b a2 |
}
sopranowords = \lyricmode { Mil -- le re -- gretz __ de vous  ha -- ban -- don -- ner }


altonotes = \relative c' {
	e1 |
	c2 f |
	e1 |
	r1 |
	r4 e e e |
	g2 f2 |
}
altowords = \lyricmode { Mil -- le re -- gretz de vous ha -- ban -- don -- ner }

tenornotes = \relative c' {
	r1 |
	r1 |
	e2. f4 |
	g2 g |
	a2 r4 a |
	g4 e f d |
}
tenorwords = \lyricmode { Mil - le re -- gretz de vous ha -- ban -- don -- ner }

bassnotes = { \clef bass
	e1 |
	f2 d |
	e2. \melisma d8 c |
	b4. a8 b2 |
	a1 \melismaEnd |
	r1 |
}
basswords = \lyricmode { Mil -- le re -- gretz __ Et }

\score{
  \context ChoirStaff
  <<
    \context Staff = soprano <<
      \context Voice = sop { << \global \sopranonotes >> }
      \lyricsto "sop" \new Lyrics \sopranowords
    >>
    \context Staff = alto <<
      \context Voice = alt { << \global \altonotes >> }
      \lyricsto "alt" \new Lyrics \altowords
    >>
    \context Staff = tenor <<
      \context Voice = ten { << \global \tenornotes >> }
      \lyricsto "ten" \new Lyrics \tenorwords
    >>
    \context Staff = bass <<
      \context Voice = bas { << \global \bassnotes >> }
      \lyricsto "bas" \new Lyrics \basswords
    >>
  >>
}
