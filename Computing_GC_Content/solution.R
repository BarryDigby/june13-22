seq = seqinr::read.fasta(file = "/data/github/june13/Computing_GC_Content/rosalind_gc.txt", seqtype = "DNA", as.string = TRUE, seqonly = FALSE, set.attributes = TRUE)

seq <- data.frame(do.call(rbind, seq))
colnames(seq) <- c("Sequence")

output = data.frame(matrix(nrow=nrow(seq), ncol=1))
rownames(output) = rownames(seq)
colnames(output) = "GC_Content"

for ( index in 1:nrow(seq)){
  
  sequence = seq[index,1]
  
  nuc_mat = as.data.frame(matrix(0, nrow = 4, ncol=nchar(sequence)))
  colnames(nuc_mat) = seq(1, nchar(sequence), 1)
  rownames(nuc_mat) = c("A", "T", "G", "C")
  
  for( idx in seq(1, nchar(sequence), 1) ){
  
      split_seq = unlist(strsplit(sequence, ""))
      nucleotide = toupper(split_seq[idx])
      nuc_mat[paste0(nucleotide), idx] = nuc_mat[paste0(nucleotide), idx] + 1
  
  }
  
  A_ = rowSums(nuc_mat["A",])
  T_ = rowSums(nuc_mat["T",])
  C_ = rowSums(nuc_mat["C",])
  G_ = rowSums(nuc_mat["G",])
  
  GC = G_ + C_
  total = G_ + C_ + T_ + A_
  GC_content = GC/total
  output[index,1] = GC_content
    
}