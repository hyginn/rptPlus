# runRPTApp.R

#' \code{runRptApp} launch the shiny app distributed with this package framework
#'
#' \code{runRptApp} launches the shiny app for which the code has been placed in  \code{./inst/shiny-scripts/rptApp/}.
#' @export

runRptApp <- function() {
  appDir <- system.file("shiny-scripts", "rptApp", package = "rptPlus")
  shiny::runApp(appDir, display.mode = "normal")
  return()
}

# [END]
