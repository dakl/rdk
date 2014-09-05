read.targets <- function(f="targets.txt", ...){
	read.table(f, header=TRUE, as.is=TRUE, sep="\t", ...)
}