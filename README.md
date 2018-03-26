
<!-- README.md is generated from README.Rmd. Please edit that file -->

![](longurl.png)

[![Build
Status](https://travis-ci.org/hrbrmstr/longurl.svg)](https://travis-ci.org/hrbrmstr/longurl)
[![Project Status: Active - The project has reached a stable, usable
state and is being actively
developed.](http://www.repostatus.org/badges/0.1.0/active.svg)](http://www.repostatus.org/#active)
[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/longurl)](http://cran.r-project.org/web/packages/longurl)
![downloads](http://cranlogs.r-pkg.org/badges/grand-total/longurl)

# longurl

Tools expand vectors of short URLs into long URLs.

## Description

This does a bit more than
[decode\_short\_url](https://github.com/geoffjentry/twitteR/blob/master/R/utils.R#L22-L31)
from the [twitteR](https://github.com/geoffjentry/twitteR) package since
it:

  - doesn’t rely on a URL expansion API (anymore)
  - has options for progress bars & display of warnings during URL
    checks
  - works with a vector of URLs
  - returns `tbl_df`s that include HTTP status code for final (expanded)
    URL

Tools are provided to expand vectors of short URLs into long ‘URLs’. No
‘API’ services are used, which may mean that this operates more slowly
than ‘API’ services do (since they usually cache results of expansions
that every user of the service requests). You can setup your own caching
layer with the ‘memoise’ package if you wish to have a speedup during
single sessions or add larger dependencies, such as ‘Redis’, to gain a
longer-term performance boost at the expense of added complexity.

## What’s inside the tin?

The following functions are implemented:

  - `expand_urls`: Expand a vector of (short) URLs

## Installation

``` r
devtools::install_github("hrbrmstr/longurl")
# OR
install.packages("longurl")
```

## Usage

``` r
library(longurl)
library(dplyr)

# current verison
packageVersion("longurl")
#> [1] '0.3.2'

test_urls <- c("http://t.co/D4C7aWYIiA",
               "1.usa.gov/1J6GNoW",
               "ift.tt/1L2Llfr",
               "bit.ly/1GPr5w5",
               "http://l.dds.ec/1da152x",
               "http://l.rud.is/seven",
               "qrp://not a valid url/")

expand_urls(test_urls) %>% 
  select(orig_url, status_code, expanded_url) %>% 
  knitr::kable()
```

| orig\_url                 | status\_code | expanded\_url                                                                                              |
| :------------------------ | -----------: | :--------------------------------------------------------------------------------------------------------- |
| <http://t.co/D4C7aWYIiA>  |           NA | NA                                                                                                         |
| 1.usa.gov/1J6GNoW         |          410 | <https://www.democrats.senate.gov/2015/06/22/schedule-for-monday-june-22-2015/>                            |
| ift.tt/1L2Llfr            |          200 | <https://ifttt.com/applet_embeds/299814p/image?width=660&height=340>                                       |
| bit.ly/1GPr5w5            |          200 | <https://s3.amazonaws.com/features.ifttt.com/blog_images/Channels/Weebly+final+banner+with+IFTTT+logo.png> |
| <http://l.dds.ec/1da152x> |           NA | NA                                                                                                         |
| <http://l.rud.is/seven>   |          404 | <http://l.rud.is/seven>                                                                                    |
| qrp://not a valid url/    |           NA | NA                                                                                                         |

### Test Results

``` r
library(longurl)
library(testthat)

date()
#> [1] "Mon Mar 26 16:30:03 2018"

test_dir("tests/")
#> ✔ | OK F W S | Context
#> ══ testthat results  ═══════════════════════════════════════════════════════════════
#> OK: 4 SKIPPED: 0 FAILED: 0
#> 
#> ══ Results ═════════════════════════════════════════════════════════════════════════
#> Duration: 5.4 s
#> 
#> OK:       0
#> Failed:   0
#> Warnings: 0
#> Skipped:  0
```

### Code of Conduct

Please note that this project is released with a [Contributor Code of
Conduct](CONDUCT.md). By participating in this project you agree to
abide by its terms.
