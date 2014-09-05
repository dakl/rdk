gradient <- function(cols=c("white", "green"), k=50) {
	low <- col2rgb(cols[1])/255
	high <- col2rgb(cols[2])/255
	r <- seq(low[1], high[1], len = k)
	g <- seq(low[2], high[2], len = k)
	b <- seq(low[3], high[3], len = k)
	rgb(r, g, b)
}