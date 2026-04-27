.PHONY: watch

.DEFAULT: tico-tico.pdf

tico-tico.pdf: tico-tico.ly
	@echo
	@echo "****************************"
	@echo
	lilypond tico-tico.ly
	@echo

watch:
	find . -name '*.ly' | entr make 

tico-tico.ly: Tico-Tico.xml
	musicxml2ly --no-rest-positions --no-page-layout --no-stem-directions --no-beaming -o tico-tico.ly Tico-Tico.xml


