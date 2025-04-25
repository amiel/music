.PHONY: watch

.DEFAULT: get-up-stand-up-c.pdf

sget-up-stand-up-c.pdf: main.ly
	lilypond main.ly

watch:
	find . -name '*.ly' | entr make 

