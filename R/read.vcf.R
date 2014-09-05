read.vcf <- function(file){
	rawh <- read.vcf.header(file=file)
	dat <- read.table(file, sep="\t", as.is=TRUE, header=FALSE)
	dim(dat)
	
	cnames <- unlist(strsplit( x=rawh[length(rawh)], split="\t"))
	colnames(dat) <- cnames

#	pos <- dat[1:7,]
#	info <- dat[8,]
#	format <- dat[9,]
#	samples <- dat[10:ncol(dat), ]

	list(data=dat, header=rawh[1:(length(rawh)-1)])
}
#vcf <- read.vcf(file="~/Documents/R/test.vcf")

