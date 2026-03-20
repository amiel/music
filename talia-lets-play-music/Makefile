.DEFAULT: bridges.pdf

.PHONY: watch

bridges.pdf: bridges.ly
	lilypond bridges.ly

bridges2.pdf: bridges2.ly
	lilypond bridges2.ly

watch:
	find . -name '*.ly' | entr make bridges.pdf bridges2.pdf

