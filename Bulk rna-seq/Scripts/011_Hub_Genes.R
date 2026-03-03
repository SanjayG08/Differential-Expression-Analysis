
# ===============================
# Script: 011_Hub_Genes.R
# Purpose: Identification of Hub Genes (Interacting protein)
# ===============================

# Identify Hub genes
deg <- degree(ppi_graph, mode="all")
hub_genes <- sort(deg, decreasing = TRUE)[1:10]
hub_genes