#! /bin/bash

#### Calculates the fraction of reads in called peak regions (from Genrich) using featureCounts, configured for 35 threads (-T 35)

find . -mindepth 1 -maxdepth 1 -type f -name "*BowTie2_pos_sorted.bam" -not -name "*merged*" | sort -V | while read fname; do
    fname="${fname##*/}"
    cell_line_rep="${fname%_B*}"
    cell_line="${fname%_rep*}"
    if [[ ! -e $cell_line.saf ]]; then
        echo "Missing .saf file for $cell_line, creating now..."
        awk 'OFS="\t" {print $1"-"$2+1"-"$3, $1, $2+1, $3, "+"}' ${cell_line}_replicates_Genrich.narrowPeak > ${cell_line}.saf
        fi
    featureCounts -T 35 -p -F SAF --ignoreDup -a ${cell_line}.saf -o featureCounts_${cell_line_rep}.txt $fname
done
