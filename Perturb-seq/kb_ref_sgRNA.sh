#! /bin/bash

#Generate a mismatch map for hDel-v4 using kITE as required input for kallisto | bustools

#FeatureBarcodes.tsv is a tab-separated input file with two columns (no header): sgRNA_sequence <tab> sg_ID

kb ref \
--workflow kite \
-i hDelv4_features.idx \
-g hDelv4_f2b.txt \
-f1 hDelv4_features.fa \
hDelv4_FeatureBarcodes.tsv
