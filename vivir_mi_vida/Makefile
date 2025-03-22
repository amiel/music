.PHONY: watch

.DEFAULT: full_score_C.pdf

full_score_C.pdf: main.ly
	lilypond main.ly

watch:
	find . -name '*.ly' | entr make 

