\header{
	filename = "fox.ly"
	title             = "the Fox"
	maintainer        = "Amiel Martin"
}

\version "2.8.6"


\paper {  
  indent = 0\mm
}

\score {
	<<
		\chords { r8 | g1 | r2 r8 d8 r4 | g2 c2 | g4 d4 g2 | d2 g2 | c2 g2 | c4 d4 g2 }
		\new Staff \relative c'' {
			\key g \major
			\time 4/4
			\partial 8 d8 |
				d8 b16 b~  b8 b16 b  a16 g8.  g8. d'16 |
				d8 d16 d  d8. b16 b8[ a] a[ a16 a] |
				b16 b b a~ a8. g16 c8 c c c |
				b g  a fis  g8.[ g16]~ g4 |
				a8.[ a16]~ a4 a16( d8) d16~ d4 |
				c16 c c e~ e8. c16 d8 d16( c) b8. b16 |
				a8 c b a a16( g8.) g4
		}
		
		\addlyrics { 
			       \set stanza = "1. "
				the 
				fox went out on a chil -- ly night he
				prayed for the moon to give him light for a
				ma -- ny a mile to go that night
				be -- fore he reach the town -- o,
				town -- o, town -- o,
				ma -- ny a mile to go that night
				be -- fore he reach the town -- o
		}
	>>
}



%{

1. The fox went out for a chase one night
prayed to the moon to give him light
for he had many a mile to go that night
before he reached the town-o town-o town-o
he had many a mile to go that night
before he reached the town-o.
2. He ran right up to the farmers pen
ducks and the geese were kept therein
he said a couple of you gonna grease my chin
before I leave this town-o town-o town-o
a couple of you gonna grease my chin
before I leave this town-o.
3. He grabbed the grey goose by the neck
slung the little one over his back
he didn't mind the quack quack quack
and the legs all dangling down-o down-o down-o
he didn't mind the quack quack
and the legs all dangling down-o.
4. Old Mother Pitter Patter jumped out of bed
out of the window she popped out her head yelling
John, John the grey goose is gone
and the fox is on the town-o town-o town-o
John, John the grey goose is gone
and the fox is on the town-o.
5. John he ran to the top of the hill
blew his horn both loud and shrill
the fox said I'd better flee with my kill
for he'll soon be on my trail-o trail-o trail-o
the fox said I'd better flee with my kill
for he'll soon be on my trail-o.
6. He ran right up to his cozy den
there were his little ones eight nine ten
they said daddy won't you please go back again
for it must be a mighty fine town-o town-o town-o
daddy wont you please go back again
for it must be a mighty fine town-o.
7. The fox and his wife without any strife
cut up the goose with a fork and knife
they'd never had such a supper in their life
and the little ones chewed on the bones-o bones-o bones-o
never had such a supper in their life
and the little ones chewed on the bones-o.
}