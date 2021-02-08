#	
#	Author: Bill Goodwine
#					University of Notre Dam
#					22 January 2021
#

MAIN=main

all:
	latex $(MAIN)
	bibtex $(MAIN)
	latex $(MAIN)
	latex $(MAIN)
	dvipdf $(MAIN)

clean:
	rm -f ./*/.bak
	rm -f ./*/*.bak
	rm -f ./*/*/*.bak
	rm -f ./*/figs/*.png
	rm -f ./*/*/*.bak
	rm -f ./*/*.tex~
	rm -f ./*.tex~
	rm -f ./*/*/*.tex~
	rm -f ./*/*/*/*.tex~
	rm -f ./*/*/*.m~
	rm -f ./*/*/*/*.m~
	rm -f ./*/*/*.f~
	rm -f ./*/*/*.c~
	rm -f ./*.aux
	rm -f ./*.tex~
	rm -f ./${MAIN}.pdf	
	rm -f ./${MAIN}.dvi
	rm -f ./${MAIN}.ps
	rm -f ./${MAIN}.aux
	rm -f ./${MAIN}.toc
	rm -f ./${MAIN}.thm
	rm -f ./${MAIN}.lof
	rm -f ./${MAIN}.log
	rm -f ./${MAIN}.lot
	rm -f ./${MAIN}.out
	rm -f ./${MAIN}.glo
	rm -f ./${MAIN}.nls
	rm -f ./${MAIN}.nlo
	rm -f ./${MAIN}.ind
	rm -f ./${MAIN}.idx
	rm -f ./${MAIN}.bbl
	rm -f ./${MAIN}.blg
	rm -f ./${MAIN}.brf
	rm -f ./${MAIN}.ilg

