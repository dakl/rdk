## A modified print.data.frame to print only the first 5 rows by default 
## Author: Daniel Klevebring, 2009-06-03
## Version: 1.0.2
## Instructions: 
## > df <- data.frame(LETTERS, letters)
## > df
## > print(df, nr=2)
## > print(df, nr=-1) ## nr < 0 prints all rows

## read nr from options, 2009-07-09 //DK

print.data.frame <- function (x, ..., digits = NULL, quote = FALSE, right = TRUE, 
    row.names = TRUE, nr = getOption('nr'))
{
	n <- length(row.names(x))
	if(!is.finite(nr)){ nr <- n }
	if(nr < 0 | nr > n){ nr <- n }
	
	if (length(x) == 0L) {
		cat(gettextf("data frame with 0 columns and %d rows\n", n))
	}
	else if (n == 0L) {
		print.default(names(x), quote = FALSE)
		cat(gettext("<0 rows> (or 0-length row.names)\n"))
	}
	else {
		cat(gettextf("data frame with %d columns and %d rows, ", ncol(x), nrow(x) ))
		cat(gettextf("printing %d first rows\n", nr ))
		m <- as.matrix(format.data.frame(x[1:nr,], digits = digits, na.encode = FALSE))
		if (!isTRUE(row.names)) 
			dimnames(m)[[1]] <- if (identical(row.names, FALSE)) 
				rep.int("", n)
			else row.names
		print(m, ..., quote = quote, right = right)
	}
	invisible(x)
}
