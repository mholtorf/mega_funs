#' Calculate number of months between two dates with boundaries at the day of the month.
#'
#' @param start Start date
#' @param end End date
#'
#' @return Returns an integer
#' @export
#'
#' @examples
#' calculate_months(start = "2022-10-01", end = "2024-01-01")
calculate_months <- function(start, end) {
  from_lt = as.POSIXlt(start)
  to_lt = as.POSIXlt(end)

  years = to_lt$year - from_lt$year
  months = to_lt$mon - from_lt$mon + (years * 12)

  ifelse(to_lt$mday < from_lt$mday |
           (to_lt$mon == from_lt$mon & to_lt$mday < from_lt$mday),
         months - 1, months)
}

