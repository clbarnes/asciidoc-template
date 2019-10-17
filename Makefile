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

docbook:
	asciidoctor $(OPTIONS) -b docbook -o $(TGT_NAME).dbk $(FILE) && $(MAKE) to-tgt

to-tgt: clean-stem
	for fpath in `find . -maxdepth 1 -name "*.pdf" -o -name "*.html" -o -name "*.dbk"` ; do mv $$fpath $(TGT_DIR)/ ; done

clean-stem:
	rm -f stem-*

clean-out:
	rm -f $(TGT_DIR)/$(TGT_NAME).*

clean: clean-stem clean-out

all: clean html pdf docbook

count: docbook
	echo "\n\n`docbook_status $(TGT_DIR)/$(TGT_NAME).dbk`"
