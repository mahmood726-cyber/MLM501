# Evidence Pathway Engine: CVD Management Simulation
# ===============================================

source("R/api.R")
source("R/pathway.R")
library(ggplot2)

# 1. Fetch Treatment Effect from MLM Table (Example: CD000028)
# We'll use a hypothetical RR based on typical Cochrane results
message("Loading clinical treatment effect for CVD prevention...")
rr_treatment <- 0.85 # 15% risk reduction

# 2. Define Diagnostic Parameters (Example: HS-Troponin)
sens <- 0.94
spec <- 0.88
prev <- 0.15 # 15% prevalence in symptomatic population

# 3. Run Pathway Simulation
message("Simulating 'Test -> Treat' pathway for 10,000 patients...")
pathway <- simulate_pathway(prevalence = prev, 
                            sensitivity = sens, 
                            specificity = spec, 
                            rr = rr_treatment, 
                            harm_rate = 0.02, # 2% adverse events from treatment
                            n = 10000)

cat("
--- PATHWAY SIMULATION RESULTS ---
")
cat(sprintf("Total Patients: %d
", pathway$population))
cat(sprintf("Events Prevented: %.0f
", pathway$events_prevented))
cat(sprintf("Treatment Harms: %.0f
", pathway$total_harms))
cat(sprintf("NET CLINICAL BENEFIT: %.0f lives saved/improved
", pathway$net_benefit))
cat("----------------------------------
")

# 4. Generate the Pathway Frontier Plot
message("Generating Pathway Frontier Visualization...")
p <- plot_pathway_frontier(prevalence = prev, 
                           specificity = spec, 
                           rr = rr_treatment, 
                           harm_rate = 0.02)

ggsave("inst/extdata/pathway_frontier_cvd.png", p, width = 8, height = 6)
message("Visualization saved to inst/extdata/pathway_frontier_cvd.png")
