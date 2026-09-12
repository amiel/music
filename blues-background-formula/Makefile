.PHONY: watch

.DEFAULT: blues-background-formula.pdf

blues-background-formula.pdf: blues-background-formula.ly
	@echo
	@echo "****************************"
	@echo
	lilypond blues-background-formula.ly
	@echo

watch:
	find . -name '*.ly' | entr make
