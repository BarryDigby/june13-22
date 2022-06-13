file = read.table("/data/github/june13/Transcribing_DNA_to_RNA/rosalind_rna.txt")
seq = file$V1
rna = gsub("T", "U", seq)
print(rna)