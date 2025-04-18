# Gene Ontology and KEGG pathway
library(openxlsx)
library(readxl)
library(clusterProfiler)
library("dplyr")
library(gprofiler2)
library("KEGGREST")
library(AnnotationHub)
library("biomartr")
library(biomaRt)
library(fgsea)


## Import DEG result 
Combination = "GB_OP"
DEG_fil <- read_excel(path = "DEG_workbook.xlsx", sheet = "GB_OP")

dds_DF = deseq_results_list$GB_OP

##Saving Gene name
gene_name <- rownames(deseq_results_list$GB_OP)
gene_name

##Fetch information of genes 
convrt_gene <- data.frame() #create empty dataframe
convrt_gene <- gconvert(gene_name, organism = "hvulgare", target = "GO" , numeric_ns = "ENTREZGENE") #target GO
# convrt_gene <- gconvert(gene_name, organism = "hvulgare", target = "definition_1006" , numeric_ns = "ENTREZGENE") 

convrt_gene_GO <- cbind(convrt_gene$target, convrt_gene$input)
convrt_gene_GOname <- cbind(convrt_gene$target, convrt_gene$description)

View(convrt_gene)
func_enrich <- gost(gene_name, organism = "hvulgare", user_threshold = 0.05, correction_method = "bonferroni", significant = F)
head(func_enrich$result)

## Gene Enrichment analysis

DEG_fil <- arrange(DEG_fil, desc(log2FoldChange))
rank <- DEG_fil$log2FoldChange
names(rank) <- DEG_fil$Gene

##Gene Set Enrichment analysis
### Non-model organism ("Hordeum vulgare")
gsea <- GSEA(geneList = rank, exponent = 1, minGSSize = 15, maxGSSize = 500,gson = NULL, pvalueCutoff = 0.05, pAdjustMethod = "fdr",TERM2GENE = convrt_gene_GO, seed = 143,by = "fgsea")

#generate dot plot
clusterProfiler::dotplot(gsea, x = "GeneRatio",
                         color = "p.adjust",
                         showCategory = 20,
                         size = NULL,
                         split = NULL,
                         font.size = 12,
                         title = paste0("Dot plot : GB_OP"),
                         orderBy = "x",
                         label_format = 30)


## Enrichment analysis
enrichment_Result <- enricher(gene = DEG_fil$Gene, pvalueCutoff = 0.05, pAdjustMethod = "fdr", universe = gene_name, minGSSize = 15, maxGSSize = 500, 
                              TERM2GENE = convrt_gene_GO)
#No proper knowledge results are changing when putting TERM2Name

View(enrichment_Result@result)

## Plot dot plot
clusterProfiler::dotplot(enrichment_Result,
                         x = "GeneRatio",
                         color = "p.adjust",
                         showCategory = 20,
                         size = NULL,
                         split = NULL,
                         font.size = 12,
                         title = paste0("Dot plot : GB_OP"),
                         orderBy = "x",
                         label_format = 30)

## KEGG pathway
View(keggList("organism"))
## Hordeum vulgare is not available in KEGG organism database
