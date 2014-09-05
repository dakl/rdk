alert <- function(m="Done!", p=0, sticky=TRUE){
	if(sticky){ s <- "-s" } else { s <- "" }
	
	system(gettextf("growlnotify -t 'R says...' -m '%s' -p %d %s -a R", m, p, s))
}
