## given a rna sequence, determine the amino acid sequence
codon_table <- read.table("/Users/shruti/PycharmProjects/firstProject/RNA_codon_table.txt",stringsAsFactors =F)
RNA_string <- "AUGGCCAUGGCGCCCAGAACUGAGAUCAAUAGUACCCGUAUUAACGGGUGA"
#RNA_codon <- gsub("(.{3})","\\1 ",RNA_string)
#RNA_codon <- unlist(strsplit(RNA_codon," "))
RNA_codon <- unlist( regmatches(RNA_string, gregexpr(".{3}", RNA_string) ) )

PatternExtract <-  function(x){
  matched_index <-  grep(x,codon_table[,1])
  return(codon_table[matched_index,2])
}

protein_sequence <- paste(sapply(RNA_codon,PatternExtract),collapse="")
protein_sequence <- gsub("stop.*","",protein_sequence,ignore.case=T)
