.PHONY: watch

.DEFAULT: blues-background-formula.pdf blues-background-formula-roots.pdf blues-bass-line.pdf

blues-background-formula.pdf: blues-background-formula.ly _formula-sheet.ly _form.ly
	@echo
	@echo "****************************"
	@echo
	lilypond blues-background-formula.ly
	@echo

blues-background-formula-roots.pdf: blues-background-formula-roots.ly _formula-sheet.ly _form.ly
	@echo
	@echo "****************************"
	@echo
	lilypond blues-background-formula-roots.ly
	@echo

blues-bass-line.pdf: blues-bass-line.ly _form.ly
	@echo
	@echo "****************************"
	@echo
	lilypond blues-bass-line.ly
	@echo

watch:
	find . -name '*.ly' | entr make
