#' Formatting gtsummary table objects for quarto
#'
#' @param data A gtsummary table Object
#'
#' @return A kable table object
#' @export
#'
#' @examples
#' table1 <-
#'   trees %>%
#'   gtsummary::tbl_summary(include = c(height,diameter))
#'
#' as_quarto_tbl(table1)
as_quarto_tbl <- function(data) {
  data %>%
    gtsummary::as_kable_extra() %>%
    kableExtra::kable(format = "html", escape = FALSE,
          table.attr = 'data-quarto-disable-processing="true"') %>%
    kableExtra::kable_classic(html_font = "Calibri") %>%
    kableExtra::kable_styling(bootstrap_options = c("hover", "condensed"),
                  font_size = 11, full_width = FALSE)
}
