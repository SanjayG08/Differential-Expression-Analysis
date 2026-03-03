#!/bin/bash

# ============================================
# Script: 03_alignment.sh
# Purpose: Align reads using HISAT2
# ============================================

TRIM_DIR="D:\ANALYSIS\TRIMMOMATIC"
ALIGN_DIR="D:\hisat2.1"
INDEX="D:\hisat2.1"

# Index files
do
hisat2-build-l.exe path/to/directory/Homo_sapiens.GRCh38.dna.primary_assembly.fa GRCh38_index
done

#Align files
do
hisat2-align-l.exe -p 6 -x GRCh38_index -1 SRR6218466_1_paired.fq -2 SRR6218466_2_paired.fq -S SRR6218466.sam
hisat2-align-l.exe -p 6 -x GRCh38_index -1 SRR6218469_1_paired.fq -2 SRR6218469_2_paired.fq -S SRR6218469.sam
hisat2-align-l.exe -p 6 -x GRCh38_index -1 SRR6218470_1_paired.fq -2 SRR6218470_2_paired.fq -S SRR6218470.sam
hisat2-align-l.exe -p 6 -x GRCh38_index -1 SRR6218476_1_paired.fq -2 SRR6218476_2_paired.fq -S SRR6218476.sam
hisat2-align-l.exe -p 6 -x GRCh38_index -1 SRR6218478_1_paired.fq -2 SRR6218478_2_paired.fq -S SRR6218478.sam
hisat2-align-l.exe -p 6 -x GRCh38_index -1 SRR6218479_1_paired.fq -2 SRR6218479_2_paired.fq -S SRR6218479.sam
done

# Convert SAM to BAM
do
samtools.exe view -bS SRR6218466.sam > SRR6218466.bam
samtools.exe view -bS SRR6218469.sam > SRR6218469.bam
samtools.exe view -bS SRR6218470.sam > SRR6218470.bam
samtools.exe view -bS SRR6218476.sam > SRR6218476.bam
samtools.exe view -bS SRR6218478.sam > SRR6218478.bam
samtools.exe view -bS SRR6218479.sam > SRR6218479.bam
done

# Sort all these files
do
samtools.exe sort SRR6218466.bam SRR6218466_sorted
samtools.exe sort SRR6218469.bam SRR6218469_sorted
samtools.exe sort SRR6218470.bam SRR6218470_sorted
samtools.exe sort SRR6218476.bam SRR6218476_sorted
samtools.exe sort SRR6218478.bam SRR6218478_sorted
samtools.exe sort SRR6218479.bam SRR6218479_sorted
done

# Index these sorted files
do 
samtools.exe index SRR6218466_sorted.bam
samtools.exe index SRR6218469_sorted.bam
samtools.exe index SRR6218470_sorted.bam
samtools.exe index SRR6218476_sorted.bam
samtools.exe index SRR6218478_sorted.bam
samtools.exe index SRR6218479_sorted.bam
done

echo "Alignment completed."


