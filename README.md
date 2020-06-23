
[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Signed
by](https://img.shields.io/badge/Keybase-Verified-brightgreen.svg)](https://keybase.io/hrbrmstr)
![Signed commit
%](https://img.shields.io/badge/Signed_Commits-100%25-lightgrey.svg)
[![Linux build
Status](https://travis-ci.org/hrbrmstr/longurl.svg?branch=master)](https://travis-ci.org/hrbrmstr/longurl)
[![Coverage
Status](https://codecov.io/gh/hrbrmstr/longurl/branch/master/graph/badge.svg)](https://codecov.io/gh/hrbrmstr/longurl)
[![cran
checks](https://cranchecks.info/badges/worst/longurl)](https://cranchecks.info/pkgs/longurl)
[![CRAN
status](https://www.r-pkg.org/badges/version/longurl)](https://www.r-pkg.org/pkg/longurl)
![Minimal R
Version](https://img.shields.io/badge/R%3E%3D-3.6.0-blue.svg)
![License](https://img.shields.io/badge/License-MIT-blue.svg)

# longurl

Expand Short ‘URLs’

## Description

Tools are provided to expand vectors of short URLs into long ‘URLs’. No
‘API’ services are used, which may mean that this operates more slowly
than ‘API’ services do (since they usually cache results of expansions
that every user of the service requests). You can setup your own caching
layer with the ‘memoise’ package if you wish to have a speedup during
single sessions or add larger dependencies, such as ‘Redis’, to gain a
longer-term performance boost at the expense of added complexity.

## What’s Inside The Tin

The following functions are implemented:

  - `expand_urls`: Expand a vector of (short) URLs using

## Installation

``` r
install.packages("longurl", repos = c("https://cinc.rud.is", "https://cloud.r-project.org/"))
# or
remotes::install_git("https://git.rud.is/hrbrmstr/longurl.git")
# or
remotes::install_git("https://git.sr.ht/~hrbrmstr/longurl")
# or
remotes::install_gitlab("hrbrmstr/longurl")
# or
remotes::install_github("hrbrmstr/longurl")
```

NOTE: To use the ‘remotes’ install options you will need to have the
[{remotes} package](https://github.com/r-lib/remotes) installed.

## Usage

``` r
library(longurl)
library(magrittr)

# current version
packageVersion("longurl")
## [1] '0.3.3'
```

``` r
c(
  "http://t.co/D4C7aWYIiA",
  "1.usa.gov/1J6GNoW",
  "ift.tt/1L2Llfr",
  "bit.ly/1GPr5w5",
  "http://l.dds.ec/1da152x",
  "http://l.rud.is/seven",
  "qrp://not a valid url/"
) -> test_urls

expand_urls(test_urls) %>% 
  dplyr::select(orig_url, status_code, expanded_url) %>% 
  knitr::kable()
```

| orig\_url                 | status\_code | expanded\_url                                                                                              |
| :------------------------ | :----------- | :--------------------------------------------------------------------------------------------------------- |
| <http://t.co/D4C7aWYIiA>  | 200          | <https://www.wired.com/2015/06/airlines-security-hole-grounded-polish-planes/>                             |
| 1.usa.gov/1J6GNoW         | 404          | <https://1.usa.gov/1J6GNoW>                                                                                |
| ift.tt/1L2Llfr            | 200          | <https://ifttt.com/applet_embeds/299814p/image?width=660&height=340>                                       |
| bit.ly/1GPr5w5            | 200          | <https://s3.amazonaws.com/features.ifttt.com/blog_images/Channels/Weebly+final+banner+with+IFTTT+logo.png> |
| <http://l.dds.ec/1da152x> | 200          | <http://l.dds.ec/1da152x>                                                                                  |
| <http://l.rud.is/seven>   | 404          | <http://l.rud.is/seven>                                                                                    |
| qrp://not a valid url/    | NA           | NA                                                                                                         |

## longurl Metrics

| Lang | \# Files | (%) | LoC |  (%) | Blank lines |  (%) | \# Lines |  (%) |
| :--- | -------: | --: | --: | ---: | ----------: | ---: | -------: | ---: |
| R    |        4 | 0.8 | 110 | 0.84 |          20 | 0.54 |       51 | 0.65 |
| Rmd  |        1 | 0.2 |  21 | 0.16 |          17 | 0.46 |       27 | 0.35 |

## Code of Conduct

Please note that this project is released with a Contributor Code of
Conduct. By participating in this project you agree to abide by its
terms.
