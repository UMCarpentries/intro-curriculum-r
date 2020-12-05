print(system('git --version', intern = TRUE))
print(getwd())

pkgs_installed <- sapply(c('tidyverse', 'rmarkdown'),
                         requireNamespace, quietly = TRUE)
if (all(pkgs_installed)) {
    library(dplyr, quietly = TRUE)
    pkg_versions <- installed.packages() %>%
        dplyr::as_tibble() %>%
        filter(Package %in% c('tidyverse', 'rmarkdown')) %>%
        select(Package, Version)
    print(pkg_versions)
} else {
    not_installed <- pkgs_installed %>% Filter(isFALSE, .) %>% names()
    install_cmd <- lapply(not_installed, function(x) paste0("install.packages('", x, "')")) %>%
        unlist() %>%
        paste(collapse = "; ")
    stop('Not all required packages are installed.\n  ',
         'Please install them by pasting the following code in the R Console:\n',
         '\t',
         install_cmd
    )
}
