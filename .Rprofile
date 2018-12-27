# NOTE: functions loaded in this file are ONLY available within the project,
#       during development. They are NOT available in the published package.

source("./dev/checkEnds.R")

# download a Bioconductor package if it does not exist locally, (also download
# the BiocManager if it doesn't exist yet), load the library
if (! require(BiocCheck, quietly = TRUE)) {
  if (! requireNamespace("BiocManager", quietly = TRUE)) {
    install.packages("BiocManager")
  }
  BiocManager::install("BiocCheck")
  library(BiocCheck)
}

# [END]
