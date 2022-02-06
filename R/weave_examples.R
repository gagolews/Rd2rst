# ############################################################################ #
#                                                                              #
#   Convert R Documentation to Markedly- (MyST) or reStructuredText (rST)      #
#                                                                              #
#   Copyleft (C) 2020-2022, Marek Gagolewski <https://www.gagolewski.com>      #
#                                                                              #
#                                                                              #
#   This program is free software: you can redistribute it and/or modify       #
#   it under the terms of the GNU Affero General Public License                #
#   Version 3, 19 November 2007, published by the Free Software Foundation.    #
#   This program is distributed in the hope that it will be useful,            #
#   but WITHOUT ANY WARRANTY; without even the implied warranty of             #
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the               #
#   GNU Affero General Public License Version 3 for more details.              #
#   You should have received a copy of the License along with this program.    #
#   If this is not the case, refer to <https://www.gnu.org/licenses/>.         #
#                                                                              #
# ############################################################################ #


# This is a stupid function too. That's why we all love it.



#' @param package name of the package
weave_examples <- function(package, input_dir)
{
    fnames <- list.files(input_dir, "\\.md$")
    for (fname in fnames) {
        cat(sprintf("Weaving %s...", fname))
        page <- stri_replace_last_fixed(fname, ".md", "")
        iname <- file.path(input_dir, fname)
        oname <- stri_replace_last_fixed(iname, ".md", ".Rmd")

        f <- readLines(iname)
        f <- stri_flatten(f, collapse="\n")
        f <- stri_replace_last_fixed(f,
            "## Examples\n\n```r\n",
            paste0(
                "## Examples\n\n",
                "```{r echo=FALSE,warning=FALSE,message=FALSE,results='hide'}\n",
                "set.seed(123)\n",
                sprintf("library('%s')\n", package),
                "```\n\n",
                sprintf("```{r %s,error=FALSE}\n", page)
            )
        )
        cat(f, file=oname)

        # NO: knitr::knit(oname, iname, quiet=TRUE); we should rather start a new process

        stopifnot(0 == system2("Rscript", c(
            '--vanilla',
            sprintf(
                '-e \'suppressMessages(knitr::knit("%s", "%s", quiet=TRUE))\'',
                oname, iname
            )
        ), stdout=FALSE))

        file.remove(oname)
        cat(" done.\n")
    }
}
