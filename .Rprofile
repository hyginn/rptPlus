# NOTE: functions loaded in this file are ONLY available within the project,
#       during development. They are NOT available in the published package.

source("./dev/checkEnds.R")

# download a Bioconductor package if it does not exist locally, (also download
# the BiocManager if it doesn't exist yet), load the library
if (! require(BiocCheck, quietly = TRUE)) {
  if (requireNamespace("BiocManager", quietly = TRUE) == FALSE) {
    install.packages("BiocManager")
  }
  BiocManager::install("BiocCheck")
  library(BiocCheck)
}
cat("Note: execute BiocCheck(getwd())",
    "for a Bioconductor compatibility check.\n")

# Make sure the development packages in the DESCRIPTION Suggests: field
# are present on this machine.

if (requireNamespace("testthat", quietly = TRUE) == FALSE) {
  install.packages("testthat")
}
if (require(BiocStyle, quietly = TRUE) == FALSE) {
  if (requireNamespace("BiocManager", quietly = TRUE) == FALSE) {
    install.packages("BiocManager")
  }
  BiocManager::install("BiocStyle")
}
if (requireNamespace("knitr", quietly = TRUE) == FALSE) {
  install.packages("knitr")
}
if (requireNamespace("rmarkdown", quietly = TRUE) == FALSE) {
  install.packages("rmarkdown")
}


# [END]
