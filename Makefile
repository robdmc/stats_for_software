SHELL:=/bin/bash

.PHONY : clean

LOG_FILES:=$(wildcard *.log) $(wildcard ./chapters/*/*.log)
AUX_FILES:=$(wildcard *.aux) $(wildcard ./chapters/*/*.aux)
AUX_FILES:=$(wildcard *.toc) $(wildcard ./chapters/*/*.toc)
TEX_FILES:=$(wildcard *.tex) $(wildcard ./chapters/*/*.tex)
PDF_FILES:=$(wildcard ./chapters/*/*.pdf)

clean:
	-@rm $(LOG_FILES) 2>/dev/null | true
	-@rm $(AUX_FILES) 2>/dev/null | true

cleanAll: clean
	-@rm $(PDF_FILES) 2>/dev/null | true
	-@rm ./main.pdf 2>/dev/null | true

introduction.pdf: ./chapters/introduction/introduction.tex
	(cd ./chapters/introduction && pdflatex introduction.tex && mv introduction.pdf ../..)
	#open $@
introduction: introduction.pdf

normal_distribution.pdf: ./chapters/normal_distribution/normal_distribution.tex 
	(cd ./chapters/normal_distribution && pdflatex normal_distribution.tex && mv normal_distribution.pdf ../..)
	#open $@
normal_distribution: normal_distribution.pdf

beta_distribution.pdf: ./chapters/beta_distribution/beta_distribution.tex 
	(cd ./chapters/beta_distribution && pdflatex beta_distribution.tex && mv beta_distribution.pdf ../..)
	#open $@
beta_distribution: beta_distribution.pdf

gamma_distribution.pdf: ./chapters/gamma_distribution/gamma_distribution.tex 
	(cd ./chapters/gamma_distribution && pdflatex gamma_distribution.tex && mv gamma_distribution.pdf ../..)
	#open $@
gamma_distribution: gamma_distribution.pdf

lognormal_distribution.pdf: ./chapters/lognormal_distribution/lognormal_distribution.tex 
	(cd ./chapters/lognormal_distribution && pdflatex lognormal_distribution.tex && mv lognormal_distribution.pdf ../..)
	#open $@
lognormal_distribution: lognormal_distribution.pdf


main.pdf : main.tex $(TEX_FILES)
	# call latex twice to make references.  (may need more iterations later)
	pdflatex main.tex
	pdflatex main.tex

test:
	echo $(TEX_FILES)
	echo $(LOG_FILES)

all : main.pdf
	open main.pdf
