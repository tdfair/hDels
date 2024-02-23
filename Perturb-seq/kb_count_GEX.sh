#! /bin/bash

#run kallisto | bustools count on gene expression libraries, configured for 35 threads and 100 GB memory (-t 35 -m 100G)

DIR="/2TBevo/hDel-v4_FASTQs/TFAP12/"
index="/home/tyler/Documents/NKS_kallisto_index/kb_Chimpanzee_mtDNA2.idx"
t2g="/home/tyler/Documents/NKS_kallisto_index/kb_Chimpanzee_mtDNA2.t2g"

find ~+ -name "GE*_R1*" | sort -V | while read fname; do
    fn_prefix="${fname%R1*}"
    fn_suffix="${fname##*R1}"
    fname2="${fn_prefix}R2${fn_suffix}"
    fn="${fname##$DIR}"
    folder_out="${fn%_S[0-9]*}"

    #run kallisto | bustools
    kb count --workflow standard --h5ad --filter bustools -t 35 -m 100G -x 10XV3 -i $index -g $t2g -o $folder_out $fname $fname2
done
