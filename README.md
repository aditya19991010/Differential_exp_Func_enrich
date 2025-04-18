# 📊 Differential_exp_Func_enrich

## 📄 Project Overview

This project showcases a complete pipeline for analyzing differentially expressed genes (DEGs), generating informative plots, and performing functional enrichment analysis. The analysis was performed using RStudio (v4.3.2) on a dataset containing 48 biological samples.

⸻

## 🔥 Key Features
	•	Data Preparation:
	•	Handling raw count data and target identifiers.
	•	Created 1128 unique pairwise combinations for comparison.
	•	Differential Expression Analysis:
	•	Conducted DESeq2-based analysis.
	•	Collapsed replicates and filtered low counts for robustness.
	•	Stored results systematically using R lists.
	•	Result Summarization:
	•	Filtered DEGs (padj < 0.05, log2FC > 2) stored in an Excel workbook with organized sheets.
	•	Visualization:
	•	MA Plot: Mean normalized counts vs. log fold change.
	•	Volcano Plot: log fold change vs. adjusted p-value.
	•	Venn Diagram: Gene overlaps across multiple statistical thresholds.
	•	Downstream Functional Analysis:
	•	Gene Ontology (GO) Mapping using gprofiler2.
	•	Gene Set Enrichment Analysis (GSEA) using clusterProfiler.
	•	KEGG Pathway Analysis (limited due to species data unavailability).

⸻

## 🛠 Tools & Technologies

Tool	Purpose
RStudio	Analysis environment
DESeq2	Differential expression analysis
dplyr	Data manipulation
EnhancedVolcano	Volcano plot visualization
VennDiagram	Venn diagram creation
gprofiler2	Gene ontology enrichment
clusterProfiler	GSEA and enrichment analysis



⸻

## 📈 Sample Visualizations
	•	MA Plot: Highlights the magnitude and direction of differential expression.
	•	Volcano Plot: Identifies statistically significant DEGs.
	•	Venn Diagram: Shows overlaps under different thresholds.

⸻

## 🚧 Challenges Encountered
	•	Non-model organism data (Hordeum vulgare) was missing from KEGG databases, requiring alternative universal enrichment strategies.
	•	Observed slight discrepancies between GSEA and enricher() results, showcasing method sensitivity.

⸻

## 🧠 Skills Demonstrated
	•	Advanced R programming (looping, list handling, plotting).
	•	Data cleaning, statistical analysis, and result organization.
	•	Omics data interpretation and functional annotation.
	•	Visualization and biological storytelling through plots.

⸻

## 🚀 How to Run

Note: This project assumes familiarity with R and basic bioinformatics tools.

	1.	Clone this repository.
	2.	Open the RStudio project file.
	3.	Install necessary packages:

install.packages(c("DESeq2", "dplyr", "EnhancedVolcano", "VennDiagram", "gprofiler2", "clusterProfiler"))


	4.	Follow the scripts for:
	•	Data Preparation
	•	Differential Expression Analysis
	•	Result Summarization
	•	Visualization
	•	Enrichment Analysis

⸻

### 📬 Contact

If you want to connect, feel free to reach out!
Aditya Naman Soni
📧 [aditya19991010@gmail.com]
