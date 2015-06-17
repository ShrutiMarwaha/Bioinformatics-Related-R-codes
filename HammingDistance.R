## calculated hamming distance between two dna sequences
#s1 <- c("GAGCCTACTAACGGGAT")
#s2 <- c("CATCGTAATGACGGCCT")

dna_string <- readLines("./Dropbox/SHRUTIM/Rscripts/PractiseR/DNAstrings.txt")
# dna_string <- readLines("./Dropbox/SHRUTIM/Rscripts/PractiseR/rosalind_hamm.txt")
dna_string
s1 <- dna_string[1]
s2 <- dna_string[2]

s1_array <- unlist(strsplit(s1,""))
s2_array <- unlist(strsplit(s2,""))

count <- 0

for(i in seq_along(s1_array))
{
  if(s1_array[i] != s2_array[i])
  {
    count <- count+1
  }
}
print(count)