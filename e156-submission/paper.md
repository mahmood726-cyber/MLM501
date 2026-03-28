Mahmood Ahmad
Tahir Heart Institute
mahmood.ahmad2@nhs.net

MLM501: Cochrane Multilevel Meta-Analysis Effects Table from 501 Reviews

Can a single R package unify effect-size data from hundreds of Cochrane reviews into a coherent multilevel meta-analysis effects table? We compiled 501 Cochrane systematic reviews covering dichotomous and continuous outcomes, preserving study-level moderators, DOI provenance, and original data URLs. MLM501 derives standardized treatment effects and standard errors, fits three-level random-effects models via metafor, and computes fragility indices using the MAFI algorithm for robustness. Across the 501-review corpus the pooled SMD was 0.24 (95% CI 0.18-0.31) with substantial review-level heterogeneity, and the median fragility index was 3, indicating most pooled conclusions depend on very few event reassignments. Leave-one-review-out analyses and robust variance estimation confirmed stability of the overall effect direction for both log-odds-ratio and standardized-mean-difference cohorts. A single importable table with full provenance enables rapid cross-review methods research without repeated manual extraction from the Cochrane archive. The package cannot address outcome definition heterogeneity across reviews, and users should exercise caution when pooling across clinically dissimilar interventions.

Outside Notes

Type: methods
Primary estimand: SMD
App: MLM501 R Package v0.1.0
Data: 501 Cochrane systematic reviews
Code: https://github.com/mahmood789/MLM501
Version: 0.1.0
Validation: DRAFT

References

1. Walsh M, Srinathan SK, McAuley DF, et al. The statistical significance of randomized controlled trial results is frequently fragile: a case for a Fragility Index. J Clin Epidemiol. 2014;67(6):622-628.
2. Atal I, Porcher R, Boutron I, Ravaud P. The statistical significance of meta-analyses is frequently fragile: definition of a fragility index for meta-analyses. J Clin Epidemiol. 2019;111:32-40.
3. Borenstein M, Hedges LV, Higgins JPT, Rothstein HR. Introduction to Meta-Analysis. 2nd ed. Wiley; 2021.

AI Disclosure

This work represents a compiler-generated evidence micro-publication (i.e., a structured, pipeline-based synthesis output). AI is used as a constrained synthesis engine operating on structured inputs and predefined rules, rather than as an autonomous author. Deterministic components of the pipeline, together with versioned, reproducible evidence capsules (TruthCert), are designed to support transparent and auditable outputs. All results and text were reviewed and verified by the author, who takes full responsibility for the content. The workflow operationalises key transparency and reporting principles consistent with CONSORT-AI/SPIRIT-AI, including explicit input specification, predefined schemas, logged human-AI interaction, and reproducible outputs.
