#! /bin/bash

#### sort bam by position for IGV, configured for 64 GB memory (8*4*2) and 32 cores (8*4)

find . -mindepth 1 -maxdepth 1 -type f -name "*BowTie2.bam" | parallel -j 8 samtools sort -@ 4 -m 2G -o {.}_pos_sorted.bam {}

#### index position-sorted.bam for IGV

find . -mindepth 1 -maxdepth 1 -type f -name "*BowTie2_pos_sorted.bam" | parallel -j 8 samtools index -@ 4 {}

#### sort bam by read name for Genrich

find . -mindepth 1 -maxdepth 1 -type f -name "*BowTie2.bam" | parallel -j 8 samtools sort -n -@ 4 -m 2G -o {.}_rname_sorted.bam {}
