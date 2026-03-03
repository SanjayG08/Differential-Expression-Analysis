#!/bin/bash

# ============================================
# Script: 04_counting.sh
# Purpose: Align reads using HISAT2
# ============================================

ALIGN_DIR="E:\samtools-0.1.7_i386-win32"
COUNT_DIR="E:\subread-2.1.1-Windows-x86_64\bin"

# Gene Counting
do
featureCounts.exe -T 4 -p --countReadPairs -B -C -Q 10 -t exon -g gene_id -a Homo_sapiens.GRCh38.115.gtf -o counts.txt SRR6218466_sorted.bam SRR6218469_sorted.bam SRR6218470_sorted.bam SRR6218476_sorted.bam SRR6218478_sorted.bam SRR6218479_sorted.bam
done
