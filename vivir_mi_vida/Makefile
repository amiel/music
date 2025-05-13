.PHONY: watch

.DEFAULT: vivir\ mi\ vida\ -\ score.pdf rhythm-exercise.pdf

vivir\ mi\ vida\ -\ score.pdf: main.ly
	@echo
	@echo "****************************"
	@echo
	lilypond main.ly
	@echo

rhythm-exercise.pdf: rhythm-exercise.ly
	lilypond rhythm-exercise.ly

watch:
	find . -name '*.ly' | entr make 

