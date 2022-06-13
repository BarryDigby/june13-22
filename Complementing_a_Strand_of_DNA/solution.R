file = read.table("/data/github/june13/Complementing_a_Strand_of_DNA/rosalind_revc.txt")
seq = file$V1
seq = unlist(strsplit(seq, ""))

# stage things and stuff
mat = data.frame(t(seq))
conv_mat = data.frame(c("A", "T", "C", "G"), c("T", "A", "G", "C"))
rownames(conv_mat) = conv_mat[,1]
output = data.frame(matrix(0, ncol=length(seq)))

for ( index in seq(1, ncol(mat), 1 ) ){
  
  nucleotide = mat[,index]
  conv = conv_mat[nucleotide,2]
  output[1,index] = conv
  
}

# reverse the string
seq = unlist(output[1,])
reversed_string <- paste(rev(seq), collapse="")
reversed_string