s_HEAD <- safely(httr::HEAD)
s_STATUS <- safely(httr::warn_for_status)

#' Expand a vector of (short) URLs using
#'
#' Pass in a vector of URLs (ostensibly "short" URLs) and receive
#' a data frame of the original URLs and expanded URLs
#'
#' @md
#' @param urls_to_expand character vector of URLs
#' @param warn show any warnings (API or otherwise) as messages
#' @param agent user agent to use (some sites switchup content based on user agents).
#'        Defaults to "`longurl-r-package`".
#' @param seconds number of seconds to wait for a response until giving up. Cannot be <1ms.
#' @param .progress kept for legacy functionality but ignored
#' @return a tibble/data frame with the orignial URLs in `orig_url`, expanded URLs in
#'        `expanded_url` and the HTTP `status_code` of the expanded URL. Completely
#'        invalid URLs result in a `NA` value for `expanded_url` & `status_code`.
#' @export
#' @examples
#' test_urls <- c("http://t.co/D4C7aWYIiA",
#'                "1.usa.gov/1J6GNoW",
#'                "ift.tt/1L2Llfr")
#' big_urls <- expand_urls(test_urls)
#' head(big_urls)
expand_urls <- function(urls_to_expand,
                        warn = TRUE,
                        agent = "longurl-r-package",
                        seconds = 5,
                        .progress = FALSE) {

  urls_to_expand <- as.character(urls_to_expand)

  lapply(urls_to_expand, function(x) {

    res <- s_HEAD(x, httr::user_agent(agent), httr::timeout(seconds))

    if (is.null(res$result)) {
      warning(sprintf("Invalid URL: [%s]", x))
      data.frame(
        orig_url = x,
        expanded_url = NA_character_,
        status_code = NA_character_,
        stringsAsFactors = FALSE
      )
    } else {
      sres <- s_STATUS(res$result)
      if (is.null(sres$result)) {
        warning("httr::warn_for_status() on HEAD request result")
      data.frame(
        orig_url = x,
        expanded_url = NA_character_,
        status_code = NA_character_,
        stringsAsFactors = FALSE
      )
      } else {
        data.frame(
          orig_url = x,
          expanded_url = res$result$url,
          status_code = res$result$status_code,
          stringsAsFactors = FALSE
        )
      }
    }

  }) -> xlst

  xdf <- do.call(rbind.data.frame, xlst)
  class(xdf) <- c("tbl_df", "tbl", "data.frame")
  xdf

}
