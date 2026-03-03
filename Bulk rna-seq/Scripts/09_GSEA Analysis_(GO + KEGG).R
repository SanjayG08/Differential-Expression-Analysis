
# ===============================
# Script: 09_GSEA Analysis_(GO + KEGG).R
# Purpose: Perform GSEA Analysis
# ===============================

library(clusterProfiler)
library(org.Hs.eg.db)
library(enrichplot)
library(ggplot2)

# Load DESeq2 results
res <- read.csv("results/deseq2/deseq2_results.csv", row.names = 1)
res <- na.omit(res)

# Create ranked gene list
gene_list <- res$log2FoldChange
names(gene_list) <- rownames(res)
gene_list <- sort(gene_list, decreasing = TRUE)

# Convert to Entrez IDs
gene_df <- bitr(names(gene_list), fromType = "SYMBOL", toType = "ENTREZID", OrgDb = org.Hs.eg.db)

gene_list_entrez <- gene_list[gene_df$SYMBOL]
names(gene_list_entrez) <- gene_df$ENTREZID
gene_list_entrez <- sort(gene_list_entrez, decreasing = TRUE)

# KEGG GSEA
gsea_kegg <- gseKEGG(geneList = gene_list_entrez, organism = "hsa", pvalueCutoff = 0.05)

write.csv(as.data.frame(gsea_kegg), "results/gsea/gsea_kegg_results.csv")

dotplot(gsea_kegg, showCategory = 15)

# GO GSEA
gsea_go <- gseGO(geneList = gene_list_entrez, OrgDb = org.Hs.eg.db, ont = "BP", pvalueCutoff = 0.05)

write.csv(as.data.frame(gsea_go), "results/gsea/gsea_go_results.csv")

dotplot(gsea_go, showCategory = 15)
