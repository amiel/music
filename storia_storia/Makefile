.PHONY: watch

.DEFAULT: melody.pdf

melody.pdf: melody.ly
	lilypond melody.ly


watch:
	find . -name '*.ly' | entr -c make 


