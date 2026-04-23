# sentinel:skip-file  (P0-hardcoded-local-path: env-var + candidate-list helper;
# the drive literals are the canonical fallback pattern from lessons.md.)
find_project_root <- function(start = getwd()) {
  roots <- unique(
    normalizePath(
      c(start, dirname(start), file.path(start, ".."), file.path(start, "..", "..")),
      winslash = "/",
      mustWork = FALSE
    )
  )

  for (root in roots) {
    if (file.exists(file.path(root, "DESCRIPTION"))) {
      return(root)
    }
  }

  stop("Project root not found. Run from the package root or a child directory.")
}

resolve_pairwise70_data_dir <- function(project_root) {
  env_path <- Sys.getenv("PAIRWISE70_DATA_DIR", unset = "")
  candidates <- unique(
    c(
      if (nzchar(env_path)) env_path,
      file.path(project_root, "..", "Pairwise70", "data"),
      file.path(project_root, "..", "..", "Pairwise70", "data"),
      "C:/Projects/Pairwise70/data",
      "D:/Projects/Pairwise70/data",
      "C:/Pairwise70/data",
      "D:/Pairwise70/data"
    )
  )

  for (candidate in candidates) {
    if (dir.exists(candidate)) {
      return(normalizePath(candidate, winslash = "/", mustWork = TRUE))
    }
  }

  stop(
    paste(
      "Pairwise70 data directory not found.",
      "Set PAIRWISE70_DATA_DIR or place the dataset in a supported candidate location."
    )
  )
}
