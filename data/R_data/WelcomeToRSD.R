## Welcome to RSD (R)!

# load libraries
library(tidyverse)

# read in final DE results table
DE_results <- read_csv("./data/R_data/DE_results_deficient_vs_control_annotated.csv")
## alternative to test - download results
# download files
#download.file("https://raw.githubusercontent.com/umich-brcf-bioinf/2021-04-26-umich-rnaseqDemystified/master/data/Day2Data/samplesheet.csv", "./data/samplesheet.csv")


DE_results <- DE_results %>% arrange(padj)

# format DE results for plotting, adding column for labels
welcome_results <- DE_results %>% arrange(padj) %>% mutate(genelabels = "")
welcome_results$genelabels[1:10] <- DE_results$symbol[1:10]

# create labeled volcano plot
p = ggplot(welcome_results, aes(x = log2FoldChange, y = -log10(padj))) +
  geom_point() +
  theme_bw() +
  labs(
    title = 'Volcano Plot',
    subtitle = 'control vs deficient',
    x = 'log2 fold-change',
    y = '-log10 FDR'
  ) +
  geom_vline(
    xintercept = c(0, -log2(fc), log2(fc)),
    linetype = c(1, 2, 2)) +
  geom_hline(
    yintercept = -log10(fdr),
    linetype = 2) + geom_point(aes(color = call)) + 
  scale_color_manual(name = '', values=c('#B31B21', 'darkgray', '#1465AC')) +
  geom_text_repel(aes(label = genelabels))

print(p)
