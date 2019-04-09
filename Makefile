ifndef FILE
FILE = main.adoc
endif
ifndef EXTRA_ARGS
EXTRA_ARGS =
endif
TGT_DIR = tgt
TGT_NAME = out
OPTIONS_DIR = options
OPTIONS = $(shell cat $(OPTIONS_DIR)/*.txt) $(EXTRA_ARGS)

default: pdf

pdf:
	asciidoctor-pdf $(OPTIONS) -o $(TGT_NAME).pdf $(FILE) && $(MAKE) to-tgt

html:
	asciidoctor $(OPTIONS) -b html -o $(TGT_NAME).html $(FILE) && $(MAKE) to-tgt

to-tgt: clean-stem
	for fpath in `find . -maxdepth 1 -name "*.pdf" -o -name "*.html"` ; do mv $$fpath $(TGT_DIR)/ ; done

clean-stem:
	rm -f stem-*

clean-out:
	rm -f out.*

clean: clean-stem clean-out

all: clean html pdf
