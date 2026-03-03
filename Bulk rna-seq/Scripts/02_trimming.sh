#!/bin/bash

# ============================================
# Script: 02_trimming.sh
# Purpose: Adapter trimming using Trimmomatic
# ============================================

RAW_DIR="D:\ANALYSIS\Fastq_Files"
TRIM_DIR="D:\ANALYSIS\TRIMMOMATIC"

# Access Trimmomatic.jar
do
java -jar trimmomatic-0.40.jar
done

# Trim Fastq_Files
do
java -jar trimmomatic-0.40.jar PE -phred33 Fastq_Files\SRR6218466_1.fastq Fastq_Files\SRR6218466_2.fastq SRR6218466_1_paired.fq SRR6218466_1_unpaired.fq SRR6218466_2_paired.fq SRR6218466_2_unpaired.fq LEADING:3 TRAILING:3 SLIDINGWINDOW:4:20 MINLEN:36
java -jar trimmomatic-0.40.jar PE -phred33 Fastq_Files\SRR6218469_1.fastq Fastq_Files\SRR6218469_2.fastq SRR6218469_1_paired.fq SRR6218469_1_unpaired.fq SRR6218469_2_paired.fq SRR6218469_2_unpaired.fq LEADING:3 TRAILING:3 SLIDINGWINDOW:4:20 MINLEN:36
java -jar trimmomatic-0.40.jar PE -phred33 Fastq_Files\SRR6218470_1.fastq Fastq_Files\SRR6218470_2.fastq SRR6218470_1_paired.fq SRR6218470_1_unpaired.fq SRR6218470_2_paired.fq SRR6218470_2_unpaired.fq LEADING:3 TRAILING:3 SLIDINGWINDOW:4:20 MINLEN:36
java -jar trimmomatic-0.40.jar PE -phred33 Fastq_Files\SRR6218476_1.fastq Fastq_Files\SRR6218476_2.fastq SRR6218476_1_paired.fq SRR6218476_1_unpaired.fq SRR6218476_2_paired.fq SRR6218476_2_unpaired.fq LEADING:3 TRAILING:3 SLIDINGWINDOW:4:20 MINLEN:36
java -jar trimmomatic-0.40.jar PE -phred33 Fastq_Files\SRR6218478_1.fastq Fastq_Files\SRR6218478_2.fastq SRR6218478_1_paired.fq SRR6218478_1_unpaired.fq SRR6218478_2_paired.fq SRR6218478_2_unpaired.fq LEADING:3 TRAILING:3 SLIDINGWINDOW:4:20 MINLEN:36
java -jar trimmomatic-0.40.jar PE -phred33 Fastq_Files\SRR6218479_1.fastq Fastq_Files\SRR6218479_2.fastq SRR6218479_1_paired.fq SRR6218479_1_unpaired.fq SRR6218479_2_paired.fq SRR6218479_2_unpaired.fq LEADING:3 TRAILING:3 SLIDINGWINDOW:4:20 MINLEN:36
done  

echo "Trimming completed."