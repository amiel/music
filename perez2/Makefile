.PHONY: watch

.DEFAULT: perez2.pdf

perez2.pdf: main.ly
	@echo
	@echo "****************************"
	@echo
	lilypond main.ly
	@echo

watch:
	find . -name '*.ly' | entr make 

