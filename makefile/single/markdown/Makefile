include ${SCRIPTS_DIR}/makefile/single/Makefile
VERSION=0.0.1-SNAPSHOT
#PANDOC_VERBOSE=--verbose

setup-pipeline:
	export PROJECT_NAME=${PROJECT_NAME} && envsubst < ${SCRIPTS_DIR}/makefile/single/markdown/azure-pipelines.yml > azure-pipelines.yml
	sed -i '1i########################################' azure-pipelines.yml
	sed -i '1i###   FILE GENERATED FROM TEMPLATE   ###' azure-pipelines.yml
	sed -i '1i########################################' azure-pipelines.yml

setup:
	bash ${SCRIPTS_DIR}/makefile/single/markdown/setup.sh

clean:
	rm -f ${PROJECT_NAME}.pdf

build-dev: build

build: ${PROJECT_NAME}.pdf

${PROJECT_NAME}.pdf:
	sudo docker run --rm -v `pwd`:/doc/ thomasweise/texlive pandoc ${PANDOC_VERBOSE} `find . -type f -name "*.md" ${EXTRA_SEARCH_PARAMETERS}` -o ${PROJECT_NAME}.pdf "-fmarkdown-implicit_figures -o" --from=markdown -V geometry:margin=.4in --toc --highlight-style=espresso --pdf-engine=xelatex --variable mainfont="DejaVu Serif" --variable sansfont=Arial ${EXTRA_PANDOC_PARAMETERS}

ci-build-dev: clean build-dev

ci-build: clean build
