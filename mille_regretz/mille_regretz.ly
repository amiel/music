

\version "2.12.2"

global = {
  \key c \major
  \time 2/2
	\set suggestAccidentals = ##t 
}
sopranonotes = \relative c' {
	e1 |
	a2 a |
	g2. \melisma f8 e |
	d4. c8 d2 |
	c4 \melismaEnd c' c c |
	b4 b a2 |
	r2 c2 |
	% bar 8
	b2 a2( |
	a4) g8 f g2 |
	r2 c |
	b2 a( |
	a4) g8 f g2 |
	a4 a a a |
	g4 g f2 |
	% bar 15
	e1 |
	r1 |
	b'1 |
	c2 a |
	b2 e |
	d2. c4 |
	b4 a gis2 |
}
sopranowords = \lyricmode {
	Mil -- le re -- gretz __ de vous  ha -- ban -- don -- ner Et
	% bar 8
	des -- lon -- \skip4 ger,
	et des -- lon -- \skip4 ger
}


altonotes = \relative c' {
	e1 |
	c2 f |
	e1 |
	r1 |
	r4 e e e |
	g2 f2 |
	e2 e |
	% bar 8
	d2 c |
	b1 |
	e1 |
	d2 c2 |
	b2 e2 |
	f2. f4 |
	e4 e d2 |
	% bar 15
	c4 c c c |
	b4 b a2 |
	b2 g' |
	e2 e |
	e2 r4 e |
	f2. e4 |
	d4 c b2 |
}
altowords = \lyricmode { Mil -- le re -- gretz de vous ha -- ban -- don -- ner }

tenornotes = \relative c' {
	r1 |
	r1 |
	e2. f4 |
	g2 g |
	a2 r4 a |
	g4 e f d |
	a'1 |
	% bar 8
	r1 |
	r1 |
	c1 |
	g2 a |
	e1 |
	r1 |
	r1 |
	% bar 15
	r4 e' e e |
	e4 e d2 | e2 e |
	c2 c |
	b1 |
	r1 |
	r2 e2 |
}
tenorwords = \lyricmode { Mil - le re -- gretz de vous ha -- ban -- don -- ner }

bassnotes = \relative c { \clef bass
	e1 |
	f2 d |
	e2. \melisma d8 c |
	b4. a8 b2 |
	a1 \melismaEnd |
	r1 |
	c'1 |
	% bar 8
	g2 a |
	e1 |
	r1 |
	r1 |
	r2 c |
	f2. f4 |
	c4 c d2 |
	% bar 15
	a4 a'4 a a |
	g4 g f2 |
	e2 e |
	a2 a |
	e1 |
	r1 |
	r2 e |
}
basswords = \lyricmode { Mil -- le re -- gretz __ Et }



\header {
	title = "Mille regretz"
	subsubtitle = "Chanson"
	composer = "Josquin des Prez"
}

\score {

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

%{\markup {
	Mille regretz de vous habandonner
	Et d'eslonger vostre fashe amoureuse,
	Jay si grand dueil et paine douloureuse,
	Qu'on me verra brief mes jours definer.
	
	A thousand regrets at deserting you
	and leaving behind your loving face,
	I feel so much sadness and such painful distress,
	that it seems to me my days will soon dwindle away.
}%}


\markup {
  \fill-line {
    \column {
			"Mille regretz de vous habandonner"
			"Et d'eslonger vostre fashe amoureuse,"
			"Jay si grand dueil et paine douloureuse,"
			"Qu'on me verra brief mes jours definer."

    }
    \column {
			"A thousand regrets at deserting you"
			"and leaving behind your loving face,"
			"I feel so much sadness and such painful distress,"
			"that it seems to me my days will soon dwindle away."
    }
  }
}