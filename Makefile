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
	asciidoctor-pdf $(OPTIONS) -o $(TGT_NAME).pdf $(FILE)

html:
	asciidoctor $(OPTIONS) -b html -o $(TGT_NAME).html $(FILE)

clean-stem:
	rm -f stem-*

clean-out:
	rm -f out.*

clean: clean-stem clean-out

all: clean html pdf
