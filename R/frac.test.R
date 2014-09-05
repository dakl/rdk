frac.test <- function(x, y, ...){
	px <- x[1]/sum(x)
	py <- y[1]/sum(y)
	
	nx <- sum(x)
	ny <- sum(y)
	
	varx <- px*(1-px)/nx
	vary <- py*(1-py)/ny
	
	diff <- px-py
	vardiff <- varx+vary
	z <- diff/sqrt(vardiff)
	p.value <- pnorm(z, lower.tail=TRUE)

	list(z=z, p.value=p.value)
}

## H0: p1 = p0
## H1: p1 > p0
#### eqivalent with
## H0: diff10 = 0
## H1: diff10 > 0
