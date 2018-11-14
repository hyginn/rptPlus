# rptPlus

## R Package Template - advanced

This is a template RStudio project for R packages, loosely based on Hadley Wickham's [R Packages](http://r-pkgs.had.co.nz/) but including advanced functionality such as a Shiny app.

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


<!-- END -->
