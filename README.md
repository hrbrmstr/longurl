<!-- README.md is generated from README.Rmd. Please edit that file -->
![](longurl.png)

[![Build Status](https://travis-ci.org/hrbrmstr/longurl.svg)](https://travis-ci.org/hrbrmstr/longurl) [![Project Status: Active - The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/0.1.0/active.svg)](http://www.repostatus.org/#active) [![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/longurl)](http://cran.r-project.org/web/packages/longurl) ![downloads](http://cranlogs.r-pkg.org/badges/grand-total/longurl)

longurl : Expand Short URLs using the 'URL-Expander' API

This does a bit more than [decode\_short\_url](https://github.com/geoffjentry/twitteR/blob/master/R/utils.R#L22-L31) from the [twitteR](https://github.com/geoffjentry/twitteR) package since it:

-   has an option to do a post-expand check with a `HEAD` request to ensure the resource exists (useful when you think longurl just failed to expand)
-   has an option to warn on expansion issues
-   has an option for progress bars
-   works with a vector of URLs
-   returns `data_frame`s

The following functions are implemented:

-   `expand_urls`: Expand a vector of (short) URLs using the longurl service

The following data sets are included:

### News

-   Version `0.2.0` - See NEWS.md
-   Version `0.1.0` released ([CRAN](http://cran.r-project.org/web/packages/longurl/index.html)) ([GitHub](https://github.com/hrbrmstr/longurl/archive/v0.1.0.zip))
-   Version `0.0.0.9000` released

### Installation

``` r
devtools::install_github("hrbrmstr/longurl")
# OR
install.packages("longurl")
```

### Usage

``` r
library(longurl)
library(dplyr)
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union

# current verison
packageVersion("longurl")
#> [1] '0.2.0'

test_urls <- c("http://t.co/D4C7aWYIiA",
               "1.usa.gov/1J6GNoW",
               "ift.tt/1L2Llfr",
               "bit.ly/1GPr5w5",
               "http://l.dds.ec/1da152x",
               "http://l.rud.is/seven")

head(expand_urls(test_urls), 2)
#> # A tibble: 2 × 2
#>                 orig_url                                                                 expanded_url
#>                    <chr>                                                                        <chr>
#> 1 http://t.co/D4C7aWYIiA https://www.wired.com/2015/06/airlines-security-hole-grounded-polish-planes/
#> 2      1.usa.gov/1J6GNoW    https://democrats.senate.gov/2015/06/22/schedule-for-monday-june-22-2015/
```

### Test Results

``` r
library(longurl)
library(testthat)
#> 
#> Attaching package: 'testthat'
#> The following object is masked from 'package:dplyr':
#> 
#>     matches

date()
#> [1] "Wed Aug 31 17:44:45 2016"

test_dir("tests/")
#> testthat results ========================================================================================================================================================================================
#> OK: 1 SKIPPED: 0 FAILED: 0
#> 
#> DONE ===================================================================================================================================================================================================
```

### Code of Conduct

Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
