NametoMass <- function(infile, outfile){
    filenames_char <- list.files(path=infile, all.files=FALSE, full.names=FALSE, 
                            ignore.case=FALSE, include.dirs=FALSE, no..=FALSE)
    NumOnly_char <- gsub("[.png]", "", filenames_char)
    masslist_char <- gsub("[_]", ".", NumOnly_char)
    masslist_num <- as.numeric(masslist_char)
    write.table(masslist_num, file=outfile, row.names=FALSE, col.names=FALSE)    
}