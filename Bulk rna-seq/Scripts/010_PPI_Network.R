
# ===============================
# Script: 010_PPI_Network.R
# Purpose: Build Protein-Protein Interactions
# ===============================

library(STRINGdb)
library(dplyr)

# Initialize STRING
string_db <- STRINGdb$new(version="11.5",  species=9606,  score_threshold=400,  input_directory="")

# Load significant genes
res <- read.csv("results/deseq2_results.csv", row.names = 1)
sig_genes <- rownames(res[res$padj < 0.05, ])

# Map genes to STRING IDs
mapped <- string_db$map(data.frame(gene=sig_genes), "gene", removeUnmappedRows = TRUE)

# Get interactions
ppi <- string_db$get_interactions(mapped$STRING_id)

# Convert to igraph object
ppi_graph <- graph_from_data_frame(ppi[,1:2], directed = FALSE)

# Plot basic PPI Network
plot(ppi_graph, vertex.size = 5, vertex.label = NA, edge.color = "grey") 

# Save for Cytoscape
write.table(ppi, "results/networks/ppi_network.txt", sep="\t", row.names=FALSE, quote=FALSE)