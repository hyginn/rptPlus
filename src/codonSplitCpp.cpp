
#include <Rcpp.h>
using namespace Rcpp;
//' Split a string into codons
//'
//' @param cDNA A string.
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
