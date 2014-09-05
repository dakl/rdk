heatmap.3 <- function(z, zlim=NULL, col=NULL, ...){
	if(is.null(zlim))	zlim <- range(z, na.rm=TRUE)
	if(is.null(col))	col <- gradient(c("white", "red"))
	#save old plotting settings
	oldmar <- par("mar")
	layout(matrix(1:2, ncol=2), widths=c(6,2))
	par(mar=c(3,10,2,1))	
	
	#plotting the image
	idx.max <- which(z >= zlim[2])
	z[idx.max] <- zlim[2]
	image(z[,ncol(z):1], col=col, axes=FALSE, zlim=zlim)
	box()
	at.x <- seq(0,1,by=(1/(ncol(z)-1)))
	at.y <- seq(0,1,by=(1/(nrow(z)-1)))
	axis(1, at=at.x, labels = colnames(z), las=2)
	axis(2, at=at.y, labels = rev(rownames(z)), las=2)
	
	#adding the scale...
	scale <- matrix( seq(zlim[1], zlim[2], by=(zlim[2]-zlim[1])/39), ncol=40)
	par(mar=c(1,1,2,4))
	image(scale, col=col, axes=FALSE, zlim=zlim)
	box()
	at.y <- round(seq(zlim[1], zlim[2], by=(zlim[2]-zlim[1])/2))
	axis(4, at=c(0, .5, 1), labels=at.y)

	#reset margins	
	par(mar=oldmar)

}
