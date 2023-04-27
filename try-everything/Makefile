.PHONY: watch

.DEFAULT: try-everything.pdf

try-everything.pdf: try-everything.ly
	lilypond try-everything.ly


watch:
	find . -name '*.ly' | entr -c make 


