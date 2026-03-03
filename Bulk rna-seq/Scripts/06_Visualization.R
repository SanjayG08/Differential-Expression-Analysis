
# ===============================
# Script: 06_Visualization.R
# Purpose: Create different visualization plots
# ===============================

library(DESeq2)
library(ggplot2)
library(pheatmap)
library(dplyr)

# Export significant genes
sig_genes <- res[which(res$padj < 0.05), ]
write.csv(as.data.frame(sig_genes), file="Significant_Genes_padj_0.05.csv")

# Make a Volcano plot
plot(res$log2FoldChange, -log10(res$padj), pch=20, main="Volcano Plot", xlab="log2 Fold Change", ylab="-log10 Adjusted p-value")
abline(h=-log10(0.05), col="red")

# Make a PCA plot
vsd <- vst(dds, blind=FALSE)
plotPCA(vsd, intgroup="condition")

# Make a Heatmap for top 20 significant genes
top_genes <- head(res[order(res$padj), ], 20)
top20_names <- rownames(top_genes)
vsd <- vst(dds, blind = FALSE)
heatmap_data <- assay(vsd)[top20_names, ]
library(pheatmap)
pheatmap(heatmap_data, scale = "row", annotation_col = sample_info, show_rownames = TRUE, cluster_rows = TRUE, cluster_cols = TRUE)
