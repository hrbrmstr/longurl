<!-- README.md is generated from README.Rmd. Please edit that file -->
![](longurl.png)

[![Build Status](https://travis-ci.org/hrbrmstr/longurl.svg)](https://travis-ci.org/hrbrmstr/longurl) [![Project Status: Active - The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/0.1.0/active.svg)](http://www.repostatus.org/#active) [![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/longurl)](http://cran.r-project.org/web/packages/longurl) ![downloads](http://cranlogs.r-pkg.org/badges/grand-total/longurl)

longurl : Expand Short URLs using the 'LongURL' API

This does a bit more than [decode\_short\_url](https://github.com/geoffjentry/twitteR/blob/master/R/utils.R#L22-L31) from the [twitteR](https://github.com/geoffjentry/twitteR) package since it:

-   enables you to get a list of what shortening services [longurl](http://longurl.org/) knows about
-   has an option to do a post-expand check with a `HEAD` request to ensure the resource exists (useful when you think longurl just failed to expand)
-   has an option to warn on expansion issues
-   has an option for progress bars
-   works with a vector of URLs
-   returns `data_frame`s

The following functions are implemented:

-   `expand_urls`: Expand a vector of (short) URLs using the longurl service
-   `known_services`: Retrieve all the URL shortener services known to the longurl API

The following data sets are included:

### News

-   Version `0.0.0.9000` released
-   Version `0.1.0` released ([CRAN](http://cran.r-project.org/web/packages/longurl/index.html)) ([GitHub](https://github.com/hrbrmstr/longurl/archive/v0.1.0.zip))

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
#> 
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> 
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union

# current verison
packageVersion("longurl")
#> [1] '0.1.0.9999'

test_urls <- c("http://t.co/D4C7aWYIiA",
               "1.usa.gov/1J6GNoW",
               "ift.tt/1L2Llfr",
               "bit.ly/1GPr5w5",
               "http://l.dds.ec/1da152x",
               "http://l.rud.is/seven")

head(expand_urls(test_urls), 2)
#> Source: local data frame [2 x 2]
#> 
#>                 orig_url                                                                expanded_url
#> 1 http://t.co/D4C7aWYIiA http://www.wired.com/2015/06/airlines-security-hole-grounded-polish-planes/
#> 2      1.usa.gov/1J6GNoW    http://democrats.senate.gov/2015/06/22/schedule-for-monday-june-22-2015/

svcs <- known_services()
filter(svcs, regex != "")
#> Source: local data frame [1 x 2]
#> 
#>     domain                            regex
#> 1 digg.com http:\\/\\/digg\\.com\\/[^\\/]+$
```

### Test Results

``` r
library(longurl)
library(testthat)

date()
#> [1] "Wed Jul  1 19:22:19 2015"

test_dir("tests/")
#> basic functionality : ..
#> 
#> You are a coding rockstar!
```

### Code of Conduct

Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
