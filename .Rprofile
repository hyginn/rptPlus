# NOTE: functions loaded in this file are ONLY available within the project,
#       during development. They are NOT available in the published package.
# Author: Boris Steipe (2018) + ./LICENSE  (MIT)

# == Utilities

# Sample: load a function that is useful for developers
source("./dev/checkEnds.R")



# == Packages and libraries ====================================================
#    Check if libraries that are needed for Vignette
#    development have been installed. Warn if they have not, load them
#    if they have. Note: we can't install.packages() in .Rprofile because
#    the function is not available during RStudio startup.

# ==== CRAN packages ===========================================================

# Check if the CRAN packages in DESCRIPTION - Suggests: are present on this
# machine, warn if they are not, load them if they are. This is done in a loop
# over requested library names. Note the syntax for loading a library from a
# variable.

needCRAN <- c("testthat", "knitr", "rmarkdown")

for (package in needCRAN) {
  if (requireNamespace(package, quietly = TRUE)) {
    library(package, character.only = TRUE)
  } else {
    cat(sprintf("Package %s not installed. \n%s%s%s\n\n",
                package,
                "Install with \"install.packages(\"",
                package,
                "\")\" and load library."))
  }
}

# ==== Bioconductor packages ===================================================

# Example: Just check whether BiocManager exists, no need to load since
#          we use BiocManager::install() syntax
if (! requireNamespace("BiocManager", quietly = TRUE)) {
  cat("Package BiocManager not installed.",
       "\nInstall with \"install.packages(\"BiocManager\")\"",
       "and load library.\n\n")
}

# Example: load a Bioconductor package and do other things too
if (requireNamespace("BiocCheck", quietly = TRUE)) {
  library(BiocCheck)                           # load the library and ...
  cat("Note: execute \"BiocCheck(getwd())\"",  # remind me of the syntax
      "for a Bioconductor compatibility check.\n\n")
} else {
  cat("Package BiocCheck not installed. ",
      "\nInstall with \"BiocManager::install(\"BiocCheck\")\" ",
      "and load library.\n\n")
}

# Example: just load a package if it exists, warn if not
if (requireNamespace("BiocStyle", quietly = TRUE)) {    # check and load
  library(BiocStyle)
} else {
  cat("Package BiocStyle not installed.",
       "\nInstall with \"BiocManager::install(\"BiocStyle\")\"",
       "and load library.\n\n")
}


# [END]
