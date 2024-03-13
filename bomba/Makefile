.DEFAULT: bomba.pdf

.PHONY: watch

bomba.pdf: *.ly
	lilypond bomba.ly

solo.pdf: *.ly
	lilypond solo.ly

watch:
	find . -name '*.ly' | entr make bomba.pdf solo.pdf

