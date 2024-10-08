#' Given a list of URLs for IDAT files, extract basenames (i.e., ABC123_R0XC0Y)
#'
#' For a GEO dataset or an SE made from GEOquery results, this will usually
#' be found in the $supplementary_file column of the sample data or colData.
#' If a SummarizedExperiment-like object is provided, it will be returned with
#' a new colData column 'Basename' holding the resulting IDAT file stubs. 
#'
#' @param x  vector of URLs/paths or a SummarizedExperiment-like object
#'
#' @return   vector of IDAT stubs or a SummarizedExperiment-like object
#'
#' @import SummarizedExperiment
#'
#' @export 
#'
getIDATstubs <- function(x) {

  if (is(x, "SummarizedExperiment")) {
    stopifnot("supplementary_file" %in% names(colData(x)))
    urls <- colData(x)$supplementary_file
  } else {
    urls <- x 
  }

  stubs <- sub("_(Red|Grn)$", "", ignore=TRUE,
             sub(".idat$", "", ignore=TRUE,
                 sub("\\.gz$", "", ignore=TRUE, 
                     basename(urls))))

  if (is(x, "SummarizedExperiment")) {
    colData(x)$Basename <- stubs
    return(x)
  } else { 
    return(stubs)
  }

}
