r.t <- function(x, sep="\t", header=TRUE, as.is=TRUE, quote="\"", ...){ 
    read.table(x, sep=sep, header=header, as.is=as.is, quote=quote, ... )
}
