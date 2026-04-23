
## Downsample and Plot (demo)

```r
# Run from the package root.
# Import scripts look for Pairwise70 at `PAIRWISE70_DATA_DIR` first, then
# standard sibling locations such as `../Pairwise70/data` and platform-specific
# defaults (Windows: under `Projects/`, Linux: under `~/`).
source("data-raw/examples/downsample_cohort.R")
coh_ds <- read.csv("inst/extdata/cohort_downsampled.csv")

# Base plotting
plot_effects_quick(coh_ds)

# ggplot2 plotting (if available)
if (requireNamespace("ggplot2", quietly = TRUE)) {
  p <- plot_effects_gg(coh_ds, top_n = 50, title = "Downsampled effects")
  print(p)
}
```
