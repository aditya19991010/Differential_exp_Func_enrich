# Generate plots

## import library
library(DESeq2)
library(EnhancedVolcano)
library(VennDiagram)
library(dplyr)


resLFC <- lfcShrink(ddsDEq, coef=1, type="normal")

## Set axis limit
xlim <- c(1,1e6); ylim <- c(-5,5)

## plot MA
par(mfrow= c(1,1))
plotMA(resLFC, xlim=xlim, main="LFC Shrink = normal", ylim = ylim)
abline(h = c(-2,2), col = "red3")

plotMA(object = deseq_results_list$OV_OW,ylim= ylim, xlim =xlim, main = "No LFC shrink")
abline(h = c(-2,2), col = "red3")


## Volcano plot
### Create the volcano plot
EnhancedVolcano(deseq_results_list$OV_OW, lab = rownames(deseq_results_list$OV_OW),
                x ='log2FoldChange', FCcutoff = 1, y = 'padj', pCutoff = 0.05,
                xlim = c(-2,2),
                ylim = c(0,10),
                pointSize = 2.0, labSize = 3, 
                col = c('black', 'blue', 'red', 'green2', colAlpha =1),
                # vline = c(2,-2), vlineCol = 'deepskyblue3',
                title = 'Volcano plot : DEG results',
                subtitle = 'Identifier = OV vs OW',
                caption = 'FC cutoff = 1 ; FDR cutoff = 0.05',
)



## Venn diagram
deg_FDR_01 <- filter(as.data.frame(deseq_results_list$OV_OW), padj < 0.05)
deg_FDR_1e_10 <- filter(as.data.frame(deseq_results_list$OV_OW), padj < 1e-10)

deg_lfc_2 <- filter(as.data.frame(deseq_results_list$OV_OW), log2FoldChange > 2 | log2FoldChange < -2)
deg_lfc_10 <- filter(as.data.frame(deseq_results_list$OV_OW), log2FoldChange > 10 | log2FoldChange < -10)

# Define the sets
set1 <- as.character(rownames(deg_FDR_01))
set2 <- as.character(rownames(deg_FDR_1e_10))
set3 <- as.character(rownames(deg_lfc_2))
set4 <- as.character(rownames(deg_lfc_10))

# Prepare data
venn_data <- list(set1, set2, set3, set4)

# Create the venn diagram
venn.plot <- venn.diagram(
  width = 1000,
  height = 1000,
  x = venn_data,
  category.names = c("FDR < 0.05", "FDR < 1e-10", "LFC > 2", "LFC > 10"),
  filename = NULL,
  col=c("#DF536B", "#61D04F" ,"#28E2E5" ,"#F5C710"),
  fill=c("#F0E442", "#0072B2", "#D55E00", "#CC79A7"),
  main = "Venn Diagram: DEGs distribution of OV VS OW",
  cex = 1,
  main.cex = 1.75,
  cat.cex = 1
)

# Plot the venn diagram
grid.newpage()
grid.draw(venn.plot)

