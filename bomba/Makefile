.DEFAULT: bomba.pdf

.PHONY: watch

bomba.pdf: bomba.ly
	lilypond bomba.ly

watch:
	find . -name '*.ly' | entr make 

