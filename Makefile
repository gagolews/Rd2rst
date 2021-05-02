# Copyleft (C) 2020-2021, Marek Gagolewski <https://www.gagolewski.com>


.PHONY: r check build test clean
PKGNAME="Rd2rst"

all: r

r:
	# autoconf
	# Rscript -e 'roxygen2::roxygenise(roclets=c("rd", "collate", "namespace", "vignette"), load_code=roxygen2::load_installed)'
	R CMD INSTALL .

test: r
	# Rscript -e 'source("devel/tinytest.R")'

build:
	cd .. && R CMD INSTALL ${PKGNAME} --preclean --html
	cd .. && R CMD ${PKGNAME} Rd2rst
	make clean

check: build
	cd .. && R CMD check `ls -t ${PKGNAME}*.tar.gz | head -1` --no-manual

clean:
	find src -name '*.o' -exec rm {} \;
	find src -name '*.so' -exec rm {} \;
