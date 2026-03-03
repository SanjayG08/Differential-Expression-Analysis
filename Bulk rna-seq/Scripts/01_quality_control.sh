#!/bin/bash

# ==========================================
# Script: 01_quality_control.sh
# Purpose: Perform quality check on raw FASTQ files using FastQC
# ==========================================

# Input directory
RAW_DIR="D:\ANALYSIS\Fastq_Files"
QC_DIR="D:\ANALYSIS\FastQC\run_fastqc.bat"

# Create output directory if not exists
OUT_DIR="D:\ANALYSIS\Untrimmed HTML"

# Run FastQC
run_fastqc.bat -> File -> Open -> path/to/directory ("D:\ANALYSIS\Fastq_Files") -> Gives report in HTML format

echo "Quality control completed."