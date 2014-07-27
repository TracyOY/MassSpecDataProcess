neg_mass <- function(infile, outfile) {
	data<-read.csv(infile) #load Metlin exported file
	data1<-data[!grepl("]2-", data$adduct, ignore.case=TRUE),] 
		#get rid of -2 charged candidates
	data2<-data1[!grepl("]3-", data1$adduct, ignore.case=TRUE),] 
		#get rid of -3 charged candidates
	mass_single<-data2$inputmass 
		#extract the masses of singly charged hits
	norepeat_mass_single<-unique(mass_single) 
		#get rid of duplicates in the singly charged mass list
	write.table(norepeat_mass_single, file=outfile, row.names=FALSE, col.names=FALSE) 
		#export mass list to file. ready for MSiReader input
}

neg_fullinfo <- function(infile, outfile) {
	data<-read.csv(infile) #load Metlin exported file
	data1<-data[!grepl("]2-", data$adduct, ignore.case=TRUE),] 
		#get rid of -2 charged candidates
	data2<-data1[!grepl("]3-", data1$adduct, ignore.case=TRUE),] 
		#get rid of -3 charged candidates
	write.csv(data2 ,file=outfile) 
}

pos_mass <- function(infile, outfile) {
	data<-read.csv(infile) #load Metlin exported file
	data1<-data[!grepl("]2+", data$adduct, ignore.case=TRUE),] 
		#get rid of +2 charged candidates
	data2<-data1[!grepl("]3+", data1$adduct, ignore.case=TRUE),] 
		#get rid of +3 charged candidates
	mass_single<-data2$inputmass 
		#extract the masses of singly charged hits
	norepeat_mass_single<-unique(mass_single) 
		#get rid of duplicates in the singly charged mass list
	write.table(norepeat_mass_single ,file=outfile, row.names=FALSE, col.names=FALSE) 
		#export mass list to file. ready for MSiReader input
}

pos_fullinfo <- function(infile, outfile) {
	data<-read.csv(infile) #load Metlin exported file
	data1<-data[!grepl("]2+", data$adduct, ignore.case=TRUE),] 
		#get rid of +2 charged candidates
	data2<-data1[!grepl("]3+", data1$adduct, ignore.case=TRUE),] 
		#get rid of +3 charged candidates
	write.csv(data2 ,file=outfile) 
}