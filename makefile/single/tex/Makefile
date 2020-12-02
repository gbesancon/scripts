include ${SCRIPTS_DIR}/makefile/single/Makefile

PDFS=$(TEXS:.tex=.pdf)

setup-pipeline:
	export PROJECT_NAME=${PROJECT_NAME} && envsubst < ${SCRIPTS_DIR}/makefile/single/tex/azure-pipelines.yml > azure-pipelines.yml
	sed -i '1i########################################' azure-pipelines.yml
	sed -i '1i###   FILE GENERATED FROM TEMPLATE   ###' azure-pipelines.yml
	sed -i '1i########################################' azure-pipelines.yml

setup:
	bash ${SCRIPTS_DIR}/makefile/single/tex/setup.sh

clean:
	rm -f $(PDFS) $(TEXS:.tex=.aux) $(TEXS:.tex=.log) $(TEXS:.tex=.out) $(TEXS:.tex=.synctex.gz) $(TEXS:.tex=.tex.log)

build-dev: build

build: $(PDFS) 

%.pdf: %.tex
	echo Generate PDF for $<
	# https://github.com/thomasWeise/docker-texlive
	-sudo docker run --rm -v `pwd`:/doc/ thomasweise/texlive pdflatex -synctex=1 -interaction=nonstopmode $< > $<.log
	if [ ! -f $@ ] ; then \
		exit 1 ; \
	fi
	rm -f $(<:.tex=.aux) $(<:.tex=.out) $(<:.tex=.synctex.gz) $(<:.tex=.log) $(<:.tex=.tex.log)

ci-build-dev: clean build-dev

ci-build: clean build
