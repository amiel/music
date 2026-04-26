.PHONY: watch

.DEFAULT: perez1.pdf

perez1.pdf: main.ly
	@echo
	@echo "****************************"
	@echo
	lilypond main.ly
	@echo

watch:
	find . -name '*.ly' | entr make 

