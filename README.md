# Mapping *cis*- and *trans*-regulatory target genes of human-specific deletions (hDels)

Preprint - https://www.biorxiv.org/content/10.1101/2023.12.27.573461v1

Jupyter Notebooks and shell scripts containing analysis of hDel CRISPRi genetic screens (hDel-v1 and hDel-v2), Omni ATAC-seq, H3K4me1/3 and H3K27ac/me3 CUT&Tag, and hDel Direct-capture Perturb-seq (hDel-v3 and hDel-v4).

For hDel-v1 and hDel-v2, sgRNA-level analysis was performed in DESeq2 followed by hDel-level analysis using α-robust rank aggregation (α-RRA) from MAGeCK.

For hDel-v3 and hDel-v4, sequencing reads were pseudoaligned and error-collapsed using kallisto | bustools. sgRNAs were assigned to single cells using a Poisson-Gaussian mixture model and unnormalized gene expression UMIs were summed across cells containing each sgRNA (+sgRNA ‘pseudobulk’) using ADPBulk. Differential expression testing was performed using DESeq2.

For Omni ATAC-seq & CUT&Tag, sequencing reads were trimmed using Cutadapt and aligned to panTro6 using Bowtie 2. Tn5-accessible or pA-Tn5-accessible regions were identified using Genrich.

## Usage

* `hDel-v1 CRISPRi screen analysis.ipynb`, `hDel-v2 CRISPRi screen analysis.ipynb`, and `DESeq2, hDel-v1 & hDel-v2.ipynb`: Perform sgRNA-level differential analysis in DESeq2 starting from a matrix of sgRNA counts and associated metadata and combine sgRNA _p_-values into hDel false discovery rates (FDRs) using α-robust rank aggregation (α-RRA) from MAGeCK

* `hDel-v3 & hDel-v4, Poisson-Gaussian mixture model sgRNA assignments.ipynb`: Assign sgRNAs to single cells using a Poisson-Gaussian mixture model from Replogle et al., _Nature Biotechnology_ 2020

* Preprocessing hDel-v3 & hDel-v4: a mismatch map for hDel-v3 and hDel-v4 sgRNA libraries was generated using kITE and indexed using kallisto `kb_ref_sgRNA.sh`. Paired-end sequencing reads from the gene expression and Feature Barcode libraries were then pseudoaligned and error-collapsed using kallisto | bustools `kb_count_GEX.sh`, `kb_count_sgRNA.sh`

* Processing Omni ATAC-seq and CUT&Tag: `cutadapt.sh` -> `BowTie2.sh` -> `samtools_sort_index.sh` -> `Genrich.sh`
