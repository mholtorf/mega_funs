#' Convert any character columns containing integers to integer types
#'
#' @param data Dataset
#'
#' @return Dataset with updated data types
#' @export
#'
#' @examples
#' char_to_integer(data = mtcars)
char_to_integer <- function(data) {
  char_columns <- sapply(data, is.character)

  for (col in names(data[char_columns])) {
    if (all(suppressWarnings(!is.na(as.integer(data[[col]]))))) {
      data[[col]] <- as.integer(data[[col]])
    }
  }

  return(data)
}
