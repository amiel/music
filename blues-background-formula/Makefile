.PHONY: watch

.DEFAULT: blues-background-formula.pdf blues-bass-line.pdf

blues-background-formula.pdf: blues-background-formula.ly
	@echo
	@echo "****************************"
	@echo
	lilypond blues-background-formula.ly
	@echo

blues-bass-line.pdf: blues-bass-line.ly
	@echo
	@echo "****************************"
	@echo
	lilypond blues-bass-line.ly
	@echo

watch:
	find . -name '*.ly' | entr make
