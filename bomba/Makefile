.DEFAULT: bomba.pdf

.PHONY: watch

bomba.pdf: *.ly
	lilypond bomba.ly

watch:
	find . -name '*.ly' | entr make bomba.pdf

