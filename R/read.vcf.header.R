read.vcf.header <- function(file){

	line <- scan(file=file, n=1, skip=0, sep="\n", what="character", quiet=TRUE)
	skip <- 1
	header <- c()
	while(substr(line, 0 ,1) == "#" ){
		header <- c(header, gsub("#", "", line) )
		line <- scan(file=file, n=1, skip=skip, sep="\n", what="character", quiet=TRUE)
		skip <- skip + 1
	}
	header
}
