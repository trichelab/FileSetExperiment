#' For array-based DNA methylation, particularly summarized across regions,
#' we can do better (a lot better) than MAD or SD.  Since we know that 
#'
#' max(SD(X_j)) if X_j ~ Beta(a, b) < max(SD(X_j)) if X_j ~ Bernoulli(a/(a+b))
#'
#' for X with known mean and SD, hence solvable for a + b by MoM, we can define
#'
#' extremality = sd(X_j) / bernoulliSD(mean(X_j))
#'
#' This function selects the k most extremal rows of x and returns their values.
#'
#' @param     x   a matrix of beta values or a SummarizedExperiment-shaped thing
#' @param     k   how many rows to return (500)
#' 
#' @return    the most extremal _k_ rows of _x_ (returns the same class as _x_)
#' 
#' @importFrom matrixStats rowSds rowMeans2
#' 
#' @export
#'
byExtremality <- function(x, k=500) {

  # compute relevant statistics
  .extremality <- function(x) {
    means <- rowMeans2(x, na.rm=TRUE)
    bernoulliSd <- sqrt(means * (1 - means))
    actualSd <- rowSds(x, na.rm=TRUE)
    return(actualSd / bernoulliSd)
  }

  # compute from the relevant features
  if (is(x, "SummarizedExperiment")) {
    extremality <- .extremality(assay(x, "Beta"))
  } else {
    extremality <- .extremality(x)
  }

  # return x[top_k, ]
  k <- min(nrow(x), k)
  x[rev(order(extremality))[seq_len(k)], ]

}
