#' Tools expand vectors of short URLs into long URLs
#'
#' Tools are provided to expand vectors of short URLs into long 'URLs'.
#' No 'API' services are used, which may mean that this operates more slowly than
#' 'API' services do (since they usually cache results of expansions that every
#' user of the service requests). You can setup your own caching layer with the
#' 'memoise' package if you wish to have a speedup during single sessions or add
#' larger dependencies, such as 'Redis', to gain a longer-term performance boost
#' at the expense of added complexity.
#'
#' @name longurl
#' @docType package
#' @author Bob Rudis (bob@@rud.is)
#' @import httr
NULL
