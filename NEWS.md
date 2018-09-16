# longurl 0.3.2

* Ensure input is character before processing. (@JohnCoene, #4)
* Removed dplyr & purrr deps
* As a result of ^^ also removed progress bar 

# longurl 0.3.1

* wrapped the call to `httr::warn_for_status()` with `purrr::safely()` to 
  account for an issue reported on scraping LinkedIn from AWS.

# longurl 0.3.0

* No longer uses an API service
* The returned `tbl_df` has an extra status code field

# longurl 0.2.0

* Switched out the API service since longurl.org is no longer working
* Added a `NEWS.md` file to track changes to the package.



