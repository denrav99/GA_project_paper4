BiocManager::install("DESeq2")
BiocManager::install("genefilter")
install.packages("readxl")

# Load libraries
library(readxl)
library(DESeq2)
library(tidyverse)
library(pheatmap)
library(gplots)
library(RColorBrewer)
library(genefilter)

# Read in metadata
MetaData <- read_excel("SraRunTable1.xlsm")

# Read in count files
count_files <- c("SRR6040092_Aligned.sortedByCoord.out_count.txt",
                 "SRR6040093_Aligned.sortedByCoord.out_count.txt", 
                 "SRR6040094_Aligned.sortedByCoord.out_count.txt", 
                 "SRR6040096_Aligned.sortedByCoord.out_count.txt",
                 "SRR6040097_Aligned.sortedByCoord.out_count.txt", 
                 "SRR6156066_Aligned.sortedByCoord.out_count.txt", 
                 "SRR6156067_Aligned.sortedByCoord.out_count.txt", 
                 "SRR6156069_Aligned.sortedByCoord.out_count.txt")


# Create sampleTable
sampleNames <- c("SRR6040092_Leaf", "SRR6040093_Root", "SRR6040094_Aril", "SRR6040096_Stem", 
                 "SRR6040097_Aril", "SRR6156066_Aril", "SRR6156067_Aril", "SRR6156069_Aril")

sampleTable <- matrix(ncol = 8, nrow = 3792)
colnames(sampleTable) <- sampleNames
rownames_data <- read.table(count_files[1], header = FALSE, colClasses = "character")[, 1]
rownames(sampleTable) <- rownames_data

for (i in seq_along(count_files)) {
  # Read the counts from the second column of each count file
  counts <- read.table(count_files[i], header = FALSE)[, 2]
  # Assign the counts to the corresponding column in the sampleTable matrix
  sampleTable[, i] <- counts
}

# Create DESeq object 
ddsHTSeq_tissue <- DESeqDataSetFromMatrix(countData = sampleTable, colData = MetaData, design = ~ tissue)

ddsHT_seq_cultivar <- DESeqDataSetFromMatrix(countData = sampleTable, colData = MetaData, design = ~ Cultivar)

# Perform DESeq2
dds <- DESeq(ddsHT_seq_cultivar)
results <- results(dds)
normalized_counts <- counts(dds, normalized = TRUE)

# Perform PCA
rld <- rlog(dds)
plotPCA(rld, intgroup = c("Cultivar"))

# Heatmap

# Extract the row names (gene names) for the top 10 differentially expressed genes
top_10_DE_genes <- head(row.names(results[order(results$padj), ]), 10)

# Extract the row names (gene names) for the top 10 differentially expressed genes
top_10_DE_genes <- head(row.names(results[order(results$padj), ]), 10)

# Subset rlog data to include only the top 10 differentially expressed genes
rlog_data_top_10_DE <- rlog_data[top_10_DE_genes, ]

# Set row names to the data matrix
rownames(rlog_data_top_10_DE) <- top_10_DE_genes

# Extract the tissue types and cultivar from the metadata
tissue_types <- MetaData$tissue
cultivar <- MetaData$Cultivar

# Create column names combining sample names, tissue types, and cultivar
col_names_with_tissue <- paste(colnames(rlog_data_top_10_DE), cultivar, sep = " - ")

# Set column names to include both sample names, tissue types, and cultivar
colnames(rlog_data_top_10_DE) <- col_names_with_tissue

# Create heatmap for the top 10 differentially expressed genes
pheatmap(as.matrix(rlog_data_top_10_DE), 
         scale = "row", 
         col = colorRampPalette(rev(brewer.pal(9, "RdBu")))(100),
         main = "Heatmap of Top 10 Differentially Expressed Genes (rlog-transformed) for cultivar design",
         labRow = TRUE,  # Show row labels (gene names)
         labCol = TRUE)  # Show column labels

# Volcano plot

# Calculate the log2 fold change and -log10 adjusted p-values
log2_fold_change <- results$log2FoldChange
adjusted_p_values <- -log10(results$padj)

# Remove non-finite values from both vectors
finite_indices <- is.finite(log2_fold_change) & is.finite(adjusted_p_values)
log2_fold_change <- log2_fold_change[finite_indices]
adjusted_p_values <- adjusted_p_values[finite_indices]

# Create a volcano plot
plot(log2_fold_change, adjusted_p_values,
     main = "Volcano Plot for cultivar design",
     xlab = "Log2 Fold Change",
     ylab = "-Log10 Adjusted P-value",
     xlim = c(-max(abs(log2_fold_change)), max(abs(log2_fold_change))),
     ylim = c(0, max(adjusted_p_values)),
     pch = 20,   # Use filled circles as points
     col = ifelse(abs(log2_fold_change) > 1 & results$padj[finite_indices] < 0.05, "red", "black"))  # Highlight significant points

# Add a horizontal line at -log10(0.05) to indicate significance threshold
abline(h = -log10(0.05), col = "blue", lty = 2)
