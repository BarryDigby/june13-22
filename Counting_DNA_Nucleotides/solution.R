# Stage dataset
file = read.table("/data/github/june13/Counting_DNA_Nucleotides/rosalind_dna.txt")
seq = file$V1
seq = unlist(strsplit(seq, ""))
str(seq)

# initialise nucleotide matrix and just use rowSums..
nuc_mat = as.data.frame(matrix(0, nrow = 4, ncol=length(seq)))
colnames(nuc_mat) = seq(1, length(seq), 1)
rownames(nuc_mat) = c("A", "T", "G", "C")

for( index in seq(1, length(seq), 1) ){
  
  nucleotide = seq[index]
  nuc_mat[paste0(nucleotide), index] = nuc_mat[paste0(nucleotide), index] + 1
  
}

# Row sums
A_ = rowSums(nuc_mat["A",])
T_ = rowSums(nuc_mat["T",])
C_ = rowSums(nuc_mat["C",])
G_ = rowSums(nuc_mat["G",])

# print results
paste0("The frequency of A is:", A_, sep="")
paste0("The frequency of T is:", T_, sep="")
paste0("The frequency of C is:", C_, sep="")
paste0("The frequency of G is:", G_, sep="")
