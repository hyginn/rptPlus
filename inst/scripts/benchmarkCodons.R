# benchmarkCodons.R
#
# A sample script that discusses benchmarking and demonstrates the use of
# an Rcpp compiled C++ function, distributed with the rptPlus package.
#
# Author: Boris Steipe (ORCID: 0000-0002-1134-6758)
# License: (c) Author (2018) + MIT
# Date: 2018-12-31


# === Packages =================================================================

if (requireNamespace("Biostrings", quietly=TRUE)) {
  library(Biostrings)
} else {
  BiocManager::install("Biostrings")
  library(Biostrings)
}

if (! requireNamespace("ggplot2", quietly=TRUE)) {
  install.packages("ggplot2")
}

if (requireNamespace("microbenchmark", quietly=TRUE)) {
  library(microbenchmark)
} else {
  install.packages("microbenchmark")
  library(microbenchmark)
}


# ====  PROCESS  ===============================================================

# A frequent task for sequence analysis is to split a character string of
# DNA into triplets, to translate them into amino acids. In this script we
# benchmark various approaches.


mySeq <- makeSeq(33)

# ======  Define various alternative approaches  ===============================

# solution 1: substring in a for-loop, dynamically build the output vector
#             Note: this is the known-to-be-slow approach
sc1 <- function(x){
  codons <- character()
  i <- 1
  while (i < nchar(x)){
    codons <- c(codons, substring(x, i, i+2))
    i <- i + 3
  }
  return(codons)
}

sc1(mySeq)


# solution 2: Biostrings -------------------------------------------------------
sc2 <- function(x) {
  return(as.character(Biostrings::codons(Biostrings::DNAString(x))))
}

sc2(mySeq)


# solution 3: strsplit and paste in groups -------------------------------------
sc3 <- function(x) {
  nuc <- unlist(strsplit(x, ""))
  idx <- seq(1, length(nuc), by = 3)
  return(paste(nuc[idx], nuc[idx+1], nuc[idx+2], sep =""))
}

sc3(mySeq)


# solution 4: strsplit with positive lookbehind --------------------------------
sc4 <- function(x) {
  return(strsplit(x, "(?<=...)", perl = TRUE)[[1]])
}

sc4(mySeq)


# solution 5: gsub regex with returned matches plus a blank. Then strsplit(). --
sc5 <- function(x) {
  return(strsplit(gsub("(.{3})", "\\1 ", x)," ")[[1]])
}

sc5(mySeq)


# solution  6a: substring() with seq() -----------------------------------------
sc6a <- function(x) {
  return(substring(x, seq(1, nchar(x), 3), seq(3, nchar(x), 3)))
}

sc6a(mySeq)

# solution 6b: substring() calculating seq() only once -------------------------
sc6b <- function(x) {
  idx <- seq(1, nchar(x), 3)
  return(substring(x, idx, idx + 2))
}

sc6b(mySeq)


# ==== Benchmark ===============================================================

# make a longer sequence
mySeq <- makeSeq(33333)

# using Sys.time() -------------------------------------------------------------
# This is simple, but without control over details
tStart <- Sys.time()
x <- sc2(mySeq)
tEnd <- Sys.time()
tEnd - tStart

tStart <- Sys.time()
x <- sc5(mySeq)
tEnd <- Sys.time()
tEnd - tStart


# using system.time() ----------------------------------------------------------

system.time({ x <- sc1(mySeq) })
system.time({ x <- sc2(mySeq) })
system.time({ x <- sc3(mySeq) })


# using microbenchmark() -------------------------------------------------------

# make sequence a bit shorter: microbenchmark runs the same code 100 times.

mySeq <- makeSeq(99)

bm <- microbenchmark(sc1(mySeq),
               sc2(mySeq),
               sc3(mySeq),
               sc4(mySeq),
               sc5(mySeq),
               sc6a(mySeq),
               sc6b(mySeq))
print(bm)
ggplot2::autoplot(bm)

# The difference in speed between the approaches is two orders of magnitude!
# Surprisingly, the Biostrings solution is the slowest by a margin, slower
# even than growing our result array dynamically. Of course, under the hood
# Biostrings does a lot more than just splitting up the codons. Bu this goes
# to show that the approach of just-find-a-package-to-do-it to R programming
# is not always advisable.

# With that in mind: how much speed can we gain with a C++ approach?

# ==== Using C++ code ==========================================================

# make C++ code available
# To learn more about Rcpp, study the excellent vignettes.
vignette("Rcpp-introduction")
vignette("Rcpp-attributes")
vignette("Rcpp-package")

# study the C++ code
file.edit("./src/codonSplitCpp.cpp")

# Compare performance:

x <- makeSeq(300)

bm <- microbenchmark(sc6(x),
                     sc6b(x),
                     cpp_codonSplitCpp(x),
                     times = 1000)
print(bm)
ggplot2::autoplot(bm)

# The C++ function is about ten times faster than our fastest version in
# pure R, which makes it about a thousand times faster than the
# Biostrings solution.

# ==== Further Reading =========================================================
# http://adv-r.had.co.nz/Profiling.html


# [END]

