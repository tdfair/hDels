#! /bin/bash

find . -mindepth 1 -maxdepth 1 -type f -name "*rep1_BowTie2_rname_sorted.bam" | sort -V | while read fname; do
    fname="${fname##*/}"
    fnpre="${fname%_rep*}"
    fname2="${fnpre}_rep2_BowTie2_rname_sorted.bam"
    fnout="${fnpre}_replicates_Genrich.narrowPeak"
    echo "Genrich -t $fname,$fname2 -o $fnout -j -r -e chrM -q 0.05 -v"
done | parallel -j 4
