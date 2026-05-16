setwd('C:/Users/user/OneDrive - NHS/Documents/501MLM')
options(repos = 'https://cloud.r-project.org')
if (!requireNamespace('devtools', quietly = TRUE)) install.packages('devtools')
devtools::document()
