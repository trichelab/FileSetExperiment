#' Helper function: squeezed (fake) inverse logit (avoids -Inf / +Inf pitfall)
#'
#' @param x       a vector or matrix of values between -Inf and +Inf
#' @param sqz     the amount by which to 'squeeze', default is .000001
#'
#' @return        a vector or matrix of values between 0 and 1 inclusive
#'
#' @export 
fexpit <- function(x, sqz=1e-6) (((((.expit(x) * 2) - 1) / (1 - sqz)) + 1) / 2)


# helper fn: fix underflow
.naAsUnity <- function(p, x) ifelse(is.na(p) & !is.na(x), 1, p)


# helper fn: raw expit
.expit <- function(x) .naAsUnity( exp(x) / (exp(x) + 1), x ) 
