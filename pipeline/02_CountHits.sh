#!/bin/bash
#SBATCH -p short -N 1 -n 16 --mem 16gb --out logs/counts.log

#This script will just count the hits and gather the sequences identified in our hmmsearch

module load hmmer/3

for t in */*.domtbl; do

grep -h -v '^#' ${t} | awk '{print $1}' | sort | uniq | esl-sfetch -f allseqs.aa - > ${t}.hits.aa.fa

grep ">" ${t}.hits.aa.fa | cut -d\| -f1 | sed 's/>//' | sort | uniq -c > ${t}.counts.txt # count how many copies for each strain

done
