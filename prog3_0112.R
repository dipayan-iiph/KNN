library(shiny)

ui <- fluidPage(
  actionButton("add", "Add UI")
)

server <- function(input, output, session) {
  observeEvent(input$add, {
    output_name <- paste0("out_", input$add)
    print(output_name)
    output[[output_name]] <- renderText({
          isolate(input$add)
    })
    insertUI(
      selector = ifelse(input$add == 0L, "#add", paste0("#", "out_", input$add-1)),
      where = "afterEnd",
      ui = verbatimTextOutput(output_name)
      
    )
  }, ignoreNULL = FALSE)
}

shinyApp(ui, server)