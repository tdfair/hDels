#! /bin/bash

#### use samtools stats to extract insert sizes, configured for 32 threads (--threads 32)

find . -mindepth 1 -maxdepth 1 -type f -name "*BowTie2_pos_sorted.bam" | sort -V | while read fname; do
    fname="${fname##*/}"
    samtools stats --threads 32 "$fname" | grep ^IS | cut -f 2- > "${fname%.bam}_insertSize.tsv"
done
