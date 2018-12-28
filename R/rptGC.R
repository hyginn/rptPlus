#' rptGC.R
#'
#' The standard genetic code
#'
#' This is the standard genetic code stored as a vector of amino acid
#' one-letter codes and named with their codon. The code was imported from
#' the Biostrings package.
#'
#' @format a named character vector of length 64:
#' \describe{
#'   \item{elements}{One-letter amino acid code letters and "*", uppercase}
#'   \item{names}{Codons as nucleotide triplets, uppercase}
#' }
#' @source \url{https://bioconductor.org/packages/release/bioc/html/Biostrings.html}
#' @examples
#' # translate a codon
#' rptGC["ATG"]    # "M"
#' # list the codons for an amino acid
#' names(rptGC)[rptGC == "R"]   # "AGA" "AGG" "CGA" "CGG" "CGC" "CGT"
#' @docType data
#' @name rptGC
NULL

# [END]

