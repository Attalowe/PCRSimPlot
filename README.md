PCRSimPlot
================

<!-- README.md is generated from README.Rmd. Please edit that file -->
<!-- `packagename` is extracted from the DESCRIPTION file -->
<!-- `gh_repo` is extracted via a special environment variable in GitHub Actions -->
<!-- README.md is generated from README.Rmd. Please edit that file -->

# PCRSimPlot : PCR Simulation and Plotting <img src="man/figures/logo.png" align="right" width="130"/>

<!-- badges: start -->

[![License:
MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![R-CMD-check](https://github.com/Attalowe/PCRSimPlot/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/Attalowe/PCRSimPlot/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/Attalowe/PCRSimPlot/branch/main/graph/badge.svg)](https://app.codecov.io/gh/Attalowe/PCRSimPlot?branch=main)
[![lifecycle-experimental](https://raw.githubusercontent.com/reconverse/reconverse.github.io/master/images/badge-experimental.svg)](https://www.reconverse.org/lifecycle.html#experimental)

<!-- badges: end -->

**PCRSimPlot** is an R package for simulating and plotting PCR
(Polymerase Chain Reaction) data. It includes functions for generating
PCR data from specified parameters and visualizing the results.

## Installation

You can install the development version of **PCRSimPlot** from
[GitHub](https://Attalowe.github.io/PCRSimPlot/).

``` r
if (!require("pak")) install.packages("pak")
pak::pak("Attalowe/PCRSimPlot")
library(PCRSimPlot)
```

## Overview of the functions in {PCRSimPlot}

- `simulate_pcr()`: simulates PCR data based on initial DNA
  concentration (`N0`), amplification efficiency (`E`), and a
  fluorescence threshold (`threshold`). The function returns a `list`
  with two elements:

1.  *pcr_data*: A data frame containing the simulated PCR data with
    columns Cycle, DNA, and Fluorescence.
2.  *Ct*: The cycle threshold (Ct) value at which the fluorescence
    exceeds the threshold.

### Example

``` r
result <- simulate_pcr(N0 = 10, E = 1.8, threshold = 10000)
head(result$pcr_data)
#>   Cycle      DNA Fluorescence
#> 1     1  10.0000     1012.832
#> 2     2  32.4000     1050.521
#> 3     3  58.3200     1094.132
#> 4     4 104.9760     1172.632
#> 5     5 188.9568     1313.932
#> 6     6 340.1222     1568.271
print(result$Ct)
#> [1] 10
```

- `plot_pcr()` Plots the simulated PCR data, showing fluorescence over
  cycles and the cycle threshold (Ct). \# Usage

``` r
plot_pcr(pcr_data, Ct)
```

Arguments:

pcr_data: A data frame containing the PCR data (typically from
simulate_pcr()). Ct: The cycle threshold (Ct) value. Returns:

A ggplot object visualizing the PCR data with a line plot of
fluorescence over cycles, including a vertical line indicating the Ct
valu

## Example

This is a basic example which shows you how to solve a common problem:

``` r

result <- simulate_pcr(N0 = 10, E = 1.8)
plot <- plot_pcr(result$pcr_data, result$Ct)
print(plot)
```

<img src="man/figures/README-unnamed-chunk-4-1.png" width="100%" />

### Lifecycle

This package is currently an *experimental*, as defined by the [RECON
software lifecycle](https://www.reconverse.org/lifecycle.html). This
means that it is functional, but interfaces and functionalities may
change over time, testing and documentation may be lacking.

### Contributions

Contributions are welcome via [pull
requests](https://github.com/%7B%7B%20gh_repo%20%7D%7D/pulls).

### Code of Conduct

Please note that the {{ packagename }} project is released with a
[Contributor Code of
Conduct](https://github.com/epiverse-trace/.github/blob/main/CODE_OF_CONDUCT.md).
By contributing to this project, you agree to abide by its terms.

## Citing this package

``` r
citation("PCRSimPlot")
#> To cite package 'PCRSimPlot' in publications use:
#> 
#>   Lowe A (2024). _PCRSimPlot: PCR Simulation and Plotting_.
#>   <https://Attalowe.github.io/PCRSimPlot/>.
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Manual{,
#>     title = {PCRSimPlot: PCR Simulation and Plotting},
#>     author = {Atta Lowe},
#>     year = {2024},
#>     url = {https://Attalowe.github.io/PCRSimPlot/},
#>   }
```
