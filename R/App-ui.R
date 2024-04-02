#' User Interface for EMT application
#'
#' @return shiny ui
#' @export
ui <- function() {

  bslib::page_navbar(
    id = "emtAPI",
    title = "Equity Mapping Tool API",
    theme = bslib::bs_theme(
      font_scale = NULL,
      `enable-rounded` = TRUE,
      bootswatch = "pulse"
    ),

    shiny::tags$head(
      shiny::tags$style(
        shiny::HTML(
          '
          .intro h1, .intro h2, .intro h3 {
            font-family: serif;
          }

          .intro h1 {
            font-size: 45px;
          }

          .intro h2 {
            font-size: 35px;
          }

          .intro body {
            font-family: serif;
            font-size: 30px;
          }
          meter::-webkit-meter-optimum-value {
            background: red; /* Green */
          }
          '
        )
      )
    ),

    sidebar = NULL,
    selected = "Token",

    bslib::nav_panel(
      "Token",
      tokenUI("token")
    )
  )
}
