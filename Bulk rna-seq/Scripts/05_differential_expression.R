R

# ============================================
# Script: 05_differential_expression.R
# Purpose: Perform DE analysis using DESeq2
# ============================================

library(DESeq2)

# Load count matrix
countData <- read.csv("../counts/gene_counts.csv", row.names = 1)

# Load metadata
colData <- read.csv("../metadata/sample_info.csv", row.names = 1)

# Create DESeq dataset
dds <- DESeqDataSetFromMatrix(countData = countData, colData = colData, design = ~ condition)

# Run DESeq2
dds <- DESeq(dds)

# Get results
res <- results(dds)
res05 <- results(dds,alpha=0.05)

# Save results
write.csv(as.data.frame(res), file = "../results/deseq2_results.csv")

cat("Differential expression analysis completed.\n")