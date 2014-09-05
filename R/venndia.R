venndia <- function(A, B, C, alab="A", blab="B", clab="C", getdata=FALSE, cex.text=2, cex.num=2, plot=TRUE, xlim=c(0,9), ylim=c(0,9), ...){
	cMissing <- missing(C)
	if(cMissing){ C <- c() }

	unionAB <- union(A, B)
	unionAC <- union(A, C)
	unionBC <- union(B, C)
	uniqueA <- setdiff(A, unionBC)
	uniqueB <- setdiff(B, unionAC)
	uniqueC <- setdiff(C, unionAB)
	intersAB <- setdiff(intersect(A, B), C)
	intersAC <- setdiff(intersect(A, C), B)
	intersBC <- setdiff(intersect(B, C), A)
	intersABC <- intersect(intersect(A, B), intersect(B, C))

	nA <- length(uniqueA)	
	nB <- length(uniqueB)
	nC <- length(uniqueC)

	nAB <- length(intersAB)
	nAC <- length(intersAC)
	nBC <- length(intersBC)
	
	nABC <- length(intersABC)	
  if(plot){	
	  if( cMissing ){
    	par(mar=c(0, 0, 0, 0))
    	if(missing(ylim)){ylim <- c(3,9)}
	    plot(-10, -10, ylim=ylim, xlim=xlim, axes=FALSE, xlab="", ylab="", ...)
    	circle(x=3, y=6, r=3, col=rgb(1,0,0,.5), border=NA)
	    circle(x=6, y=6, r=3, col=rgb(0,.5,.1,.5), border=NA)
    	text( x=1, y=7.8, alab, cex=cex.text, col="gray90", pos=4)  
	    text( x=7.9, y=7.8, blab, cex=cex.text, col="gray90", pos=2)
    	text(
			  x=c(2, 4.5, 7), 
			  y=c(6, 6,   6), 
			  c(nA, nAB, nB), 
			  cex=cex.num
		  )
	  } else {
    	par(mar=c(0, 0, 0, 0))
	    plot(-10, -10, ylim=ylim, xlim=xlim, axes=FALSE, xlab="", ylab="", ...)
    	circle(x=3, y=6, r=3, col=rgb(1,0,0,.5), border=NA)
	    circle(x=6, y=6, r=3, col=rgb(0,.5,.1,.5), border=NA)
    	circle(x=4.5, y=3, r=3, col=rgb(0,0,1,.5), border=NA)
	    text( x=1, y=7.8, alab, cex=cex.text, col="gray90", pos=4)  
    	text( x=7.9, y=7.8, blab, cex=cex.text, col="gray90", pos=2)
		text( x=4.5, y=1.4, clab, cex=cex.text, col="gray90", pos=1)
	    text(
  		  x=c(2, 7, 4.5, 4.5, 3, 6, 4.5), 
			  y=c(7, 7, 2  , 7  , 4, 4, 5), 
			  c(nA, nB, nC, nAB, nAC, nBC, nABC), 
			  cex=cex.num
		  )
	  }
	}	
	
  if(getdata){
		list(A=uniqueA, B=uniqueB, C=uniqueC, 
			AB=intersAB , AC=intersAC , BC=intersBC , 
			ABC=intersABC
		)
	}
}
#venndia(A=1:10, B=4:16, C=12:15, alab="dbsnp_135", blab="ankakalle", clab="__anka__" ,cex.text=1, cex.num=3)
#venndia(A=1:10, B=4:16, alab="dbsnp_135", blab="ankakalle", clab="__anka__" ,cex.text=1, cex.num=3)