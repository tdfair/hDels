#! /bin/bash

#### align reads to panTro6 (very sensitive, maximum fragment length 2000 bp, allow multi-mapping, multi-threading), compress output SAM file to binary format (BAM) while excluding alignments with MAPQ < 15, configured for 36 threads (-p 36)

find . -mindepth 1 -maxdepth 1 -type f -name "*trimmed_R1.fq" | sort -V | while read fname; do
    fname="${fname##*/}"
    fnpre="${fname%R1*}"
    fnsuf="${fname##*R1}"
    fname2="${fnpre}R2${fnsuf}"
    fnbase="${fname%*_t*.fq}"
    bowtie2 --very-sensitive -X 2000 -k 10 -p 36 -x ~/Documents/panTro6/panTro6_Bowtie2_idx -1 "$fname" -2 "$fname2" | samtools view -q 15 -u - > "${fnbase}_BowTie2.bam"
done
