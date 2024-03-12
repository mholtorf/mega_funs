#' Points representing trunk locations of Heritage Trees of Portland.
#'
#' The Heritage Tree ordinance calls for the City Forester to annually prepare
#' a list of trees that - because of their age, size, type, historical
#' association or horticultural value - are of special importance to the City.
#'
#' Source: https://www.portlandmaps.com/metadata/index.cfm?&action=DisplayLayer&LayerID=52455
#'
#' @format A data frame with 323 rows and 23 variables:
#' \describe{
#'   \item{lat}{Latitude}
#'   \item{lon}{Longtitude}
#'   \item{objectid}{Object ID}
#'   \item{treeid}{Tree ID}
#'   \item{height}{Tree height (in)}
#'   \item{spread}{Canopy Spread (in)}
#'   \item{diameter}{Tree diameter (in)}
#'   \item{notes}{Additional Notes}
#'   \item{scientific}{Scientific Name}
#'   \item{common}{Common Name}
#'   \item{state_id}{State Tree ID}
#'   \item{site_address}{Tree Address}
#'   \item{date_height}{Date height was measured}
#'   \item{date_spread}{Date spread was measured}
#'   \item{circumf}{Circrumerence (in)}
#'   \item{date_circumference}{Date circumference was measured}
#'   \item{year_designated}{Year tree was deisgnated a herritage tree}
#'   \item{date_desig}{Date tree was deisgnated a herritage tree}
#'   \item{ownership}{Current ownership}
#'   \item{neighborhood}{Neightboorhood of tree}
#'   \item{neighborhood_cd}{Neighborhood of tree (code)}
#'   \item{plaque_adjustment_date}{Date plaque was adjusted}
#'   \item{plaque_notes}{Notes on plaque}
#' }
"trees"


#' Data dictionary for "trees" dataset
#'
#' @format A data frame with 23 rows and 3 variables:
#' \describe{
#'   \item{var_name}{Variable Nammes}
#'   \item{var_label}{Variable labels}
#'   \item{value_label}{Values and labels}
#' }
"trees_dictionary"
