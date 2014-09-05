setClass("RpkmData", representation(bin="matrix", name="matrix", rpkm="matrix", readcount="matrix"))

setMethod("show", "RpkmData", function(object){
	cat("RpkmData object with ", ncol(object@rpkm), 
		" samples and ", nrow(object@rpkm), " values per sample", sep="")
	
})
totNumberOfReads <- function(x){
	apply(x@readcount, 2, sum)
}
setGeneric("totNumberOfReads")

rpkm <- function(object){ object@rpkm }
setGeneric("rpkm")

readcount <- function(object){ object@readcount }
setGeneric("readcount")

nsamples <- function(object){ ncol(object@rpkm) }
setGeneric("nsamples")

slice <- function(x, idx){
	bin_ <- x@bin[,idx]
	name_ <- x@name[,idx]
	rpkm_ <- x@rpkm[,idx]
	readcount_ <- x@readcount[,idx]
	new("RpkmData", bin=bin_, name=name_, rpkm=rpkm_, readcount=readcount_)
}
setGeneric("slice")


setMethod("names", "RpkmData", function(x){
	x@name
})
setMethod("plot", c("RpkmData", "missing"), function(x, idx=c(1,2), log=TRUE, ...){
	if(length(idx) != 2){ stop("Need 2 indices to plot samples") }
	
	x_ <- values(x)[,idx[1]]
	y_ <- values(x)[,idx[2]]
	if(log){
		x_ <- log2(x_)
		y_ <- log2(y_)
	}
	
	xlab <- colnames(values(x))[idx[1]]
	ylab <- colnames(values(x))[idx[2]]
	
	smoothScatter(x_, y_, xlab=xlab, ylab=ylab)
})
setMethod("boxplot", "RpkmData", function(x, idx, log=TRUE, ...){
	if(missing(idx)){ idx <- 1:ncol(x@rpkm) }
	dat <- x@rpkm[,idx]
	if(log) { dat <- log2(dat) }
	dat[!is.finite(dat)] <- NA
	boxplot(dat, ...)
})
#boxplot(rpkm, col=rainbow(6))
#boxplot(rpkm, col=rainbow(6), idx=1:4)

read.rpkm <- function(files, verbose=FALSE, sampleNames, ...){
	bin <- c()
	name <- c()
	rpkm <- c()
	readcount <- c()
	
	if(missing(sampleNames)){ sampleNames <- files }
	
	for(f in files){
		tmp <- read.rpkm.onefile(f, verbose=verbose, ...)
		bin <- cbind( bin, tmp$bin )
		name <- cbind( name, tmp$name )		
		rpkm <- cbind( rpkm, tmp$rpkm )		
		readcount <- cbind( readcount, tmp$readcount )
	}
	colnames(bin) <- colnames(name) <- colnames(rpkm) <- colnames(readcount) <- sampleNames
	rpkm <- new("RpkmData", bin=bin, name=name, rpkm=rpkm, readcount=readcount)
}

read.rpkm.onefile <- function(file, verbose=FALSE, ...){
	if (verbose) cat("Reading file ", file, "...\n", sep="");
	raw <- read.table(file, sep="\t", as.is=TRUE, header=FALSE, skip=1)
	colnames(raw) <- c("bin", "name", "rpkm", "readcount")
	raw
}

