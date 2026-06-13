utils::globalVariables(c("outcome_type", "TE", "seTE"))

#' Select a coherent cohort for analysis
#' @param df effects table from read_mlm_effects()
#' @param outcome one of c("DICH","CONT","GENSUM")
#' @param measure character (e.g., "logOR","MD","GIV","GEN_CI")
#' @param drop_na logical: drop rows with NA TE or seTE
#' @return filtered data.frame
#' @export
get_cohort <- function(df, outcome, measure, drop_na = TRUE) {
  stopifnot(is.data.frame(df))
  # Use explicit column indexing rather than subset()'s non-standard
  # evaluation: inside subset(), the bare symbol `measure` resolves to the
  # data-frame column `measure`, so `measure %in% measure` is always TRUE and
  # the measure filter silently never applies.
  coh <- df[df$outcome_type %in% outcome & df$measure %in% measure, , drop = FALSE]
  if (drop_na) {
    coh <- coh[is.finite(coh$TE) & is.finite(coh$seTE) & coh$seTE > 0, , drop = FALSE]
  }
  coh
}
