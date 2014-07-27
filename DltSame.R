DltSame <- function(infile, outfile){
    rawmasslist <- read.csv(infile)
    onlymass <- rawmasslist$m.z
    norepeat_masslist <- unique(onlymass)
    write.table(norepeat_masslist, file=outfile, row.names=FALSE, col.names=FALSE)
}

CheckSim <- function(infile, outfile, ppm=0){
    threshold <- ppm/1000000
    rawdata <- read.table(infile, col.names="m/z")
    #read masslist data, masslist data need to be a numeric vector
    data <- rawdata$m.z
    entry <- length(data)
    for (i in 1:(entry-1)){
        diff <- abs((data[i+1] - data[i])/data[i+1])
            if (diff < threshold){
                data[i+1] <- 0
            }
    }
    write.table(data, file=outfile, row.name=FALSE, col.name=FALSE)
}