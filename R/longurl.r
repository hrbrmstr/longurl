s_HEAD <- purrr::safely(httr::HEAD)

#' Expand a vector of (short) URLs using
#'
#' Pass in a vector of URLs (ostensibly "short" URLs) and receive
#' a \code{data_frame} of the original URLs and expanded URLs
#'
#' @param urls_to_expand character vector of URLs
#' @param warn show any warnings (API or otherwise) as messages
#' @param agent user agent to use (some sites switchup content based on user agents).
#'        Defaults to "\code{longurl-r-package}".
#' @param seconds number of seconds to wait for a response until giving up. Cannot be <1ms.
#' @param .progress display a progress bar (generally only useful in
#'        interactive sesions)
#' @return \code{tbl_df} (compatible with \code{data.frame}) of results
#'        with the orignial URLs in \code{orig_url}, expanded URLs in
#'        \code{expanded_url} and the HTTP \code{status_code} of the expanded URL. Completely
#'        invalid URLs result in a \code{NA} value for \code{expanded_url} & \code{status_code}.
#' @export
#' @examples
#' test_urls <- c("http://t.co/D4C7aWYIiA",
#'                "1.usa.gov/1J6GNoW",
#'                "ift.tt/1L2Llfr")
#' big_urls <- expand_urls(test_urls)
#' head(big_urls)
expand_urls <- function(urls_to_expand, warn=TRUE, agent="longurl-r-package", seconds=2,
                        .progress=interactive()) {

  if (.progress) pb <- progress_estimated(length(urls_to_expand))

  map_df(urls_to_expand, function(x) {

    if (.progress) pb$tick()$print()

    res <- s_HEAD(x, httr::user_agent(agent), httr::timeout(seconds))

    if (is.null(res$result)) {
      warning(sprintf("Invalid URL: [%s]", x))
      data_frame(orig_url=x, expanded_url=NA, status_code=NA)
    } else {
      httr::warn_for_status(res$result)
      data_frame(orig_url=x, expanded_url=res$result$url, status_code=res$result$status_code)
    }

  })

}
