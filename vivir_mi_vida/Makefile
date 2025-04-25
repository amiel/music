.PHONY: watch

.DEFAULT: vivir\ mi\ vida\ -\ score.pdf rhythm-exercise.pdf

vivir\ mi\ vida\ -\ score.pdf: main.ly
	lilypond main.ly

rhythm-exercise.pdf: rhythm-exercise.ly
	lilypond rhythm-exercise.ly

watch:
	find . -name '*.ly' | entr make 

