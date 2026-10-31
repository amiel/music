.PHONY: watch

.DEFAULT: blues-background-formula.pdf blues-background-formula-roots.pdf blues-bass-line.pdf one-oclock-jump-example-C.pdf

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

blues-bass-line.pdf: blues-bass-line.ly _bass-line.ly _form.ly
	@echo
	@echo "****************************"
	@echo
	lilypond blues-bass-line.ly
	@echo

# also writes the C-bass, Bb, Eb and F parts
one-oclock-jump-example-C.pdf: one-oclock-jump-example.ly _bass-line.ly _form.ly
	@echo
	@echo "****************************"
	@echo
	lilypond one-oclock-jump-example.ly
	@echo

watch:
	find . -name '*.ly' | entr make
