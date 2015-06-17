# read a fasta file and count gc content
#########################################################################
# Read some or all text lines from a connection.
#Fasta <- readLines("/Users/shruti/Dropbox/SHRUTIM/Rscripts/Fastafile.txt", n=-1)
Fasta <- readLines("/Users/shruti/Desktop/rosalind_gc.txt", n=-1)
# convert the vector into a single string
Fasta <- paste(Fasta,collapse=" ")

pattern <- ">Rosalind_[0-9]+ "
seq <- strsplit(Fasta,pattern)
# dont know why first element of list is empty
seq <- seq[[1]][-1]
seq <- gsub(" +","",seq)

#install.packages("stringr")
#library(stringr)
IDs <- str_extract_all(Fasta,"Rosalind_[0-9]+")

GCFrequency <- function(sequence){
  seq_array <- strsplit(sequence,"")
  GC_count <- ((table(seq_array)[["G"]] + table(seq_array)[["C"]])/length(seq_array[[1]]))*100
  return(GC_count)
}
GC_count <- as.numeric(lapply(seq,GCFrequency))
GC_dataframe <- data.frame(cbind(IDs[[1]],GC_count),stringsAsFactors=F)
subset(GC_dataframe,GC_count==max(GC_dataframe[,2]),)
###############################################

