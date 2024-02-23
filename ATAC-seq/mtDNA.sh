#! /bin/bash

#### Calculate percentage of reads mapped to mitochondrial genome (mtDNA) using samtools idxstats, requires indexed .bam files (samtools index)

for file in *BowTie2_pos_sorted.bam; do 
    mtReads=$(samtools idxstats $file | grep 'chrM' | cut -f 3)
    totalReads=$(samtools idxstats $file | awk '{SUM += $3} END {print SUM}')
    echo $file '=> mtDNA content:' $(bc <<< "scale=2;100*$mtReads/$totalReads")'%'
done
