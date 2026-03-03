
# ============================================
# Script: 07_GO_enrichment.R
# Purpose: Perform GO enrichment Analysis
# ============================================

library(clusterProfiler)
library(org.Hs.eg.db)

# Load DE genes
res <- read.csv("../results/deseq2_results.csv")

sig_genes <- rownames(res[res$padj < 0.05, ])

ego <- enrichGO(gene = sig_genes, OrgDb = org.Hs.eg.db, keyType = "SYMBOL", ont = "BP", pAdjustMethod = "BH", pvalueCutoff = 0.05)

write.csv(as.data.frame(ego), file = "../results/go_enrichment.csv")

cat("GO enrichment completed.\n")