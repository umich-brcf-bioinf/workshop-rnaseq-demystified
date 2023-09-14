# setup directories
dir.create("./RNASeqDemystified")
setwd("./RNASeqDemystified")
getwd()

# make data folder
dir.create("./data")

# download files
download.file("https://raw.githubusercontent.com/umich-brcf-bioinf/2021-04-26-umich-rnaseqDemystified/master/data/Day2Data/samplesheet.csv", "./data/samplesheet.csv")

download.file("https://raw.githubusercontent.com/umich-brcf-bioinf/2021-04-26-umich-rnaseqDemystified/master/data/Day2Data/gene_expected_count.txt", "./data/gene_expected_count.txt")

# check for packages
missing <- setdiff(c("tidyr", "ggplot2", "pheatmap", "ggrepel", "formattable", "RColorBrewer", "matrixStats", "dplyr", "biomaRt", "DESeq2"), rownames(installed.packages()))
if (!length(missing)) { cat("Ready for Computational Foundations workshop\n")} else {cat("PROBLEM: could not install:", missing, "\n")}
?setdiff

# load packages for today
library(DESeq2)
library(ggplot2)
library(tidyr)
library(matrixStats)
library('ggrepel', character.only=TRUE)
library('pheatmap', character.only=TRUE)
library('RColorBrewer', character.only=TRUE)
?library

?`DESeq2-package`

# load raw count table
?read.table
count_table <- read.table("./data/gene_expected_count.txt", header = TRUE, row.names = 1)
head(count_table)
tail(count_table)

# round count table - need whole numbers
?floor
count_table <- floor(count_table)
tail(count_table)

sessionInfo()

# load sample info
samplesheet <- read.table("~/RNASeqDemystified/data/samplesheet.csv", sep = ",", header = TRUE, row.names = 1)
head(samplesheet)
str(samplesheet)

# reorder factors
samplesheet$condition <- factor(samplesheet$condition, levels = c( "wt.Tx", "ko.Tx", "ko.control", "wt.control" ))
unique(samplesheet$condition)

head(count_table)

# check that counts and sample info match
all(colnames(count_table) == rownames(samplesheet))

# Create DESeq2 Dataset
dds <- DESeqDataSetFromMatrix(countData = count_table, colData = samplesheet, design = ~ condition)
str(dds)

# filter out very low expressed genes
keep <- rowSums(counts(dds)) >= 10
dds <- dds[keep,]

# create normalized count object
?rlog
rld <- rlog(dds, blind = TRUE)
head(assay(rld), 3)

# fit DESeq2 model
dds <- DESeq(dds)
head(dds)
str(dds)


resultsNames(dds)

# setting up plot directories
dir.create("./Figures")
dir.create("./Figures/BySamples")
getwd()

# Setup plot variables
plotPath <- "./Figures/BySamples/"
Comparison <- "ko.Tx"

# generate PCA projections for top 500 genes
?plotPCA
p.all <- plotPCA(rld, intgroup = c('condition'), ntop = 500)
head(p.all)
p.all

# write out plot to file
pdf(file = paste0(plotPath, 'PCAplot_rlog_', Comparison, '.pdf'), onefile = TRUE)
p.all
dev.off()

# look at results
resultsNames(dds)

# look at Tx ko comparison
Comparison <- "condition_ko.Tx_vs_wt.Tx"  
res_Tx <- results(dds, name=Comparison)

# generate additional contrast
res_WT <- results(dds, contrast=c("condition", "ko.control", "wt.control")) 
head(res_WT)

# set threshold 
fc <- 1.5
pval <- 0.05

# select data of interest
df<- res_WT[order(res_WT$padj),]
df <- as.data.frame(df)
df <- cbind("id" = row.names(df), df)
str(df)

# specify plot variables
Comparison <- "ko.control_v_wt.control"
plotPath = "./Figures/"

# generate volcano plot
p <- ggplot(df, aes(x = log2FoldChange, y = -log10(padj))) + geom_point(shape = 21, fill= 'darkgrey', color= 'darkgrey', size = 1) + theme_classic() + xlab('Log2 fold-change') + ylab('-Log10 adjusted p-value')

p <- p + geom_vline(xintercept = c(0, -log2(fc), log2(fc)), linetype = c(1, 2, 2), color = c('black', 'black', 'black')) + geom_hline(yintercept = -log10(pval), linetype = 2, color = 'black')

p <- p + ggtitle(as.character(Comparison))

p


# summarize DE results
sum(res_WT$padj < 0.05 & abs(res_WT$log2FoldChange) >= log2(1.5), na.rm = TRUE)
# 735 DE genes for ko.control groups

sum(res_Tx$padj < 0.05 & abs(res_Tx$log2FoldChange) >= log2(1.5), na.rm = TRUE)
# 1152 DE genes for ko.tx groups

head(res_WT)











