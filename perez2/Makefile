.PHONY: all watch clean

PDFS = \
	perez2-score.pdf \
	perez2-accordion.pdf \
	perez2-trumpet.pdf \
	perez2-bari-sax.pdf \
	perez2-trombone.pdf

all: $(PDFS)

$(PDFS): main.ly
	@echo
	@echo "****************************"
	@echo
	lilypond main.ly
	@echo

watch:
	find . -name '*.ly' | entr make

clean:
	rm -f $(PDFS)
