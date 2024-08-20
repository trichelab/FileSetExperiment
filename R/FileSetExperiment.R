#' @export
#' @import methods
setClass("FileSet", contains="list") 

# defined in sesame::initFileSet:
#
#     fset <- structure(list(
#        map_path = map_path,
#        platform = platform,
#        probes = probes,
#        samples = sort(samples),
#        inc = inc # bytes per storage
#    ), class='fileSet')
#    fset$n <- length(fset$probes)
#    fset$m <- length(fset$samples)
#


#' @export
#' @import methods
#' @importClassesFrom SummarizedExperiment SummarizedExperiment 
setClass("FileSetExperiment", 
         contains="SummarizedExperiment",
         slots=c(FileSet="FileSet"))


#' A FileSetExperiment constructor.
#'
#' @param       fset  a fileSet object (really just a list)
#'
#' @export
#'
#' @importFrom  SummarizedExperiment SummarizedExperiment
FileSetExperiment <- function(fset, ...) {
  new("FileSetExperiment", 
      SummarizedExperiment(list(), ...),
      FileSet=.FileSet(fset))
}
