#' Opioid app activation function
#'
#' @export
app <- function() {
  shiny::shinyApp(
    emtAPI::ui,
    emtAPI::server
  )
}
