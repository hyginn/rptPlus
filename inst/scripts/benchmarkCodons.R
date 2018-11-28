# benchmarkCodons.R
#
#

if (! require(Biostrings, quietly=TRUE)) {
  if (! exists("biocLite")) {
    source("https://bioconductor.org/biocLite.R")
  }
  biocLite("Biostrings")
  library(Biostrings)
}



set.seed(20181127)
mySeq <- makeSeq(33)



# solution 1: substring in a for-loop, dynamically built -----------------------
sc1 <- function(x){
  codons <- character()
  i <- 1
  while (i < nchar(x)){
    codons <- c(codons, substring(x, i, i+2))
    i <- i + 3
  }
  return(codons)
}

# solution 2: Biostrings -------------------------------------------------------
library(Biostrings)
sc2 <- function(x) {
  return(as.character(Biostrings::codons(Biostrings::DNAString(x))))
}

# solution 3: strsplit and paste in groups -------------------------------------
sc3 <- function(x) {
  nuc <- unlist(strsplit(x, ""))
  idx <- seq(1, length(nuc), by = 3)
  return(paste(nuc[idx], nuc[idx+1], nuc[idx+2], sep =""))
}

# solution 4: strsplit with positive lookbehind --------------------------------
sc4 <- function(x) {
  return(strsplit(x, "(?<=...)", perl = TRUE)[[1]])
}

# solution 5: gsub regex with returned matches ---------------------------------
sc5 <- function(x) {
  return(strsplit(gsub("(.{3})", "\\1 ", x)," ")[[1]])
}

# solution  6: substring() with seq() ------------------------------------------
sc6 <- function(x) {
  return(substring(x, seq(1, nchar(x), 3), seq(3, nchar(x), 3)))
}

# solution 6b: substring() with seq() only once --------------------------------
sc6b <- function(x) {
  idx <- seq(1, nchar(x), 3)
  return(substring(x, idx, idx + 2))
}



# === benchmark =====================================

# using Sys.time()
tStart <- Sys.time()
sc2(s)
tEnd <- Sys.time()
tEnd - tStart


# ===== using system.time()

s <- makeSeq(33)

system.time({ for (i in 1:10) { x <- sc1(s) } })
system.time({ for (i in 1:10) { x <- sc2(s) } })
system.time({ for (i in 1:10) { x <- sc3(s) } })
system.time({ for (i in 1:10) { x <- sc4(s) } })
system.time({ for (i in 1:10) { x <- sc5(s) } })

# ==== using microbenchmark
if (!require(microbenchmark, quietly=TRUE)) {
  install.packages("microbenchmark")
  library(microbenchmark)
}

s <- makeSeq(99)

microbenchmark(sc1(s),
               sc2(s),
               sc3(s),
               sc4(s),
               sc5(s),
               sc6(s),
               sc6b(s))


if (!require(ggplt2, quietly=TRUE)) {
  install.packages("ggplot2")
  library(ggplot2)
}


bm <- microbenchmark(sc1(s),
                     sc2(s),
                     sc3(s),
                     sc4(s),
                     sc5(s),
                     sc6(s),
                     sc6b(s),
                     times = 1000)
autoplot(bm)



# make C++ code available
#

vignette("Rcpp-introduction")
vignette("Rcpp-attributes")
vignette("Rcpp-package")


# Compare:

x <- makeSeq(300)

microbenchmark(sc6(x),
               sc6b(x),
               cpp_codonSplitCpp(x),
               times = 1000)



# further reading:
http://adv-r.had.co.nz/Profiling.html


# [END]

