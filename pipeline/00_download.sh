#!/bin/bash
#SBATCH -p short -N 1 -n 16 --mem 16gb --out logs/download.log

# Download the Hmms we need for the Hmmsearches

curl -o Peptidase_S41.hmm http://pfam.xfam.org/family/PF03572/hmm # see http://pfam.xfam.org/family/PF03572 for  domain
curl -o Peptidase_M36.hmm http://pfam.xfam.org/family/PF02128/hmm # Peptidase M36
curl -o Asp_protease.hmm http://pfam.xfam.org/family/PF09668/hmm # Aspartyl protease
curl -o CBM18.hmm http://pfam.xfam.org/family/PF00187/hmm #CBM18

# Now we need to clean up our directory by organizing our Hmms

for file in *.hmm; do dir=$(echo $file | cut -d. -f1); mkdir -p $dir; mv $file $dir; done
