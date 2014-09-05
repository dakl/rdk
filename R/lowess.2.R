lowess.2 <- function(x, y, ...){
  idx.keep <- intersect(which( is.finite(x)), which(is.finite(y)))
  x <- x[idx.keep]
  y <- y[idx.keep]
  lowess(x, y, ...)
}