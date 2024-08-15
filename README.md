
<!-- README.md is generated from README.Rmd. Please edit that file -->

# FileSetExperiment

<!-- badges: start -->

[![GitHub
issues](https://img.shields.io/github/issues/trichelab/FileSetExperiment)](https://github.com/trichelab/FileSetExperiment/issues)
[![GitHub
pulls](https://img.shields.io/github/issues-pr/trichelab/FileSetExperiment)](https://github.com/trichelab/FileSetExperiment/pulls)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![Bioc release
status](http://www.bioconductor.org/shields/build/release/bioc/FileSetExperiment.svg)](https://bioconductor.org/checkResults/release/bioc-LATEST/FileSetExperiment)
[![Bioc devel
status](http://www.bioconductor.org/shields/build/devel/bioc/FileSetExperiment.svg)](https://bioconductor.org/checkResults/devel/bioc-LATEST/FileSetExperiment)
[![Bioc downloads
rank](https://bioconductor.org/shields/downloads/release/FileSetExperiment.svg)](http://bioconductor.org/packages/stats/bioc/FileSetExperiment/)
[![Bioc
support](https://bioconductor.org/shields/posts/FileSetExperiment.svg)](https://support.bioconductor.org/tag/FileSetExperiment)
[![Bioc
history](https://bioconductor.org/shields/years-in-bioc/FileSetExperiment.svg)](https://bioconductor.org/packages/release/bioc/html/FileSetExperiment.html#since)
[![Bioc last
commit](https://bioconductor.org/shields/lastcommit/devel/bioc/FileSetExperiment.svg)](http://bioconductor.org/checkResults/devel/bioc-LATEST/FileSetExperiment/)
[![Bioc
dependencies](https://bioconductor.org/shields/dependencies/release/FileSetExperiment.svg)](https://bioconductor.org/packages/release/bioc/html/FileSetExperiment.html#since)
[![check-bioc](https://github.com/trichelab/FileSetExperiment/actions/workflows/check-bioc.yml/badge.svg)](https://github.com/trichelab/FileSetExperiment/actions/workflows/check-bioc.yml)
[![Codecov test
coverage](https://codecov.io/gh/trichelab/FileSetExperiment/graph/badge.svg)](https://app.codecov.io/gh/trichelab/FileSetExperiment)
<!-- badges: end -->

The goal of `FileSetExperiment` is to wrap sesame fileSet objects into a
SummarizedExperiment-like object, with the corresponding expected
features.

## Installation instructions

Get the latest stable `R` release from
[CRAN](http://cran.r-project.org/). Then install `FileSetExperiment`
from [Bioconductor](http://bioconductor.org/) using the following code:

``` r
if (!requireNamespace("BiocManager", quietly = TRUE)) {
    install.packages("BiocManager")
}

BiocManager::install("FileSetExperiment")
```

And the development version from
[GitHub](https://github.com/trichelab/FileSetExperiment) with:

``` r
BiocManager::install("trichelab/FileSetExperiment")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library("FileSetExperiment")
#> Loading required package: SummarizedExperiment
#> Loading required package: MatrixGenerics
#> Loading required package: matrixStats
#> 
#> Attaching package: 'MatrixGenerics'
#> The following objects are masked from 'package:matrixStats':
#> 
#>     colAlls, colAnyNAs, colAnys, colAvgsPerRowSet, colCollapse,
#>     colCounts, colCummaxs, colCummins, colCumprods, colCumsums,
#>     colDiffs, colIQRDiffs, colIQRs, colLogSumExps, colMadDiffs,
#>     colMads, colMaxs, colMeans2, colMedians, colMins, colOrderStats,
#>     colProds, colQuantiles, colRanges, colRanks, colSdDiffs, colSds,
#>     colSums2, colTabulates, colVarDiffs, colVars, colWeightedMads,
#>     colWeightedMeans, colWeightedMedians, colWeightedSds,
#>     colWeightedVars, rowAlls, rowAnyNAs, rowAnys, rowAvgsPerColSet,
#>     rowCollapse, rowCounts, rowCummaxs, rowCummins, rowCumprods,
#>     rowCumsums, rowDiffs, rowIQRDiffs, rowIQRs, rowLogSumExps,
#>     rowMadDiffs, rowMads, rowMaxs, rowMeans2, rowMedians, rowMins,
#>     rowOrderStats, rowProds, rowQuantiles, rowRanges, rowRanks,
#>     rowSdDiffs, rowSds, rowSums2, rowTabulates, rowVarDiffs, rowVars,
#>     rowWeightedMads, rowWeightedMeans, rowWeightedMedians,
#>     rowWeightedSds, rowWeightedVars
#> Loading required package: GenomicRanges
#> Loading required package: stats4
#> Loading required package: BiocGenerics
#> 
#> Attaching package: 'BiocGenerics'
#> The following objects are masked from 'package:stats':
#> 
#>     IQR, mad, sd, var, xtabs
#> The following objects are masked from 'package:base':
#> 
#>     anyDuplicated, aperm, append, as.data.frame, basename, cbind,
#>     colnames, dirname, do.call, duplicated, eval, evalq, Filter, Find,
#>     get, grep, grepl, intersect, is.unsorted, lapply, Map, mapply,
#>     match, mget, order, paste, pmax, pmax.int, pmin, pmin.int,
#>     Position, rank, rbind, Reduce, rownames, sapply, setdiff, sort,
#>     table, tapply, union, unique, unsplit, which.max, which.min
#> Loading required package: S4Vectors
#> 
#> Attaching package: 'S4Vectors'
#> The following object is masked from 'package:utils':
#> 
#>     findMatches
#> The following objects are masked from 'package:base':
#> 
#>     expand.grid, I, unname
#> Loading required package: IRanges
#> Loading required package: GenomeInfoDb
#> Loading required package: Biobase
#> Welcome to Bioconductor
#> 
#>     Vignettes contain introductory material; view with
#>     'browseVignettes()'. To cite Bioconductor, see
#>     'citation("Biobase")', and for packages 'citation("pkgname")'.
#> 
#> Attaching package: 'Biobase'
#> The following object is masked from 'package:MatrixGenerics':
#> 
#>     rowMedians
#> The following objects are masked from 'package:matrixStats':
#> 
#>     anyMissing, rowMedians
#> Loading required package: sesame
#> Loading required package: sesameData
#> Loading required package: ExperimentHub
#> Loading required package: AnnotationHub
#> Loading required package: BiocFileCache
#> Loading required package: dbplyr
#> 
#> Attaching package: 'AnnotationHub'
#> The following object is masked from 'package:Biobase':
#> 
#>     cache
#> Loading sesameData.
#> 
#> ----------------------------------------------------------
#> | SEnsible Step-wise Analysis of DNA MEthylation (SeSAMe)
#> | --------------------------------------------------------
#> | Please cache auxiliary data by "sesameDataCache()".
#> | This needs to be done only once per SeSAMe installation.
#> ----------------------------------------------------------
#> Loading required package: S7
```

``` r
## basic example code
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub\!

## Citation

Below is the citation output from using `citation('FileSetExperiment')`
in R. Please run this yourself to check for any updates on how to cite
**FileSetExperiment**.

``` r
print(citation("FileSetExperiment"), bibtex = TRUE)
#> To cite package 'FileSetExperiment' in publications use:
#> 
#>   trichelab (2024). _FileSetExperiment_.
#>   doi:10.18129/B9.bioc.FileSetExperiment
#>   <https://doi.org/10.18129/B9.bioc.FileSetExperiment>,
#>   https://github.com/trichelab/FileSetExperiment/FileSetExperiment - R
#>   package version 0.99.0,
#>   <http://www.bioconductor.org/packages/FileSetExperiment>.
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Manual{,
#>     title = {FileSetExperiment},
#>     author = {{trichelab}},
#>     year = {2024},
#>     url = {http://www.bioconductor.org/packages/FileSetExperiment},
#>     note = {https://github.com/trichelab/FileSetExperiment/FileSetExperiment - R package version 0.99.0},
#>     doi = {10.18129/B9.bioc.FileSetExperiment},
#>   }
#> 
#>   trichelab (2024). "Analysis of large cohorts with FileSeteExperiment
#>   objects." _bioRxiv_. doi:10.1101/TODO <https://doi.org/10.1101/TODO>,
#>   <https://www.biorxiv.org/content/10.1101/TODO>.
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Article{,
#>     title = {Analysis of large cohorts with FileSeteExperiment objects},
#>     author = {{trichelab}},
#>     year = {2024},
#>     journal = {bioRxiv},
#>     doi = {10.1101/TODO},
#>     url = {https://www.biorxiv.org/content/10.1101/TODO},
#>   }
```

Please note that the `FileSetExperiment` was only made possible thanks
to many other R and bioinformatics software authors, which are cited
either in the vignettes and/or the paper(s) describing this package.

## Code of Conduct

Please note that the `FileSetExperiment` project is released with a
[Contributor Code of
Conduct](http://bioconductor.org/about/code-of-conduct/). By
contributing to this project, you agree to abide by its terms.

## Development tools

  - Continuous code testing is possible thanks to [GitHub
    actions](https://www.tidyverse.org/blog/2020/04/usethis-1-6-0/)
    through *[usethis](https://CRAN.R-project.org/package=usethis)*,
    *[remotes](https://CRAN.R-project.org/package=remotes)*, and
    *[rcmdcheck](https://CRAN.R-project.org/package=rcmdcheck)*
    customized to use [Bioconductor’s docker
    containers](https://www.bioconductor.org/help/docker/) and
    *[BiocCheck](https://bioconductor.org/packages/3.19/BiocCheck)*.
  - Code coverage assessment is possible thanks to
    [codecov](https://codecov.io/gh) and
    *[covr](https://CRAN.R-project.org/package=covr)*.
  - The [documentation
    website](http://trichelab.github.io/FileSetExperiment) is
    automatically updated thanks to
    *[pkgdown](https://CRAN.R-project.org/package=pkgdown)*.
  - The code is styled automatically thanks to
    *[styler](https://CRAN.R-project.org/package=styler)*.
  - The documentation is formatted thanks to
    *[devtools](https://CRAN.R-project.org/package=devtools)* and
    *[roxygen2](https://CRAN.R-project.org/package=roxygen2)*.

For more details, check the `dev` directory.

This package was developed using
*[biocthis](https://bioconductor.org/packages/3.19/biocthis)*.
