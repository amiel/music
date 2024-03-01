.DEFAULT: main.pdf

.PHONY: watch

main.pdf: main.ly
	lilypond main.ly

watch:
	find . -name '*.ly' | entr make 

