.PHONY: watch

.DEFAULT: baym-rebns-sude.pdf

baym-rebns-sude.pdf: baym-rebns-sude.ly
	@echo
	@echo "****************************"
	@echo
	lilypond baym-rebns-sude.ly
	@echo

watch:
	find . -name '*.ly' | entr make 

baym-rebns-sude.ly: Baym-rebns-sude.xml
	musicxml2ly --no-rest-positions --no-page-layout --no-stem-directions --no-beaming -o baym-rebns-sude.ly Baym-rebns-sude.xml


