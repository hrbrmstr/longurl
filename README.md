
<!-- README.md is generated from README.Rmd. Please edit that file -->
![](longurl.png)

[![Build Status](https://travis-ci.org/hrbrmstr/longurl.svg)](https://travis-ci.org/hrbrmstr/longurl) [![Project Status: Active - The project has reached a stable, usable state and is being actively developed.](http://www.repostatus.org/badges/0.1.0/active.svg)](http://www.repostatus.org/#active) [![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/longurl)](http://cran.r-project.org/web/packages/longurl) ![downloads](http://cranlogs.r-pkg.org/badges/grand-total/longurl)

longurl : Tools expand vectors of short URLs into long URLs.

This does a bit more than [decode\_short\_url](https://github.com/geoffjentry/twitteR/blob/master/R/utils.R#L22-L31) from the [twitteR](https://github.com/geoffjentry/twitteR) package since it:

-   doesn't rely on a URL expansion API (anymore)
-   has an option for progress bars
-   works with a vector of URLs
-   returns `tbl_df`s that include HTTP status code for final (expanded) URL

The following functions are implemented:

-   `expand_urls`: Expand a vector of (short) URLs

The following data sets are included:

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

# current verison
packageVersion("longurl")
#> [1] '0.3.0'

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

| orig\_url                 |  status\_code| expanded\_url                                                                                                                                                                                        |
|:--------------------------|-------------:|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <http://t.co/D4C7aWYIiA>  |           200| <https://www.wired.com/2015/06/airlines-security-hole-grounded-polish-planes/>                                                                                                                       |
| 1.usa.gov/1J6GNoW         |           200| <https://democrats.senate.gov/2015/06/22/schedule-for-monday-june-22-2015/>                                                                                                                          |
| ift.tt/1L2Llfr            |           200| <https://ifttt.com/recipe_embed_img/299814>                                                                                                                                                          |
| bit.ly/1GPr5w5            |           200| <https://s3.amazonaws.com/features.ifttt.com/blog_images/Channels/Weebly+final+banner+with+IFTTT+logo.png>                                                                                           |
| <http://l.dds.ec/1da152x> |           200| <http://datadrivensecurity.info/blog/posts/2015/Jun/survey-on-machine-learning-in-intrusion-detection-systems/?utm_content=buffere95ec&utm_medium=social&utm_source=twitter.com&utm_campaign=buffer> |
| <http://l.rud.is/seven>   |           404| <http://l.rud.is/seven>                                                                                                                                                                              |
| qrp://not a valid url/    |            NA| NA                                                                                                                                                                                                   |

### Test Results

``` r
library(longurl)
library(testthat)

date()
#> [1] "Sat Dec 17 13:37:04 2016"

test_dir("tests/")
#> testthat results ========================================================================================================================================================================================
#> OK: 2 SKIPPED: 0 FAILED: 0
#> 
#> DONE ===================================================================================================================================================================================================
```

### Code of Conduct

Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
