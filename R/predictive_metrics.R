#' Enhanced Predictive Metrics with Non-Linear Decay
#' @description Implements exponential evidence decay and multilevel fragility adjustments.
#' @param mafi_base Base MAFI score (0-1).
#' @param k Number of studies.
#' @param I2 I-squared heterogeneity percentage.
#' @param study_year_median Median publication year of the studies.
#' @return A list with stale_score, roe_index, and evidence_age.
#' @export
calculate_MAFI_pro <- function(mafi_base, k, I2, study_year_median) {
  current_year <- as.integer(format(Sys.Date(), "%Y"))
  evidence_age <- current_year - study_year_median
  
  # 1. Non-Linear Evidence Decay (Sigmoid function)
  # Addressing Reviewer 1: Evidence doesn't rot linearly.
  # It stays fresh for the first several years, then decays around the
  # sigmoid mid-point at 12 years (steepness 0.3 per year).
  stale_score <- 1 / (1 + exp(-0.3 * (evidence_age - 12))) # Mid-point at 12 years
  
  # 2. Multilevel Dependency Adjustment
  # Reviews with many analyses (High nesting) have their fragility score 
  # slightly inflated to account for shared bias sources.
  nesting_inflation <- 1 + (log1p(k) / 10)
  
  # 3. Return on Evidence (ROE)
  # ROE = mafi_base * stale_score * nesting_inflation (multiplicative;
  # capped at 1 below). No standard-error term is used in this implementation.
  roe_index <- (mafi_base * stale_score * nesting_inflation)
  
  return(list(
    stale_score = round(stale_score, 3),
    roe_index = round(min(roe_index, 1), 3),
    evidence_age = evidence_age
  ))
}

#' Updated Global Audit with Specialty Grouping
#' @importFrom stats aggregate median
#' @param df Data frame from read_mlm_effects(). If missing, loaded automatically.
#' @return Augmented audit data frame with stale_score, roe_index, evidence_age, specialty.
#' @export
calculate_global_audit_pro <- function(df) {
  audit <- calculate_global_mafi(df)

  # Guard: if no analysis had k >= 3, calculate_global_mafi() returns NULL
  # (do.call(rbind, all-NULL) is NULL). Degrade gracefully instead of feeding
  # NULL into merge(), which errors with "'by' must specify a uniquely valid column".
  if (is.null(audit) || nrow(audit) == 0) return(audit)

  # Ensure we use MEDIAN STUDY YEAR (Reviewer 3 fix)
  # na.action = na.pass keeps groups whose study_year is entirely NA (real data
  # has NA years, e.g. 'HYVET 2008'); without it aggregate() na.omits every row
  # and errors with "no rows to aggregate". median(all-NA, na.rm=TRUE) -> NA,
  # which flows harmlessly into calculate_MAFI_pro (evidence_age becomes NA).
  year_map <- aggregate(study_year ~ analysis_id, data = df,
                        FUN = function(x) median(x, na.rm = TRUE),
                        na.action = na.pass)
  audit <- merge(audit, year_map, by = "analysis_id", all.x = TRUE)
  
  # Specialty Extraction (Reviewer 2 fix)
  # Mapping review_id to specialty (Heuristic based on Cochrane ID sequences)
  audit$specialty <- "General Medicine"
  audit$specialty[grep("CD000", audit$review_id)] <- "Cardiovascular"
  audit$specialty[grep("CD010", audit$review_id)] <- "Neurology/Dementia"
  audit$specialty[grep("CD011", audit$review_id)] <- "Infectious Disease"
  audit$specialty[grep("CD015", audit$review_id)] <- "Respiratory/Emergency"
  
  pro_results <- lapply(seq_len(nrow(audit)), function(i) {
    calculate_MAFI_pro(audit$MAFI[i], audit$k[i], audit$I2[i], audit$study_year[i])
  })
  
  audit$stale_score <- sapply(pro_results, function(x) x$stale_score)
  audit$roe_index <- sapply(pro_results, function(x) x$roe_index)
  audit$evidence_age <- sapply(pro_results, function(x) x$evidence_age)
  
  return(audit)
}
