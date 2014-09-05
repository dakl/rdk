mgradient <- function(col=c(palette()[1:5]), k=500){
	grad <- c()
	for(idx in 1:(length(col)-1)){
		grad <- c(grad, gradient( c(col[idx], col[idx+1]), k=k/length(col) ) )
	}
	grad
}