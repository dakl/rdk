# Rdk

Rdk is an R-package of various functions that are sometimes handy when analysing data. It's largely undocumented. 

# Questions

Please use the issue tracker for questions. 

# Installation

```
install.packages("devtools")
library(devtools)
install_github("dakl/rdk")
library(Rdk)
```

# examples

## venndia()
```
layout(matrix(1:4, nc=2, byrow=TRUE))
venndia(A=1:6, B=3:9)
venndia(A=1:6, B=3:9, C=c(1,3,5,7,9))
venndia(A=1:6, B=3:9, C=c(1,3,5,7,9), alab = "KALLE", blab="OLLE", clab="blurg")
venndia(A=1:6, B=3:9, C=c(1,3,5,7,9), alab = "KALLE", blab="OLLE", clab="blurg", cex.text = 1, cex.num = 1) ## cex.text and cex.num defaults to 2
```

### saving data 
```
vd <- venndia(A=1:6, B=3:9, C=c(1,3,5,7,9), getdata = TRUE)
vd$AB
```
### Just calculate overlaps, don't plot
```
vd <- venndia(A=1:6, B=3:9, C=c(1,3,5,7,9), getdata = TRUE, plot = FALSE)
vd$AB
```
