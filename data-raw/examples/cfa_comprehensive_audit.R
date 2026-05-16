# CFA: Comprehensive Global Evidence Audit
# =========================================

options(repos = "https://cloud.r-project.org")

# Source R files directly
source("R/api.R")
source("R/cohorts.R")
source("R/plots.R")
source("R/plots_cohort.R")
source("R/plots_gg.R")
source("R/stress_test.R")

library(metafor)
library(ggplot2)

# 1. Load the Full Effects Table
message("Loading Multilevel Effects Table...")
df <- read_mlm_effects()

# 2. Comprehensive Global MAFI Audit (All Measures)
message("Performing Multi-Measure Robustness Audit...")
# calculate_global_mafi uses all available data by default
audit_all <- calculate_global_mafi(df)

# 3. Temporal Stability Analysis (MAFI vs median Year)
message("Analyzing Temporal Stability Trends...")
# Get median year per analysis
year_map <- aggregate(study_year ~ analysis_id, data = df, FUN = function(x) median(x, na.rm = TRUE))
audit_all <- merge(audit_all, year_map, by = "analysis_id", all.x = TRUE)

# 4. Specialty Analysis (Extracting CD Group prefix)
# Cochrane IDs often start with CD, and the following numbers can sometimes be grouped, 
# but usually, the first few letters after "CD" indicate the group in older systems.
# We'll just group by the Review ID for now to see per-review fragility.
review_summary <- aggregate(MAFI ~ review_id, data = audit_all, FUN = function(x) {
  c(mean = mean(x), count = length(x), high_fragile = sum(x > 0.5))
})
# Flatten the aggregated data frame
review_summary <- data.frame(
  review_id = review_summary$review_id,
  mean_mafi = review_summary$MAFI[, "mean"],
  analysis_count = review_summary$MAFI[, "count"],
  high_fragile_count = review_summary$MAFI[, "high_fragile"]
)

# 5. Save Comprehensive Results
dir.create("inst/extdata", showWarnings = FALSE, recursive = TRUE)
write.csv(audit_all, "inst/extdata/cfa_comprehensive_audit.csv", row.names = FALSE)
write.csv(review_summary, "inst/extdata/cfa_review_robustness_summary.csv", row.names = FALSE)

# 6. Visualizations

# A. The Global Entropy Landscape (All measures)
message("Visualizing Global Entropy Landscape...")
p1 <- plot_entropy_landscape(audit_all) +
  facet_wrap(~measure, scales = "free_x") +
  labs(title = "Cochrane Fragility Atlas: Multi-Measure Landscape",
       subtitle = "Fragility vs Heterogeneity across different effect measures")
ggsave("inst/extdata/cfa_multi_measure_landscape.png", p1, width = 12, height = 8)

# B. Temporal Trend Plot
message("Visualizing Temporal Trends...")
p2 <- ggplot(subset(audit_all, !is.na(study_year)), aes(x = study_year, y = MAFI, color = measure)) +
  geom_point(alpha = 0.4) +
  geom_smooth(method = "gam", formula = y ~ s(x, bs = "cs")) +
  theme_minimal() +
  labs(title = "Evolution of Evidence Robustness Over Time",
       x = "Median Study Year", y = "Fragility (MAFI)",
       subtitle = "Is medical evidence becoming more or less robust?")
ggsave("inst/extdata/cfa_temporal_trends.png", p2, width = 10, height = 6)

# C. Fragility Distribution by Measure
p3 <- ggplot(audit_all, aes(x = measure, y = MAFI, fill = measure)) +
  geom_boxplot() +
  theme_minimal() +
  labs(title = "Fragility Distribution by Outcome Measure",
       y = "MAFI Score")
ggsave("inst/extdata/cfa_measure_distribution.png", p3, width = 8, height = 6)

# 7. Final Summary Output
cat("
======================================================
")
cat("COMPREHENSIVE COCHRANE FRAGILITY AUDIT COMPLETE
")
cat("======================================================
")
cat(sprintf("Total Analyses Audited: %d
", nrow(audit_all)))
cat("
Fragility Classification (Global):
")
print(table(audit_all$MAFI_class))

cat("
Fragility by Measure:
")
print(tapply(audit_all$MAFI, audit_all$measure, mean))

cat("
Top 10 Most 'Robust' Reviews (Highest Quality Anchor):
")
print(head(review_summary[order(review_summary$mean_mafi), ], 10))

cat("
Top 10 Most 'Fragile' Reviews (Research Priority Area):
")
print(head(review_summary[order(review_summary$mean_mafi, decreasing = TRUE), ], 10))
cat("
======================================================
")
