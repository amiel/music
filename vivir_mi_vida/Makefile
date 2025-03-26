.PHONY: watch

.DEFAULT: full_score_C.pdf rhythm-exercise.pdf

score_C.pdf: main.ly
	lilypond main.ly

rhythm-exercise.pdf: rhythm-exercise.ly
	lilypond rhythm-exercise.ly


watch:
	find . -name '*.ly' | entr make 

