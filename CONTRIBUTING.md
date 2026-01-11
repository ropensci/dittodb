# Contributing to dittodb

This outlines how to propose a change to `dittodb`. For detailed
information about developing `dittodb` see the [developing `dittodb`
vignette](https://dittodb.jonkeane.com/articles/developing-dittodb.md).

### Fixing typos

Small typos or grammatical errors in documentation may be edited
directly using the GitHub web interface, so long as the changes are made
in the *source* file. We love getting help with this!

- **Yes, please:** you edit a roxygen comment in a `.R` file under the
  `R/` directory.
- **No, thanks:** you edit an `.Rd` file under the `man/` directory.

### Prerequisites

In order to not waste effort and time, before you make a substantial
pull request, you should file an issue and make sure someone from the
team agrees that it’s a problem. If you’ve found a bug, create an
associated issue and illustrate the bug with a minimal
[reprex](https://www.tidyverse.org/help/#reprex).

### Pull request process

- We recommend that you create a new git branch for each pull request
  (PR).
- Look at the GitHub Actions build status before and after making
  changes.
- We use [roxygen2](https://cran.r-project.org/package=roxygen2), with
  [Markdown
  syntax](https://cran.r-project.org/web/packages/roxygen2/vignettes/markdown.html),
  for documentation.
- We use [testthat](https://cran.r-project.org/package=testthat).
  Contributions with test cases included are easier to accept.
- New code should generally follow the tidyverse [style
  guide](http://style.tidyverse.org). You can use the
  [styler](https://CRAN.R-project.org/package=styler) package to apply
  these styles, but please don’t restyle code that has nothing to do
  with your PR.

### Code of Conduct

Please note that the `dittodb` project is released with a [Contributor
Code of Conduct](https://dittodb.jonkeane.com/CODE_OF_CONDUCT.md). By
contributing to this project, you agree to abide by its terms.
