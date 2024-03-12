#' Calculate age
#'
#' @param dob Date of birth
#' @param date Date for which age is calculated
#'
#' @return Returns an integer
#' @export
#'
#' @examples
#' calculate_age(dob = "1980-10-01", date = "2024-01-01")
calculate_age <- function(dob, date) {
  from_lt = as.POSIXlt(dob)
  to_lt = as.POSIXlt(date)

  age = to_lt$year - from_lt$year

  ifelse(to_lt$mon < from_lt$mon |
           (to_lt$mon == from_lt$mon & to_lt$mday < from_lt$mday),
         age - 1, age)
}

