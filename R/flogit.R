#' Helper function: squeezed logit
#'
#' @param p       a vector or matrix of values between 0 and 1 inclusive
#' @param sqz     the amount by which to 'squeeze', default is .000001
#'
#' @return        a vector or matrix of values between -Inf and +Inf
#'
#' @export 
flogit <- function(p, sqz=1e-6) (.sqz(.logit(p), sqz))


# helper fn: logit
.logit <- function(p) log(p/(1 - p))


# helper fn: squeeze extreme values
.sqz <- function(x, sqz=1e-6) ifelse(x>(1-sqz), (1-sqz), ifelse(x<sqz, sqz, x))
