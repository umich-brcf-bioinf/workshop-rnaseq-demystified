library(tidyverse)

# Note, change this if you're going to update these figures!
setwd("~/Projects/2023-08-14-umich-rnaseq-demystified")

expr = data.frame(X1 = rnorm(n = 6, mean = 4, sd = 0.5),
                  X2 = rnorm(n = 6, mean = 4, sd = 0.5),
                  X3 = rnorm(n = 6, mean = 4.5, sd = 1.5),
                  X4 = rnorm(n = 6, mean = 4, sd = 1.5),
                  X5 = rnorm(n = 6, mean = 4, sd = 0.5),
                  X6 = rnorm(n = 6, mean = 1, sd = 0.5))

expr_mat = t(expr)
colnames(expr_mat) = paste('Sample', 1:6, sep = '_')

df = data.frame(
    Condition = factor(c('WT','KO','WT','KO','WT','KO'), levels = c('WT', 'KO')),
    Gene = c('Gene_1', 'Gene_1', 'Gene_2', 'Gene_2', 'Gene_3', 'Gene_3')
)

df = bind_cols(df, expr_mat)

long_df = pivot_longer(df, -c(Condition, Gene), names_to = 'Sample', values_to = 'Expression')

combined_plot = ggplot(long_df, aes(x = Condition, y = Expression, color = Condition)) + 
    geom_boxplot() + geom_jitter(size = 3) + facet_grid(. ~ Gene) +
    ggtitle('Does the KO affect the expression?') + stat_summary(fun = 'mean', color = 'black', shape = 13)
combined_plot
ggsave(filename = 'source/images/Module10_stat_plot.png', plot = combined_plot, height = 4, width = 6, units = 'in', dpi = 300)

for(gene in c('Gene_1', 'Gene_2', 'Gene_3')) {
    plot = ggplot(long_df %>% filter(Gene == gene), aes(x = Condition, y = Expression, color = Condition)) +
        geom_boxplot() + geom_jitter(size = 3) + ggtitle(gene) + stat_summary(fun = 'mean', color = 'black', shape = 13)
    plot
    
    plot_file = sprintf('source/images/Module10_stat_plot_%s.png', gene)
    ggsave(filename = plot_file, plot = plot, height = 4, width = 3, units = 'in', dpi = 300)
}

