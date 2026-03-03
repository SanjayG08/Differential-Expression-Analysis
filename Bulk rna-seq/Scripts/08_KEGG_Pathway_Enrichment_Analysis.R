
# ===============================
# Script: 08_KEGG_Pathway_Enrichment_Analysis.R
# Purpose: Perform KEGG Pathway enrichment Analysis
# ===============================

library(clusterProfiler)
library(org.Hs.eg.db)
library(enrichplot)
library(ggplot2)

# Load DESeq2 results
res <- read.csv("results/deseq2/deseq2_results.csv", row.names = 1)

# Filter significant genes
sig_genes <- rownames(res[res$padj < 0.05, ])

# Convert to Entrez IDs
sig_entrez <- bitr(sig_genes, fromType = "SYMBOL", toType = "ENTREZID", OrgDb = org.Hs.eg.db)

# KEGG enrichment
kegg_enrich <- enrichKEGG(gene = sig_entrez$ENTREZID, organism = "hsa", pvalueCutoff = 0.05)

# Save results
write.csv(as.data.frame(kegg_enrich), "results/kegg/kegg_enrichment_results.csv")

# Plot
dotplot(kegg_enrich, showCategory = 15)
