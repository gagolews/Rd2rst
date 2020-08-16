# `Rd2rst`
## Convert an R package's documentation to reStructuredText (.rst)

Author: [Marek Gagolewski](https://www.gagolewski.com)

System requirements: pandoc (on Linux)

> Caution: not tested on humans and other animals.
This package is not intended to serve any purpose other than
generating the awesome API documentation
for the [genieclust](https://genieclust.gagolewski.com)
and [stringi](https://stringi.gagolewski.com)
packages.


I'm applying a super-lazy approach here: the complete manual bundle
is generated from an HTML version. It's because
`tools::Rd2HTML()` does a good job
by outputting well-structured and easily-digestible source files.

It also does cross-referencing right.

Yet, it's far from perfect with regards to mathematical formulae.

I have no time to implement a full-fledged parser.
Feel free to contact me to to discuss further ideas and maybe
we can together come up with something more useful.

Also, it would be nice to implement a standalone Sphinx domain for R.
See https://www.sphinx-doc.org/en/master/usage/restructuredtext/domains.html
and https://www.sphinx-doc.org/en/master/extdev/domainapi.html.
Wanna do it together? Drop me an email.
