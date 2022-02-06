# Copyleft (C) 2020-2022, Marek Gagolewski <https://www.gagolewski.com>


.PHONY: r check build test clean

PKGNAME="Rd2rst"

all: r

r:
	# autoconf
	# Rscript -e 'roxygen2::roxygenise(roclets=c("rd", "collate", "namespace", "vignette"), load_code=roxygen2::load_installed)'
	R CMD INSTALL .

test: r
	# Rscript -e 'source("devel/realtest.R")'

stop-on-utf8:
	# Stop if some files are not in ASCII:
	[ -z "`file -i DESCRIPTION configure configure.win \
	        NAMESPACE cleanup R/* src/* man/* inst/* tools/* | \
	    grep 'text/' | grep -v 'us-ascii' | tee /dev/stderr`" ]

build:
	cd .. && R CMD INSTALL ${PKGNAME} --preclean --html
	cd .. && R CMD build ${PKGNAME}

check: stop-on-utf8 build
	cd .. && R CMD check `ls -t ${PKGNAME}*.tar.gz | head -1` --no-manual

check-cran: stop-on-utf8 build
	cd .. && R_DEFAULT_INTERNET_TIMEOUT=240 \
	    _R_CHECK_CRAN_INCOMING_REMOTE_=FALSE \
	    R CMD check `ls -t ${PKGNAME}*.tar.gz | head -1` --as-cran

clean:
	#find src -name '*.o' -exec rm {} \;
	#find src -name '*.so' -exec rm {} \;
