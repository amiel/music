.DEFAULT: bridges.pdf

.PHONY: watch

main.pdf: main.ly
	lilypond main.ly

bridges.pdf: bridges.ly
	lilypond bridges.ly

watch:
	find . -name '*.ly' | entr make  bridges.pdf

