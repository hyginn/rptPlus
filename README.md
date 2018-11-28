# rptPlus

## R Package Template - advanced

This is a template RStudio project for R packages, loosely based on Hadley Wickham's [R Packages](http://r-pkgs.had.co.nz/) but including advanced functionality such as a Shiny app and compiled code.

-----------------------------------------------

Note: you can't push empty directories to your repository. Make sure you keep
at least one file in every directory that you want to keep during development.
 
-----------------------------------------------

Some useful keyboard shortcuts for package authoring:

* Build and Reload Package:  `Cmd + Shift + B`
* Update Documentation:      `Cmd + Shift + D` or `devtools::document()`
* Test Package:              `Cmd + Shift + T`
* Check Package:             `Cmd + Shift + E` or `devtools::check()`

-----------------------------------------------


Load the package (outside of this project) with:
    `devtools::install_github("<your user name>/<your package name>")`

## Shiny
In order to distribute a Shiny app with your package:
* Add the `shiny` package as a dependency into the `DESCRIPTION` file. In this template, I have included `shiny` under the `Imports:` heading; in case you consider the functionality of your Shiny app to be optional, you can move it under the `Suggests:` heading.

* The package contains a folder `shiny-scripts` in the 'inst' folder. Put a folder for each shiny script of your package into that one. I have included a shiny app called `rptApp` in this template package. Find its associated files in `./inst/shiny-scripts/rptApp/`.

* There is a function called `runRptApp.R` in the `R` folder. All that does is to launch the app (and provide for the man page.) To demo the app, type `runRptApp()`.

* This is only meant to provide a template for the general layout of files and functions in your package. For contents examples and code references see the [RStudio Shiny Tutorial](http://shiny.rstudio.com/tutorial/).

## Reproducible Research
The label "Reproducible Research" summarizes best practice that derives from the principles of the _scientific method_. Using the methodology implied with this package helos support these goals in multipe ways: reproducibility, writing code that is robust and maintainable, testing, finding the right granularity for code (one concern per function in one file), sharing etc. A topic that must not be forgotten is that code does not only need to be syntacticlly correct, but must also deliver correct results. Such *validation* of results may require comparing results against known true values and can be included in the test routines of the package.

## Rcpp
Running compiled code from within R is pretty straightforward: run `Rcpp::sourceCpp("yourFunctionName.cpp")` and call it with `cpp_yourFunctionName()`. However, *distributing* compiled C++ code with your package is a bit more involved, you need assets that are included here:

* a `./src` directory to hold your C++ sources;
* a `DESCRIPTION` file that includes the `Rcpp` package in the `Imports` field and has a `LinkingTo:` field that defines Rcpp;
* A package script: here it is `rptPlus.R`. It does nothing but contains the roxygen tags that ensures information about linking behaviour is added to the `NAMESPACE` file; 
* a `.gitignore` file that removes binary intermediates from version control.

A compiled, minimal sample function (`codonSplitCpp()`) is included and documented with the package framework, it is further explained in the `benchmarkCodons.R` script. Once everything is set up, the process of compiling and linking the code is handled automaticaly by the RStudio build tools. Thus the development process is:

* write your source-code and save it in the `./src` directory;
* follow the header structure in the example, in particular note the roxygen-like comments that will get copied into the exported R file. If you don't have that, your function won't get exported.
* update the documentation to have roxygen2 update the `NAMESPACE` file (`Cmd + Shift + D`);
* reload the library, then check to make sure all is correct.


Additional reading:
* Hadley Wickham's "R-packages" chapter on [Compiled Code](http://r-pkgs.had.co.nz/src.html)
* Hadley Wickham's "Advanced R" chapter on [Rcpp](http://adv-r.had.co.nz/Rcpp.html)
* The vignettes that are distributed with the `Rcpp` package:
** `vignette("Rcpp-introduction")`
** `vignette("Rcpp-attributes")`
** `vignette("Rcpp-package")`

## Documentation
Obviously this package contains comment headers throughout, from which roxygen2 can compile package documentation and help pages. But documenting how to use functions does not necessarily explain how to use a package. This is where "vignettes" play a role. Packages must contain documentation what the package is intended for, what its use cases are and how they support the greater context of a user's needs. Great examples for vignettes are included with the `Rcpp` package. This package contains:

* a `./vignettes` folder;
* `knitr` in the `Suggests` and `VignetteBuilder` fields of the `DESCRIPTION` file;
* a vignette example `./vignettes/rptPlusVignette.Rmd`.

Write your vignettes in markdown syntax, "knit" them with (`Cmd + Shift + K), and build your vignette with `devtools::build_vignettes()`. Then install and restart your package. List available vignettes with `vignette(package = "rptlus")` and view a specific vignette with `vignette(package = "rptPlus")`

Additional reading:
* Hadley Wickham's "R-packages" chapter on [Vignettes](http://r-pkgs.had.co.nz/vignettes.html)
<!--
devtools::use_vignette("rptPlus")
✔ Setting active project to '/Users/steipe/Documents/03.COMPUTING/11-R/R_Exercises/rptPlus'
✔ Adding 'knitr' to Suggests field in DESCRIPTION
✔ Setting VignetteBuilder field in DESCRIPTION to 'knitr'
✔ Adding 'rmarkdown' to Suggests field in DESCRIPTION
✔ Creating 'vignettes/'
✔ Adding '*.html', '*.R' to 'vignettes/.gitignore'
✔ Adding 'inst/doc' to '.gitignore'
✔ Creating 'vignettes/rptplus.Rmd'
● Modify 'vignettes/rptplus.Rmd'
-->



<!-- END -->
