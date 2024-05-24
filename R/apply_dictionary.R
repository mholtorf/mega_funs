#' Applies a dictionary file
#'
#' @param data input dataset
#' @param dictionary dictionary dataset
#' @param variable_name dictionary field for variable names in dataset
#' @param variable_label dictionary field for variable labels
#' @param value_labels dictionary field for pipe delimited value labels (e.g. 1, Yes | 0, No)
#'
#' @return A dataset with variable labels and factor labels
#' @export
#'
#' @examples
#' apply_dictionary(data = trees,
#'                  dictionary = trees_dictionary,
#'                  variable_name = var_name,
#'                  variable_label = var_label,
#'                  value_labels = value_label)
#'
#'@importFrom rlang .data
#'@importFrom stats setNames
apply_dictionary <- function(data, dictionary, variable_name, variable_label, value_labels) {

  # Apply variable_name labels
  labels <- dictionary %>%
    dplyr::select({{variable_name}}, {{variable_label}}) %>%
    dplyr::filter(!is.na({{variable_label}})) %>%
    dplyr::filter({{variable_name}} %in% names(data)) %>%
    tibble::deframe()

  data <- data %>%
    labelled::set_variable_labels(!!!labels)

  # Apply value labels
  dictionary_long <- dictionary %>%
    dplyr::filter(!is.na({{value_labels}}) & {{value_labels}} != "") %>%
    tidyr::separate_rows({{value_labels}}, sep = " \\| ") %>%
    tidyr::separate({{value_labels}}, into = c("value", "value_label"), sep = ", ") %>%
    dplyr::select({{variable_name}}, {{variable_label}}, "value", "value_label")

  labelled_cols <- dictionary_long %>%
    dplyr::filter(!is.na(.data$value_label)) %>%
    dplyr::select({{variable_name}}) %>%
    unique() %>%
    dplyr::pull({{variable_name}})

  # Check that all variable_names in names(data) are integers
  matched_fields <- intersect(names(data), dictionary_long$variable_name)
  non_integer_fields <- matched_fields[which(!sapply(data[matched_fields], is.integer))]

  if(length(non_integer_fields) > 0) {
    stop(paste("Value labels can only be applied to integer fields. The following fields are not of type integer: ", paste(non_integer_fields, collapse = ", ")))
  }
  
  for (col_name in names(data)) {
    if (col_name %in% labelled_cols) {
      col_labels <- dictionary_long %>%
        dplyr::filter({{variable_name}} == col_name) %>%
        dplyr::mutate(value = as.integer(.data$value)) %>%
        dplyr::select(.data$value, .data$value_label) %>%
        unique()

      label_vector <- setNames(col_labels$value, col_labels$value_label)
      data[[col_name]] <- labelled::set_value_labels(data[[col_name]], label_vector)
      data[[col_name]] <- labelled::to_factor(data[[col_name]])
    }
  }

  return(data)
}
