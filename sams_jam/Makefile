.PHONY: watch

.DEFAULT: bass.pdf

base.pdf: bass.ly
	lilypond bass.ly

clarinet.pdf: clarinet.ly bass.ly
	lilypond clarinet.ly


watch:
	find . -name '*.ly' | entr -c make 


