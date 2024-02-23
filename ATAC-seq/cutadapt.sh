#! /bin/bash

#### use cutadapt to trim Nextera adapters, remove bases q<20 and reads <20 bp

ADAPTER="CTGTCTCTTATACACATCT"

find . -mindepth 1 -maxdepth 1 -type f -name "*R1*.fastq.gz" | sort -V | while read fname; do
    fname="${fname##*/}"
    fnpre="${fname%R1*}"
    fnsuf="${fname##*R1}"
    fname2="${fnpre}R2${fnsuf}"
    fnbase="${fname%*_S*.fastq.gz}"
    cutadapt -a "$ADAPTER" -A "$ADAPTER" -q 20 --minimum-length 20 -j 0 -o "${fnbase}_trimmed_R1.fq" -p "${fnbase}_trimmed_R2.fq" "$fname" "$fname2"
done
