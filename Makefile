SHELL:=/bin/bash

.PHONY : clean

LOG_FILES:=$(wildcard *.log) $(wildcard ./chapters/*/*.log)
AUX_FILES:=$(wildcard *.aux) $(wildcard ./chapters/*/*.aux)
TEX_FILES:=$(wildcard *.tex) $(wildcard ./chapters/*/*.tex)
PDF_FILES:=$(wildcard ./chapters/*/*.pdf)

clean:
	-@rm $(LOG_FILES) 2>/dev/null
	-@rm $(AUX_FILES) 2>/dev/null

cleanAll: clean
	-@rm $(PDF_FILES) 2>/dev/null
	-@rm ./main.pdf 2>/dev/null

introduction.pdf: ./chapters/introduction/introduction.tex
	(cd ./chapters/introduction && pdflatex introduction.tex && mv introduction.pdf ../..)
	#open $@
introduction: introduction.pdf
#
#calculus.pdf: ./chapters/calculus/calculus.tex 
#	(cd ./chapters/calculus && pdflatex calculus.tex && mv calculus.pdf ../..)
#	#open $@
#calculus: calculus.pdf
#
#distributions.pdf: ./chapters/distributions/distributions.tex 
#	(cd ./chapters/distributions && pdflatex distributions.tex && mv distributions.pdf ../..)
#	#open $@
#distributions: distributions.pdf
#
#entropy.pdf: ./chapters/entropy/entropy.tex 
#	(cd ./chapters/entropy && pdflatex entropy.tex && mv entropy.pdf ../..)
#	#open $@
#entropy: entropy.pdf
#
#linear_algebra.pdf: ./chapters/linear_algebra/linear_algebra.tex 
#	(cd ./chapters/linear_algebra && pdflatex linear_algebra.tex && mv linear_algebra.pdf ../..)
#	#open $@
#linear_algebra: linear_algebra.pdf

normal_distribution.pdf: ./chapters/normal_distribution/normal_distribution.tex 
	(cd ./chapters/normal_distribution && pdflatex normal_distribution.tex && mv normal_distribution.pdf ../..)
	#open $@
normal_distributions: normal_distributions.pdf

main.pdf : main.tex $(TEX_FILES)
	pdflatex main.tex

test:
	echo $(TEX_FILES)
	echo $(LOG_FILES)

all : main.pdf
	open main.pdf
