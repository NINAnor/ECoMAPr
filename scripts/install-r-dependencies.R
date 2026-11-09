cran_repo <- "https://cloud.r-project.org"
inla_repo <- "https://inla.r-inla-download.org/R/stable"
library_path <- .libPaths()[1]

if (!requireNamespace("BiocManager", quietly = TRUE)) {
  install.packages("BiocManager", lib = library_path, repos = cran_repo)
}

BiocManager::install(
  c("graph", "Rgraphviz"),
  lib = library_path,
  ask = FALSE,
  update = FALSE
)

cran_packages <- c("terra", "fmesher", "inlabru", "tidyterra")
missing_cran_packages <- cran_packages[
  !vapply(cran_packages, requireNamespace, logical(1), quietly = TRUE)
]
if (length(missing_cran_packages) > 0) {
  install.packages(
    missing_cran_packages,
    lib = library_path,
    repos = cran_repo,
    dependencies = NA
  )
}

if (!requireNamespace("INLA", quietly = TRUE)) {
  install.packages(
    "INLA",
    lib = library_path,
    repos = c(CRAN = cran_repo, INLA = inla_repo),
    dependencies = NA
  )
}
