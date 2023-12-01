library(shiny)

ui <- fluidPage(
  actionButton("add", "Add UI")
)

server <- function(input, output, session) {
  observeEvent(input$add, {
    output_name <- paste0("out_", input$add)
    print(output_name)
    #output[[output_name]] <- renderText({
    output[[output_name]] <- renderUI({
      #isolate(input$add)
    actionButton(as.character(output_name),"Modal Open")
    })
    insertUI(
      selector = ifelse(input$add == 0L, "#add", paste0("#", "out_", input$add-1)),
      where = "afterEnd",
      #ui = verbatimTextOutput(output_name)
      ui=uiOutput(output_name)
    )
observeEvent(as.character(output_name),{
  showModal(modalDialog(
    textInput(paste("cdtxt",input$add,sep=""),"Write your Code:")
  ))
})
  }, ignoreNULL = FALSE)
}

shinyApp(ui, server)