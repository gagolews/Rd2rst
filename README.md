# `Rd2rst` [EXPERIMENTAL]
## Convert R package Documentation to Markedly- (MyST) or reStructuredText (rST)

> Note: rST support is deprecated and probably doesn't work anymore.

Author: [Marek Gagolewski](https://www.gagolewski.com)

System requirements: `pandoc`

> Caution: not tested on other systems.
This package in its current version is not intended to serve any
purpose other than generating the R API documentation
of the
[genieclust](https://genieclust.gagolewski.com),
[stringi](https://stringi.gagolewski.com),
[stringx](https://stringx.gagolewski.com),
and [realtest](https://realtest.gagolewski.com)
packages.


I'm applying a super-lazy approach here: the complete manual bundle
is generated from the HTML version as produced by `R CMD INSTALL <pkg> --html`.
It's because `tools::Rd2HTML()` does a pretty good job
outputting well-structured and easily-digestible source files.
It also does cross-referencing right.
However, it's far from perfect with regards to mathematical formulae.

I have no time to implement a full-fledged parser.
Feel free to contact me to discuss further ideas and maybe
we can come up with something more useful together.

Also, it would be nice to implement a standalone Sphinx domain for R.
See <https://www.sphinx-doc.org/en/master/usage/restructuredtext/domains.html>
and <https://www.sphinx-doc.org/en/master/extdev/domainapi.html>.
Want to do it together? Drop me an email. Cheers.
