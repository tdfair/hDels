#! /bin/bash

#run kallisto | bustools count on Feature Barcode sgRNA libraries, configured for 32 threads and 80 GB memory (-t 32 -m 80G)

DIR="/2TBevo/hDel-v4_FASTQs/TFAP12/"
index="/home/tyler/Documents/kallisto_bustools_kITE/hDelv4_features.idx"
f2b="/home/tyler/Documents/kallisto_bustools_kITE/hDelv4_f2b.txt"

find ~+ -name "sgRNA*_R1*" | sort -V | while read fname; do
    fn_prefix="${fname%R1*}"
    fn_suffix="${fname##*R1}"
    fname2="${fn_prefix}R2${fn_suffix}"
    fn="${fname##$DIR}"
    #file prefix before _S[0-9]
    folder_out="${fn%_S[0-9]*}_kITE"

    #run kallisto | bustools
    kb count --workflow kite:10xFB --h5ad --filter bustools -t 32 -m 80G -x 10XV3 -i $index -g $f2b -o $folder_out $fname $fname2
done
