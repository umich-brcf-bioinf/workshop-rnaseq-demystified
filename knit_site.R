# required_packages = c("data.table",
#                       "tidyr", 
#                       "pheatmap",
#                       "formattable",
#                       "RColorBrewer",
#                       "matrixStats",
#                       "dplyr",
#                       "ggplot2",
#                       "ggrepel",
#                       "tidyverse",
#                       "DESeq2",
#                       "biomaRt")
# 
# if (!requireNamespace("BiocManager", quietly = TRUE)) {
#   install.packages("BiocManager")
#   requireNamespace("BiocManager", quietly = TRUE)
# }
# BiocManager::install(required_packages, update=FALSE, ask=FALSE)
# 
# missing <- setdiff(required_packages, rownames(installed.packages()))
# if (!length(missing)) {
#   cat("Ready for Computational Foundations workshop\n")
#   } else {
#     cat("PROBLEM: could not install:", missing, "\n")
#   }
# }
# BiocManager::install(missing, update=FALSE, ask=FALSE)

library(rmarkdown)

# The html from the files below don't have the nav bar

render('source/workshop_setup/preworkshop_checklist.md', output_dir='html/workshop_setup/')
render('source/workshop_setup/setup_instructions.md', output_dir='html/workshop_setup/')
render('source/workshop_setup/setup_instructions_advanced.md', output_dir='html/workshop_setup/')

# The html from the files below do have the nav bar, so if you make changes 
# that impact the navbar (e.g. file name changes) you should reknit all of them.

render_site('source/index.md')
render_site('source/breakout_exercises.md')
render_site('source/Module00_Introduction.Rmd')
render_site('source/Module01_Warming_Up.md')
render_site('source/Module02a_Sequence_QC.md')
render_site('source/Module02b_Trimming.md')
render_site('source/Module02b_breakout01_ex.md')
render_site('source/Module02b_breakout01_sol.md')
render_site('source/Module03a_Reference_Genomes.md')
render_site('source/Module03b_Alignment.md')
render_site('source/Module03b_breakout02_ex.md')
render_site('source/Module03b_breakout02_sol.md')
render_site('source/Module04_Alignment_QC_and_Quantification.md')
render_site('source/Module04_breakout03_ex.md')
render_site('source/Module04_breakout03_sol.md')
render_site('source/Module05_Additional_Details.md')
render_site('source/Module05_breakout04_ex.md')
render_site('source/Module05_breakout04_sol.md')

render_site('source/Module06_DEAnalysisSetup.Rmd')
render_site('source/Module07_DESeq2Init.Rmd')
render_site('source/Module08_DESeq2DE.Rmd')
render_site('source/Module09_SampleQCViz.Rmd')
render_site('source/Module09a_breakout.Rmd')
render_site('source/Module10_DEComparisons.Rmd')
render_site('source/Module10a_batchAndCovars.Rmd')
render_site('source/Module11_DEVisualizations.Rmd')
render_site('source/Module12_DEAnnotations.Rmd') 
render_site('source/R_bonus_content.Rmd')

render_site('source/Module99_Wrap_up.md')
#clean_site(preview=TRUE)
