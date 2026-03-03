
==============================
BULK RNA-SEQ DIFFERENTIAL EXPRESSION ANALYSIS
==============================

Project Title:

Differential Gene Expression Analysis of Type 2 Diabetes Using Bulk RNA-Seq Data

Project Overview

This project performs a complete Bulk RNA-Seq analysis workflow starting from raw sequencing data to biological interpretation and network analysis. The pipeline includes Quality Control, trimming, alignment, quantification, differential expression analysis, functional enrichment (GO, KEGG, GSEA), Protein-Protein Interaction (PPI) network construction, and module detection using Cytoscape (MCODE).

Workflow Summary

1. Raw Data Collection
2. Quality Control (FastQC & MultiQC)
3. Read Trimming
4. Alignment to Reference Genome
5. Gene Count Matrix Generation
6. Differential Expression Analysis (DESeq2)
7. Visualization (PCA, Volcano, Heatmap)
8. Functional Enrichment (GO, KEGG, GSEA)
9. PPI Network Construction
10. Network Module Detection (MCODE in Cytoscape)


Folder Structure

Data/               -> Basic Information  
Results/            -> Obtained results of scripts  
   ├── Alignment/
   ├── Counts/
   ├── Cytoscape Cluster/
   ├── Differential Expression/
   ├── Enrichment/
   ├── Fastq Reports/
   ├── Network/
   └── Plots/
Scripts/            -> Analysis scripts             


Differential Expression Analysis
Tool Used: DESeq2
Outputs Generated:
- DESeq2_all_results.csv
- DESeq2_significant_genes.csv
- Upregulated_genes.csv
- Downregulated_genes.csv
Criteria:
Adjusted p-value (padj) < 0.05
|log2FoldChange| > 1

Functional Enrichment
Tool Used: clusterProfiler
Analyses Performed:
- GO Over-Representation Analysis (ORA)
- KEGG Pathway Enrichment
- GO GSEA
- KEGG GSEA
Results saved as CSV files in Results/Enrichment/

Visualization
Figures Generated:
- PCA Plot
- Volcano Plot
- Heatmap (Top DEGs)
- GO Dotplot
- KEGG Dotplot
- GSEA Enrichment Plots
- PPI Network
- MCODE Cluster (Top Module)
All figures saved at 300 DPI resolution in Results/Plots/

Network Analysis
PPI network constructed using STRING database.
Network imported into Cytoscape for visualization.
MCODE plugin used to identify functional modules.
Top cluster identified with highest score and node density.


Key Biological Insights
Differentially expressed genes were enriched in significant biological processes and pathways relevant to the experimental condition. Hub genes identified through PPI and MCODE analysis suggest critical regulatory mechanisms.


Reproducibility
All scripts are available in the scripts/ directory.
Results folders are automatically generated via scripted workflow.
Project structured for reproducibility and GitHub portfolio presentation.



Functional enrichment

Network biology interpretation

Reproducible computational workflow
