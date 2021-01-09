packages <- c('tidyverse', 'rmarkdown')
pkgs_installed <- sapply(packages,
                         requireNamespace, quietly = TRUE)
if (!all(pkgs_installed)) {
    install.packages(packages)
}
library(dplyr, quietly = TRUE)
pkg_versions <- installed.packages() %>%
    dplyr::as_tibble() %>%
    filter(Package %in% packages) %>%
    select(Package, Version)

print(getwd())
print(system('git --version', intern = TRUE))
print(R.Version()$version.string)
print(pkg_versions)
