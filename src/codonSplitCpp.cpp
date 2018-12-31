#include <Rcpp.h>
using namespace Rcpp;
//' Split a string into codons
//'
//' @author Boris Steipe, \email{boris.steipe@@utoronto.ca}
//' ORCID: 0000-0002-1134-6758
//' License: (c) Author (2018) + MIT
//' Date: 2018-12-31
//' @param cDNA (char) A single string
//' @return (char) a vector of triplets
//' @examples
//' # Split a string into codons
//' cpp_codonSplitCpp("ATGAAATGA")
//' @export
// [[Rcpp::export]]
std::vector<std::string> cpp_codonSplitCpp( std::string cDNA ) {

  std::vector<std::string> codons;
  int l = (cDNA.length() + 2 ) / 3;
  codons.reserve(l);
  for( int i=0; i < l; i++ ) {

    codons.push_back( cDNA.substr( i*3, 3 ) );

  }
  return codons;
}
