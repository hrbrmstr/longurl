# the LongURL api requires the use of a custom user agent
LONGURL_USER_AGENT <- "longurl-rstats-pkg"

# this is the base endpoint for the LongURL API
LONGURL_ENDPOINT <- "http://urlex.org/json/%s"

#' Expand a vector of (short) URLs using the URL-Expander service
#'
#' Pass in a vector of URLs (ostensibly "short" URLs) and receive
#' a \code{data_frame} of the original URLs and expanded URLs via the
#' 'URL-Expander' service.
#'
#' @param urls_to_expand character vector of URLs
#' @param check run an extra \code{HEAD} request on the expanded URL to determine
#'        validity. This is an expensive operation, so recommended usage is to run
#'        this only on URLs that did not seem to expand.
#' @param warn show any warnings (API or otherwise) as messages
#' @param .progress display a progress bar (generally only useful in
#'        interactive sesions)
#' @return \code{data_frame} (compatible with \code{data.frame}) of results
#'        with the orignial URLs in \code{orig_url} and expanded URLs in
#'        \code{expanded_url})
#' @export
#' @note max 10,000 expansions per day
#' @examples
#' test_urls <- c("http://t.co/D4C7aWYIiA",
#'                "1.usa.gov/1J6GNoW",
#'                "ift.tt/1L2Llfr")
#' big_urls <- expand_urls(test_urls)
#' head(big_urls)
expand_urls <- function(urls_to_expand, check=FALSE, warn=TRUE,
                        .progress=interactive()) {

  doapply <- ifelse(.progress, pbsapply, sapply)

  data_frame(orig_url=urls_to_expand,
             expanded_url=doapply(urls_to_expand, expand_url,
                                  check=check, warn=warn, USE.NAMES=FALSE))

}

#' the thing that does all the work
#' @noRd
expand_url <- function(url_to_expand, check=FALSE, warn=TRUE) {

  # make the API URL
  url <- sprintf(LONGURL_ENDPOINT, url_to_expand)

  # use the API
  resp <- httr::GET(url, user_agent(LONGURL_USER_AGENT))

  # warn for API errors
  if (warn) httr::warn_for_status(resp)

  # response object
  tmp <- httr::content(resp)
  tmp <- jsonlite::fromJSON(tmp)

  # if bad response and/or API long-url not populated kick back NA
  if (resp$status != 200) return(NA)

  # _expensive_ validity check of expanded URL
  if (check) {
    chk <- httr::HEAD(url_to_expand)
    if (warn) httr::warn_for_status(chk)
    if (chk$status != 200) return(NA)
  }

  return(unlist(tmp, use.names=FALSE))

}
