SRC_PATH = main.adoc
TGT_NAME = out
OPTIONS = -r asciidoctor-mathematical -r asciidoctor-bibtex -n -v

default: pdf

pdf:
	asciidoctor-pdf $(OPTIONS) -o $(TGT_NAME).pdf $(SRC_PATH)

html:
	asciidoctor $(OPTIONS) -b html -o $(TGT_NAME).html $(SRC_PATH)

clean:
	rm -f $(TGT_NAME).*
	rm -f stem-*

all: clean html pdf
