# E156 Protocol — `501MLM`

This repository is the source code and dashboard backing an E156 micro-paper on the [E156 Student Board](https://mahmood726-cyber.github.io/e156/students.html).

---

## `[1]` MLM501: Cochrane Multilevel Meta-Analysis Effects Table from 501 Reviews

**Type:** methods  |  ESTIMAND: SMD  
**Data:** 501 Cochrane systematic reviews

### 156-word body

Can a single R package unify effect-size data from hundreds of Cochrane reviews into a coherent multilevel meta-analysis effects table? We compiled 501 Cochrane systematic reviews covering dichotomous and continuous outcomes, preserving study-level moderators, DOI provenance, and original data URLs. MLM501 derives standardized treatment effects and standard errors, fits three-level random-effects models via metafor, and computes fragility indices using the MAFI algorithm for robustness. Across the 501-review corpus the pooled SMD was 0.24 (95% CI 0.18-0.31) with substantial review-level heterogeneity, and the median fragility index was 3, indicating most pooled conclusions depend on very few event reassignments. Leave-one-review-out analyses and robust variance estimation confirmed stability of the overall effect direction for both log-odds-ratio and standardized-mean-difference cohorts. A single importable table with full provenance enables rapid cross-review methods research without repeated manual extraction from the Cochrane archive. The package cannot address outcome definition heterogeneity across reviews, and users should exercise caution when pooling across clinically dissimilar interventions.

### Submission metadata

```
Middle author: Mahmood Ahmad <mahmood.ahmad2@nhs.net>
ORCID: 0000-0001-9107-3704
Affiliation: Tahir Heart Institute, Rabwah, Pakistan

Links:
  Code:      https://github.com/mahmood726-cyber/501MLM
  Protocol:  https://github.com/mahmood726-cyber/501MLM/blob/main/E156-PROTOCOL.md
  Dashboard: https://mahmood726-cyber.github.io/e156/paper/1.html

References (topic pack: multilevel / three-level meta-analysis):
  1. Cheung MW-L. 2014. Modeling dependent effect sizes with three-level meta-analyses: a structural equation modeling approach. Psychol Methods. 19(2):211-229. doi:10.1037/a0032968
  2. Van den Noortgate W, López-López JA, Marín-Martínez F, Sánchez-Meca J. 2013. Three-level meta-analysis of dependent effect sizes. Behav Res Methods. 45(2):576-594. doi:10.3758/s13428-012-0261-6

Data availability: No patient-level data used. Analysis derived exclusively
  from publicly available aggregate records. All source identifiers are in
  the protocol document linked above.

Ethics: Not required. Study uses only publicly available aggregate data; no
  human participants; no patient-identifiable information; no individual-
  participant data. No institutional review board approval sought or required
  under standard research-ethics guidelines for secondary methodological
  research on published literature.

Funding: None.

Competing interests: None declared.

Author contributions (CRediT):
  [STUDENT REWRITER, first author] — Writing – original draft, Writing –
    review & editing, Validation.
  [SUPERVISING FACULTY, last/senior author] — Supervision, Validation,
    Writing – review & editing.
  Mahmood Ahmad (middle author, NOT first or last) — Conceptualization,
    Methodology, Software, Data curation, Formal analysis, Resources.

AI disclosure: Computational tooling (including AI-assisted coding via
  Claude Code [Anthropic]) was used to develop analysis scripts and assist
  with data extraction. The final manuscript was human-written, reviewed,
  and approved by the author; the submitted text is not AI-generated. All
  quantitative claims were verified against source data; cross-validation
  was performed where applicable. The author retains full responsibility for
  the final content.

Preprint: Not preprinted.

Reporting checklist: Not applicable — methodological/software paper; CRediT + data-availability statements in this block cover reporting.

Target journal: ◆ Synthēsis (https://www.synthesis-medicine.org/index.php/journal)
  Section: Methods Note — submit the 156-word E156 body verbatim as the main text.
  The journal caps main text at ≤400 words; E156's 156-word, 7-sentence
  contract sits well inside that ceiling. Do NOT pad to 400 — the
  micro-paper length is the point of the format.

Manuscript license: CC-BY-4.0.
Code license: MIT.

SUBMITTED: [ ]
```


---

_Auto-generated from the workbook by `C:/E156/scripts/create_missing_protocols.py`. If something is wrong, edit `rewrite-workbook.txt` and re-run the script — it will overwrite this file via the GitHub API._