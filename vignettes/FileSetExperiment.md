---
title: "Introduction to FileSetExperiment"
author: 
  - name: Tim Triche, Jr.
    affiliation:
    - Van Andel Institute
    email: trichelab@gmail.com
output: 
  BiocStyle::html_document:
    self_contained: yes
    toc: true
    toc_float: true
    toc_depth: 2
    code_folding: show
date: "15 August 2024"
package: FileSetExperiment
vignette: >
  %\VignetteIndexEntry{Introduction to FileSetExperiment}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}  
---






# Basics

## Install `FileSetExperiment`

`R` is an open-source statistical environment which can be easily modified to enhance its functionality via packages. *[FileSetExperiment](https://bioconductor.org/packages/3.19/FileSetExperiment)* is a `R` package available via the [Bioconductor](http://bioconductor.org) repository for packages. `R` can be installed on any operating system from [CRAN](https://cran.r-project.org/) after which you can install *[FileSetExperiment](https://bioconductor.org/packages/3.19/FileSetExperiment)* by using the following commands in your `R` session:


``` r
if (!requireNamespace("BiocManager", quietly = TRUE)) {
      install.packages("BiocManager")
  }

BiocManager::install("FileSetExperiment")

## Check that you have a valid Bioconductor installation
BiocManager::valid()
```

## Required knowledge

*[FileSetExperiment](https://bioconductor.org/packages/3.19/FileSetExperiment)* is based on many other packages and in particular in those that have implemented the infrastructure needed for dealing with RNA-seq data (EDIT!). That is, packages like *[SummarizedExperiment](https://bioconductor.org/packages/3.19/SummarizedExperiment)* (EDIT!).

If you are asking yourself the question "Where do I start using Bioconductor?" you might be interested in [this blog post](http://lcolladotor.github.io/2014/10/16/startbioc/#.VkOKbq6rRuU).

## Asking for help

As package developers, we try to explain clearly how to use our packages and in which order to use the functions. But `R` and `Bioconductor` have a steep learning curve so it is critical to learn where to ask for help. The blog post quoted above mentions some but we would like to highlight the [Bioconductor support site](https://support.bioconductor.org/) as the main resource for getting help: remember to use the `FileSetExperiment` tag and check [the older posts](https://support.bioconductor.org/tag/FileSetExperiment/). Other alternatives are available such as creating GitHub issues and tweeting. However, please note that if you want to receive help you should adhere to the [posting guidelines](http://www.bioconductor.org/help/support/posting-guide/). It is particularly critical that you provide a small reproducible example and your session information so package developers can track down the source of the error.

## Citing `FileSetExperiment`

We hope that *[FileSetExperiment](https://bioconductor.org/packages/3.19/FileSetExperiment)* will be useful for your research. Please cite the package accordingly:

( add citation here; using `citation` causes pkgdown errors ) 

# Quick start to using `FileSetExperiment`


``` r
library("FileSetExperiment")
```

# Reproducibility

This package was developed using *[biocthis](https://bioconductor.org/packages/3.19/biocthis)*.

Code for creating the vignette


``` r
## Create the vignette
library("rmarkdown")
system.time(render("FileSetExperiment.Rmd", "BiocStyle::html_document"))

## Extract the R code
library("knitr")
knit("FileSetExperiment.Rmd", tangle = TRUE)
```

Date the vignette was generated.


```
#  [1] "2024-08-15 17:54:19 EDT"
```

Wallclock time spent generating the vignette.


```
#  Time difference of 0.025 secs
```

`R` session information.


```
#  ─ Session info ───────────────────────────────────────────────────────────────
#   setting  value
#   version  R version 4.4.1 (2024-06-14)
#   os       Ubuntu 22.04.4 LTS
#   system   x86_64, linux-gnu
#   ui       X11
#   language (EN)
#   collate  en_US.UTF-8
#   ctype    en_US.UTF-8
#   tz       America/Detroit
#   date     2024-08-15
#   pandoc   2.9.2.1 @ /usr/bin/ (via rmarkdown)
#  
#  ─ Packages ───────────────────────────────────────────────────────────────────
#   ! package                * version   date (UTC) lib source
#     abind                    1.4-5     2016-07-21 [2] RSPM (R 4.2.0)
#     alabaster              * 1.4.0     2024-04-30 [1] Bioconductor 3.19 (R 4.4.1)
#     alabaster.base         * 1.2.1     2023-11-06 [1] Bioconductor
#     alabaster.bumpy          1.2.0     2023-10-24 [1] Bioconductor
#     alabaster.mae            1.2.0     2023-10-24 [1] Bioconductor
#     alabaster.matrix         1.2.0     2023-10-24 [1] Bioconductor
#     alabaster.ranges         1.2.0     2023-10-24 [1] Bioconductor
#     alabaster.sce            1.2.0     2023-10-24 [1] Bioconductor
#     alabaster.schemas        1.2.0     2023-10-24 [1] Bioconductor
#     alabaster.se             1.2.0     2023-10-24 [1] Bioconductor
#     alabaster.spatial        1.2.0     2023-10-24 [1] Bioconductor
#     alabaster.string         1.2.0     2023-10-24 [1] Bioconductor
#     alabaster.vcf            1.2.0     2023-10-24 [1] Bioconductor
#     AnnotationDbi            1.64.1    2023-11-03 [1] Bioconductor
#     AnnotationHub          * 3.10.1    2024-04-05 [1] Bioconductor 3.18 (R 4.3.1)
#     askpass                  1.2.0     2023-09-03 [1] CRAN (R 4.3.1)
#     backports                1.5.0     2024-05-23 [2] RSPM (R 4.4.0)
#     bibtex                   0.5.1     2023-01-26 [2] RSPM (R 4.2.0)
#     Biobase                * 2.62.0    2023-10-24 [1] Bioconductor
#     BiocFileCache          * 2.10.2    2024-03-27 [1] Bioconductor 3.18 (R 4.3.1)
#     BiocGenerics           * 0.48.1    2023-11-01 [1] Bioconductor
#     BiocIO                   1.12.0    2023-10-24 [1] Bioconductor
#     BiocManager            * 1.30.22   2023-08-08 [1] CRAN (R 4.3.1)
#     BiocParallel             1.36.0    2023-10-24 [1] Bioconductor
#     BiocStyle              * 2.30.0    2023-10-24 [1] Bioconductor
#     biocthis                 1.14.0    2024-04-30 [1] Bioconductor 3.19 (R 4.4.1)
#     BiocVersion              3.19.1    2024-04-17 [1] Bioconductor 3.19 (R 4.4.1)
#     biomaRt                  2.58.2    2024-01-30 [1] Bioconductor 3.18 (R 4.3.1)
#     Biostrings               2.70.3    2024-03-13 [1] Bioconductor 3.18 (R 4.3.1)
#     bit                      4.0.5     2022-11-15 [2] RSPM (R 4.2.0)
#     bit64                    4.0.5     2020-08-30 [2] RSPM (R 4.2.0)
#     bitops                   1.0-7     2021-04-24 [1] CRAN (R 4.2.1)
#     blob                     1.2.4     2023-03-17 [2] RSPM (R 4.2.0)
#     bookdown                 0.40      2024-07-02 [2] RSPM (R 4.4.0)
#     brio                     1.1.5     2024-04-24 [2] RSPM (R 4.3.0)
#     BSgenome                 1.70.2    2024-02-08 [1] Bioconductor 3.18 (R 4.3.1)
#     bslib                    0.8.0     2024-07-29 [2] RSPM (R 4.4.0)
#     bspm                     0.5.7     2024-04-10 [1] CRAN (R 4.4.1)
#     BumpyMatrix              1.10.0    2023-10-24 [1] Bioconductor
#     cachem                   1.1.0     2024-05-16 [2] RSPM (R 4.4.0)
#     callr                    3.7.6     2024-03-25 [1] CRAN (R 4.3.1)
#     cli                      3.6.2     2023-12-11 [1] CRAN (R 4.3.1)
#     codetools                0.2-20    2024-03-31 [2] RSPM (R 4.3.0)
#     colorout               * 1.2-2     2023-05-20 [1] Github (jalvesaq/colorout@79931fd)
#     colorspace               2.1-1     2024-07-26 [2] RSPM (R 4.4.0)
#     crayon                   1.5.3     2024-06-20 [2] RSPM (R 4.4.0)
#     credentials              2.0.1     2023-09-06 [2] RSPM (R 4.3.0)
#     curl                     5.2.1     2024-03-01 [1] CRAN (R 4.3.1)
#     DBI                      1.2.3     2024-06-02 [2] RSPM (R 4.4.0)
#     dbplyr                 * 2.5.0     2024-03-19 [2] RSPM (R 4.3.0)
#     DelayedArray             0.28.0    2023-10-24 [1] Bioconductor
#     desc                     1.4.3     2023-12-10 [1] CRAN (R 4.3.1)
#     devtools                 2.4.5     2022-10-11 [2] RSPM (R 4.2.0)
#     digest                   0.6.35    2024-03-11 [1] CRAN (R 4.3.1)
#     downlit                  0.4.4     2024-06-10 [2] RSPM (R 4.4.0)
#     dplyr                  * 1.1.4     2023-11-17 [1] CRAN (R 4.3.1)
#     ellipsis                 0.3.2     2021-04-29 [2] RSPM (R 4.2.0)
#     evaluate                 0.24.0    2024-06-10 [2] RSPM (R 4.4.0)
#     ExperimentHub          * 2.10.0    2023-10-24 [1] Bioconductor
#     fansi                    1.0.6     2023-12-08 [1] CRAN (R 4.3.1)
#     fastmap                  1.2.0     2024-05-15 [2] RSPM (R 4.4.0)
#     filelock                 1.0.3     2023-12-11 [1] CRAN (R 4.3.1)
#   P FileSetExperiment      * 0.99.0    2024-08-15 [?] Bioconductor
#     fontawesome              0.5.2     2023-08-19 [2] RSPM (R 4.2.0)
#     forcats                * 1.0.0     2023-01-29 [2] RSPM (R 4.2.0)
#     fs                       1.6.3     2023-07-20 [1] CRAN (R 4.3.1)
#     generics                 0.1.3     2022-07-05 [1] CRAN (R 4.3.1)
#     GenomeInfoDb           * 1.38.8    2024-03-15 [1] Bioconductor 3.18 (R 4.3.1)
#     GenomeInfoDbData         1.2.11    2023-10-31 [1] Bioconductor
#     GenomicAlignments        1.38.2    2024-01-16 [1] Bioconductor 3.18 (R 4.3.1)
#     GenomicFeatures          1.54.4    2024-03-13 [1] Bioconductor 3.18 (R 4.3.1)
#     GenomicRanges          * 1.54.1    2023-10-29 [1] Bioconductor
#     gert                     2.1.0     2024-07-19 [2] RSPM (R 4.4.0)
#     ggplot2                * 3.5.1     2024-04-23 [2] RSPM (R 4.3.0)
#     gh                       1.4.1     2024-03-28 [2] RSPM (R 4.3.0)
#     gitcreds               * 0.1.2     2022-09-08 [2] RSPM (R 4.2.0)
#     glue                     1.7.0     2024-01-09 [1] CRAN (R 4.3.1)
#     gtable                   0.3.5     2024-04-22 [2] RSPM (R 4.3.0)
#     gtools                 * 3.9.5     2023-11-20 [2] RSPM (R 4.3.0)
#     HDF5Array                1.32.1    2024-08-11 [1] Bioconductor 3.19 (R 4.4.1)
#     highr                    0.11      2024-05-26 [2] RSPM (R 4.4.0)
#     hms                      1.1.3     2023-03-21 [2] RSPM (R 4.2.0)
#     htmltools                0.5.8.1   2024-04-04 [2] RSPM (R 4.3.0)
#     htmlwidgets              1.6.4     2023-12-06 [2] RSPM (R 4.3.0)
#     httpuv                   1.6.15    2024-03-26 [1] CRAN (R 4.3.1)
#     httr                     1.4.7     2023-08-15 [2] RSPM (R 4.2.0)
#     httr2                    1.0.2     2024-07-16 [2] RSPM (R 4.4.0)
#     interactiveDisplayBase   1.40.0    2023-10-24 [1] Bioconductor
#     IRanges                * 2.36.0    2023-10-24 [1] Bioconductor
#     jquerylib                0.1.4     2021-04-26 [2] RSPM (R 4.3.2)
#     jsonlite                 1.8.8     2023-12-04 [1] CRAN (R 4.3.1)
#     KEGGREST                 1.42.0    2023-10-24 [1] Bioconductor
#     knitr                    1.46      2024-04-06 [1] CRAN (R 4.3.1)
#     later                    1.3.2     2023-12-06 [2] RSPM (R 4.3.0)
#     lattice                  0.22-6    2024-03-20 [2] RSPM (R 4.3.0)
#     lifecycle                1.0.4     2023-11-07 [1] CRAN (R 4.3.1)
#     lubridate              * 1.9.3     2023-09-27 [2] RSPM (R 4.3.0)
#     magick                   2.8.4     2024-07-14 [2] RSPM (R 4.4.0)
#     magrittr                 2.0.3     2022-03-30 [1] CRAN (R 4.2.1)
#     Matrix                   1.7-0     2024-04-26 [2] RSPM (R 4.4.0)
#     MatrixGenerics         * 1.14.0    2023-10-24 [1] Bioconductor
#     matrixStats            * 1.3.0     2024-04-11 [1] CRAN (R 4.3.1)
#     memoise                  2.0.1     2021-11-26 [2] RSPM (R 4.2.0)
#     mime                     0.12      2021-09-28 [2] RSPM (R 4.2.0)
#     miniUI                   0.1.1.1   2018-05-18 [2] RSPM (R 4.2.0)
#     MultiAssayExperiment     1.28.0    2023-10-24 [1] Bioconductor
#     munsell                  0.5.1     2024-04-01 [2] RSPM (R 4.3.0)
#     nvimcom                * 0.9-128   2024-07-24 [1] local
#     openssl                  2.2.0     2024-05-16 [2] RSPM (R 4.4.0)
#     pillar                   1.9.0     2023-03-22 [1] CRAN (R 4.3.1)
#     pkgbuild                 1.4.4     2024-03-17 [1] CRAN (R 4.3.1)
#     pkgconfig                2.0.3     2019-09-22 [1] CRAN (R 4.3.1)
#     pkgdown                  2.1.0     2024-07-06 [2] RSPM (R 4.4.0)
#     pkgload                  1.4.0     2024-06-28 [2] RSPM (R 4.4.0)
#     plyr                     1.8.9     2023-10-02 [2] RSPM (R 4.3.0)
#     png                      0.1-8     2022-11-29 [2] RSPM (R 4.2.0)
#     preprocessCore           1.64.0    2023-10-24 [1] Bioconductor
#     prettyunits              1.2.0     2023-09-24 [2] RSPM (R 4.3.0)
#     processx                 3.8.4     2024-03-16 [1] CRAN (R 4.3.1)
#     profvis                  0.3.8     2023-05-02 [2] RSPM (R 4.2.0)
#     progress                 1.2.3     2023-12-06 [2] RSPM (R 4.3.0)
#     promises                 1.3.0     2024-04-05 [2] RSPM (R 4.3.0)
#     ps                       1.7.6     2024-01-18 [1] CRAN (R 4.3.1)
#     purrr                  * 1.0.2     2023-08-10 [2] RSPM (R 4.2.0)
#     R.cache                  0.16.0    2022-07-21 [2] RSPM (R 4.2.0)
#     R.methodsS3              1.8.2     2022-06-13 [2] RSPM (R 4.2.0)
#     R.oo                     1.26.0    2024-01-24 [2] RSPM (R 4.3.0)
#     R.utils                  2.12.3    2023-11-18 [2] RSPM (R 4.3.0)
#     R6                       2.5.1     2021-08-19 [1] CRAN (R 4.3.1)
#     rappdirs                 0.3.3     2021-01-31 [2] RSPM (R 4.2.0)
#     RColorBrewer             1.1-3     2022-04-03 [2] RSPM (R 4.2.0)
#     Rcpp                     1.0.13    2024-07-17 [1] CRAN (R 4.4.1)
#     RCurl                    1.98-1.16 2024-07-11 [2] RSPM (R 4.4.0)
#     readr                  * 2.1.5     2024-01-10 [2] RSPM (R 4.3.0)
#     RefManageR             * 1.4.0     2022-09-30 [2] RSPM (R 4.2.0)
#     remotes                  2.5.0     2024-03-17 [2] RSPM (R 4.3.0)
#     reshape2                 1.4.4     2020-04-09 [2] RSPM (R 4.2.0)
#     restfulr                 0.0.15    2022-06-16 [2] RSPM (R 4.2.0)
#     rhdf5                    2.46.1    2023-11-29 [1] Bioconductor 3.18 (R 4.3.1)
#     rhdf5filters             1.14.1    2023-11-06 [1] Bioconductor
#     Rhdf5lib                 1.24.2    2024-02-07 [1] Bioconductor 3.18 (R 4.3.1)
#     rjson                    0.2.21    2022-01-09 [2] RSPM (R 4.2.0)
#     rlang                    1.1.3     2024-01-10 [1] CRAN (R 4.3.1)
#     rmarkdown                2.27      2024-05-17 [2] RSPM (R 4.4.0)
#     roxygen2                 7.3.2     2024-06-28 [2] RSPM (R 4.4.0)
#     rprojroot                2.0.4     2023-11-05 [2] RSPM (R 4.3.0)
#     Rsamtools                2.18.0    2023-10-24 [1] Bioconductor
#     RSQLite                  2.3.7     2024-05-27 [2] RSPM (R 4.4.0)
#     rstudioapi               0.16.0    2024-03-24 [2] RSPM (R 4.3.0)
#     rtracklayer              1.62.0    2023-10-24 [1] Bioconductor
#     S4Arrays                 1.2.1     2024-03-04 [1] Bioconductor 3.18 (R 4.3.1)
#     S4Vectors              * 0.40.2    2023-11-23 [1] Bioconductor 3.18 (R 4.3.1)
#     S7                     * 0.1.1     2023-09-17 [2] RSPM (R 4.3.0)
#     sass                     0.4.9     2024-03-15 [2] RSPM (R 4.3.0)
#     scales                   1.3.0     2023-11-28 [2] RSPM (R 4.3.0)
#     sesame                 * 1.21.2    2024-01-01 [1] Bioconductor
#     sesameData             * 1.21.0    2024-01-01 [1] Bioconductor
#     sessioninfo            * 1.2.2     2021-12-06 [2] RSPM (R 4.2.0)
#     shiny                    1.9.1     2024-08-01 [2] CRAN (R 4.4.1)
#     SingleCellExperiment     1.24.0    2023-10-24 [1] Bioconductor
#     skeletor               * 1.0.4     2017-04-09 [2] RSPM (R 4.2.0)
#     SparseArray              1.2.4     2024-02-11 [1] Bioconductor 3.18 (R 4.3.1)
#     SpatialExperiment        1.12.0    2023-10-24 [1] Bioconductor
#     stringi                  1.8.4     2024-05-06 [2] RSPM (R 4.4.0)
#     stringr                * 1.5.1     2023-11-14 [2] RSPM (R 4.3.0)
#     styler                   1.10.3    2024-04-07 [2] RSPM (R 4.3.0)
#     SummarizedExperiment   * 1.32.0    2023-10-24 [1] Bioconductor
#     sys                      3.4.2     2023-05-23 [1] CRAN (R 4.3.1)
#     testthat               * 3.2.1.1   2024-04-14 [2] RSPM (R 4.3.0)
#     tibble                 * 3.2.1     2023-03-20 [1] CRAN (R 4.3.1)
#     tidyr                  * 1.3.1     2024-01-24 [2] RSPM (R 4.3.0)
#     tidyselect               1.2.1     2024-03-11 [1] CRAN (R 4.3.1)
#     tidyverse              * 2.0.0     2023-02-22 [2] RSPM (R 4.2.0)
#     timechange               0.3.0     2024-01-18 [2] RSPM (R 4.3.0)
#     tzdb                     0.4.0     2023-05-12 [2] RSPM (R 4.2.0)
#     urlchecker               1.0.1     2021-11-30 [2] RSPM (R 4.2.0)
#     useful                 * 1.2.6.1   2023-10-24 [2] RSPM (R 4.3.0)
#     usethis                * 3.0.0     2024-07-29 [2] RSPM (R 4.4.0)
#     utf8                     1.2.4     2023-10-22 [1] CRAN (R 4.3.1)
#     VariantAnnotation        1.48.1    2023-11-15 [1] Bioconductor
#     vctrs                    0.6.5     2023-12-01 [1] CRAN (R 4.3.1)
#     wheatmap                 0.2.0     2022-02-27 [2] RSPM (R 4.2.0)
#     whisker                  0.4.1     2022-12-05 [2] RSPM (R 4.2.0)
#     withr                    3.0.0     2024-01-16 [1] CRAN (R 4.3.1)
#     xfun                     0.46      2024-07-18 [1] CRAN (R 4.4.1)
#     XML                      3.99-0.17 2024-06-25 [2] RSPM (R 4.4.0)
#     xml2                     1.3.6     2023-12-04 [2] RSPM (R 4.3.0)
#     xtable                   1.8-4     2019-04-21 [2] CRAN (R 4.0.1)
#     XVector                  0.42.0    2023-10-24 [1] Bioconductor
#     yaml                     2.3.10    2024-07-26 [2] RSPM (R 4.4.0)
#     zlibbioc                 1.48.2    2024-03-13 [1] Bioconductor 3.18 (R 4.3.1)
#  
#   [1] /usr/local/lib/R/site-library
#   [2] /usr/lib/R/site-library
#   [3] /usr/lib/R/library
#  
#   P ── Loaded and on-disk path mismatch.
#  
#  ──────────────────────────────────────────────────────────────────────────────
```

# Bibliography

Dropped until it stops choking pkgdown
