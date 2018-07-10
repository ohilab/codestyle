#
DOCNAME = codestyle
SECTIONS = ./sections
IMGS = ./images

.PHONY : all
all : $(DOCNAME).pdf

$(DOCNAME).pdf : $(DOCNAME).tex $(SECTIONS)/*.tex ohilab.bib
	pdflatex $(DOCNAME).tex
	biber $(DOCNAME)
	pdflatex $(DOCNAME).tex
	pdflatex $(DOCNAME).tex

clean :
	rm -f $(DOCNAME) *.{pdf,out,log,aux,toc,blg} $(SECTIONS)/*.{out,log,aux} 
