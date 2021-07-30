#!/bin/bash
#SBATCH -p batch --time 2-0:00:00 --ntasks 8 --nodes 1 --mem 12G 
#SBATCH --out logs/hmmsearch.%a.log

module load hmmer/3

# We need a folder with pep files. These will serve as our pool of proteins where our genes of interest may be

ln -s /rhome/myaco005/bigdata/Bd/pep_exclude_low_Busco

# Let's do the search on a for loop.

for i in */*.hmm; do

cat pep_exclude_low_Busco/*.fasta > allseqs.aa
esl-sfetch --index allseqs.aa
hmmsearch --domtbl ${i}.domtbl -E 1e-5 ${i} allseqs.aa > ${i}.hmmsearch
done
