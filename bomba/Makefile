.DEFAULT: bomba.pdf

.PHONY: watch

bomba.pdf: *.ly
	lilypond bomba.ly

solo.pdf: *.ly
	lilypond solo.ly

plena.pdf: plena.ly
	lilypond plena.ly

watch:
	find . -name '*.ly' | entr -s 'echo $$(basename $$0);if [ "$$(basename $$0)" = "plena.ly" ]; then make plena.pdf; else make bomba.pdf;fi'

