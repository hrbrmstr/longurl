library(longurl)

c(
  "http://t.co/D4C7aWYIiA",
  "1.usa.gov/1J6GNoW",
  "ift.tt/1L2Llfr",
  "bit.ly/1GPr5w5",
  "http://l.dds.ec/1da152x",
  "http://l.rud.is/seven"
) -> test_urls

res <- expand_urls(test_urls)

expect_true(inherits(res, "data.frame"))
