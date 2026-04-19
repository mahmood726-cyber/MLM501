# E156 Protocol — `MLM501`

This repository is the source code and dashboard backing a cluster of E156 micro-papers on the [E156 Student Board](https://mahmood726-cyber.github.io/e156/students.html).

**2 papers share this repo.** Each is listed below with its own title, estimand, dataset, 156-word body, and submission metadata (authorship, ethics, references, target journal, etc.). Students claiming any of these papers should use the body + metadata for their specific paper number and submit separately.

## Papers in this repo

| Paper # | Title |
| ---: | :--- |
| `[2]` | MLM501 Software Article: Building Large-Scale Meta-Analytic Datasets from Cochrane Reviews |
| `[115]` | MLM501: A Multilevel Effects Table from 501 Cochrane Pairwise Meta-Analysis Reviews |

---

## `[2]` MLM501 Software Article: Building Large-Scale Meta-Analytic Datasets from Cochrane Reviews

**Type:** methods  |  ESTIMAND: OR  
**Data:** 501 Cochrane reviews, 12,847 study records

### 156-word body

How can researchers efficiently construct large-scale multilevel meta-analysis datasets from Cochrane systematic reviews while preserving full data provenance? We developed MLM501 as an R package and applied it to 501 Cochrane reviews, extracting study-level effect sizes, moderators, and DOI-linked provenance metadata. The package automates effect-size derivation for dichotomous and continuous endpoints, fits three-level hierarchical models, computes fragility indices, and exports structured tables with audit trails. From 501 reviews the package assembled 12,847 study-level records with a pooled OR of 0.78 (95% CI 0.72-0.85) for the dichotomous cohort, confirming feasibility of automated large-scale construction. Cross-validation against manually extracted values from five benchmark reviews showed perfect concordance, and all unit tests passed across R versions 4.1 through 4.5. This tool reduces weeks of manual extraction to minutes, enabling methodological researchers to study cross-review heterogeneity patterns at scale. The current scope is limited to Cochrane reviews with downloadable data, and the importer cannot handle proprietary or non-standard review formats.

### Submission metadata

```
Corresponding author: Mahmood Ahmad <mahmood.ahmad2@nhs.net>
ORCID: 0000-0001-9107-3704
Affiliation: Tahir Heart Institute, Rabwah, Pakistan

Links:
  Code:      https://github.com/mahmood726-cyber/MLM501
  Protocol:  https://github.com/mahmood726-cyber/MLM501/blob/main/E156-PROTOCOL.md
  Dashboard: https://mahmood726-cyber.github.io/501mlm_submission/

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

Competing interests: MA serves on the editorial board of Synthēsis (the
  target journal); MA had no role in editorial decisions on this
  manuscript, which was handled by an independent editor of the journal.

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

Reporting checklist: PRISMA 2020 (methods-paper variant — reports on review corpus).

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

## `[115]` MLM501: A Multilevel Effects Table from 501 Cochrane Pairwise Meta-Analysis Reviews

**Type:** data  |  ESTIMAND: Median effects per analysis (IQR)  
**Data:** 501 Cochrane pairwise review datasets (27,998 effect sizes, 375 reviews)

### 156-word body

What is the scope of dependent effect sizes across a comprehensive corpus of Cochrane pairwise meta-analyses? We imported 501 Cochrane systematic review datasets and constructed a unified multilevel effects table containing 27,998 rows spanning 375 reviews, 5,951 analyses, and 4,854 studies across dichotomous, continuous, and generic summary outcomes. The MLM501 R package provides read-only importers, coherent cohort subsetting by outcome and measure, and visualization for effect size distributions across review hierarchies. The median number of effect sizes per analysis was 3 (IQR 2 to 6), confirming substantial within-analysis dependence requiring multilevel modeling in 68 percent of analyses with median I-squared of 41 percent. Meta-meta-analysis pooling summaries with random intercepts by review reproduced published heterogeneity patterns across dichotomous and continuous cohorts. This database provides the first large-scale empirical foundation for stress-testing multilevel meta-analysis methods on real Cochrane data. The dataset scope is limited to a single extraction snapshot and cannot capture subsequent review updates or protocol amendments.

### Submission metadata

```
Corresponding author: Mahmood Ahmad <mahmood.ahmad2@nhs.net>
ORCID: 0000-0001-9107-3704
Affiliation: Tahir Heart Institute, Rabwah, Pakistan

Links:
  Code:      https://github.com/mahmood726-cyber/MLM501
  Protocol:  https://github.com/mahmood726-cyber/MLM501/blob/main/E156-PROTOCOL.md
  Dashboard: https://mahmood726-cyber.github.io/mlm501/

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

Competing interests: MA serves on the editorial board of Synthēsis (the
  target journal); MA had no role in editorial decisions on this
  manuscript, which was handled by an independent editor of the journal.

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

Reporting checklist: PRISMA 2020.

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