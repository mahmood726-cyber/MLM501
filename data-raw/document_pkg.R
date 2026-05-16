resolve_script_dir <- function() {
  file_arg <- grep("^--file=", commandArgs(trailingOnly = FALSE), value = TRUE)
  if (length(file_arg)) {
    return(dirname(normalizePath(sub("^--file=", "", file_arg[1]), winslash = "/", mustWork = FALSE)))
  }

  frame_files <- vapply(
    sys.frames(),
    function(frame) if (!is.null(frame$ofile)) frame$ofile else "",
    character(1)
  )
  frame_files <- frame_files[nzchar(frame_files)]
  if (length(frame_files)) {
    return(dirname(normalizePath(frame_files[[length(frame_files)]], winslash = "/", mustWork = FALSE)))
  }

  normalizePath(file.path(getwd(), "data-raw"), winslash = "/", mustWork = FALSE)
}

script_dir <- resolve_script_dir()
source(file.path(script_dir, "path_utils.R"))

project_root <- find_project_root(script_dir)
options(repos = 'https://cloud.r-project.org')
if (!requireNamespace('devtools', quietly = TRUE)) install.packages('devtools')
devtools::document(pkg = project_root)
