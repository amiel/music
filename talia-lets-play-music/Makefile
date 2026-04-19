.DEFAULT: bridges.pdf

.PHONY: watch

bridges.pdf: bridges.ly
	lilypond bridges.ly

pencil-and-paper.pdf: pencil-and-paper.ly
	lilypond pencil-and-paper.ly

watch:
	find . -name '*.ly' | entr make bridges.pdf pencil-and-paper.pdf

