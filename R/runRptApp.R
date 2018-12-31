# runRptApp.R

#' \code{runRptApp} run the shiny app \code{./inst/shiny-scripts/rptApp/}.
#' @return Nothing. Invoked for its side-effect of launching a shiny app.
#' @examples
#' # No runnable example applies - but BiocCheck() requires one. So ...
#' NULL
#'\dontrun{
#' runRptApp()
#'}
#' @export

runRptApp <- function() {
  appDir <- system.file("shiny-scripts", "rptApp", package = "rptPlus")
  shiny::runApp(appDir, display.mode = "normal")
  return()
}

# [END]
