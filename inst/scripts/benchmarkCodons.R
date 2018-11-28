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



makeSeq <- function(N) {
  v <- sample(c("A", "C", "G", "T"), N, replace = TRUE)
  return(paste(v, collapse = ""))
}

set.seed(20181127)
mySeq <- makeSeq(99)



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
system.time(splitCodons1(cDNA))

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

s <- makeSeq(999)

microbenchmark(y <- sc1(s))
microbenchmark(y <- sc2(s))
microbenchmark(y <- sc3(s))
microbenchmark(y <- sc4(s))
microbenchmark(y <- sc5(s))






if (!require(ggplt2, quietly=TRUE)) {
  install.packages("ggplot2")
  library(ggplot2)
}

sc5c <- compiler::cmpfun(sc5b)

bm <- microbenchmark(y <- sc5(s),
                     y <- sc5b(s),
                     y <- sc5c(s),
                     times = 1000)
autoplot(bm)



# make C++ code available
#

vignette("Rcpp-introduction")
vignette("Rcpp-attributes")
vignette("Rcpp-package")

Rcpp::sourceCpp("./src/codonSplitCpp.cpp")
Rcpp::compileAttributes()
cpp_codonSplitCpp(makeSeq(33))



# further reading:
http://adv-r.had.co.nz/Profiling.html


# [END]

