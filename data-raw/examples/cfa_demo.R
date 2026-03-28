# CFA: Cochrane Fragility Atlas - Demonstration Script (Fallback for R 3.6 without devtools)
# ========================================================================================

options(repos = "https://cloud.r-project.org")

# Source R files directly
source("R/api.R")
source("R/cohorts.R")
source("R/plots.R")
source("R/plots_cohort.R")
source("R/plots_gg.R")
source("R/stress_test.R")

# Ensure required libraries are loaded
if (!requireNamespace("metafor", quietly = TRUE)) install.packages("metafor")
if (!requireNamespace("ggplot2", quietly = TRUE)) install.packages("ggplot2")
library(metafor)
library(ggplot2)

# 1. Load the Effects Table
message("Loading Multilevel Effects Table (501+ Cochrane Reviews)...")
df <- read_mlm_effects()

# 2. Filter for a coherent cohort (Example: logOR)
message("Filtering for logOR cohorts...")
coh_df <- subset(df, measure == "logOR")

# 3. Calculate Global MAFI Audit
message("Performing Global Robustness Audit (CFA)...")
# Audit only unique analyses
audit <- calculate_global_mafi(coh_df)

# 4. Save results
dir.create("inst/extdata", showWarnings = FALSE, recursive = TRUE)
write.csv(audit, "inst/extdata/cfa_audit_results.csv", row.names = FALSE)
message("Audit results saved to inst/extdata/cfa_audit_results.csv")

# 5. Visualize the Entropy Landscape
message("Generating the Entropy Landscape of Global Evidence...")
p <- plot_entropy_landscape(audit)
p <- p + labs(title = "Cochrane Fragility Atlas: The Entropy Landscape",
              subtitle = "Mapping the stability of logOR conclusions across medical evidence")

# Save plot
ggsave("inst/extdata/cfa_entropy_landscape.png", p, width = 10, height = 7, dpi = 300)
message("Visualization saved to inst/extdata/cfa_entropy_landscape.png")

# 6. Summary Stats
cat("\n--- CFA GLOBAL AUDIT SUMMARY ---\n")
print(table(audit$MAFI_class))
cat("\nTop 5 Most Robust Analyses:\n")
print(head(audit[order(audit$MAFI), c("review_id", "analysis_id", "MAFI", "MAFI_class")], 5))
cat("\nTop 5 Most Fragile Analyses (Evidence Frontier):\n")
print(head(audit[order(audit$MAFI, decreasing = TRUE), c("review_id", "analysis_id", "MAFI", "MAFI_class")], 5))
