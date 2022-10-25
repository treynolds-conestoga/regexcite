#' Split a string
#'
#' @param string A character vector with, at most, one element.
#' @inheritParams stringr::str_split
#'
#' @return A character vector.
#' @export
#'
#' @examples
#' x <- "alfa,bravo,charlie,delta"
#' strsplit1(x, split = ",")
#' strsplit1(x, split = ",")
#'
#' y <- "192.168.0.1"
#' strsplit1(y, pattern = stringr::fixed("."))

strsplit1 <- function(x, split) {
  strsplit(x, split = split)[[1]]
}
