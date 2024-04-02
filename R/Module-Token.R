tokenUI <- function(id) {
  bslib::page_fillable(
    shiny::textInput(
      inputId = shiny::NS(id, "username"),
      label = "Username"
    ),
    shiny::passwordInput(
      inputId = shiny::NS(id, "password"),
      label = "Password"
    ),
    shiny::actionButton(
      inputId = shiny::NS(id, "generate_token"),
      label = "Generate Token",
      width = "25%"
    ),
    shiny::verbatimTextOutput(
      outputId = shiny::NS(id, "token")
    )
  )
}


tokenServer <- function(id) {

  shiny::moduleServer(id, function(input, output, session){

    token <- shiny::eventReactive(input$generate_token, {
      req(input$username, input$password)
      return(
        gen_token(input$username, input$password)
      )
    }, ignoreNULL = FALSE)


    output$token <- shiny::renderText({
      token()
    })

  })
}
