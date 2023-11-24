library(shiny)
library(dplyr)

ui <- fluidPage(
  fluidRow(
    column(
      4, 
      selectInput("x", "select x variable", colnames(mtcars), "mpg"),
      selectInput("y", "select y variable", colnames(mtcars), "wt"),
      br(),
      uiOutput("xxx"),
      uiOutput("yyy")
    ),
    column(
      8,
      verbatimTextOutput("summary")
    )
  )
)

server <- function(input, output, session) {
  
  output$xxx <- renderUI({
    textInput("xlab", "Rename x variable", value = input$x)
  })
  
  output$yyy <- renderUI({
    textInput("ylab", "Rename y variable", value = input$y)
  })
  
  df <- reactive({
    df.selected <- select(mtcars, input$x, input$y) 
    #colnames(df.selected) <- c(input$xlab, input$ylab)
    
    # Edit - Keep original column names if textInputs are empty 
    # func.for.colnames <- function(){ 
    #   if (!isTruthy(input$xlab) | !isTruthy(input$xlab)){  
    #     return(c(input$x, input$y))
    #   }
    #   
    #   else {
    #     return(c(input$xlab, input$ylab))
    #   }}
    # 
    # colnames(df.selected) <- func.for.colnames()
    
    # Edit2 - Above function is too complicated. The following works flawlessly
    if(isTruthy(input$xlab)) {
      colnames(df.selected)[1] <- input$xlab
    }
    if(isTruthy(input$ylab)) {
      colnames(df.selected)[2] <- input$ylab
    }
    
    df.selected
    
  })
  
  output$summary <- renderPrint({
    # req(input$xlab) # Unnecessary
    summary(df())
  })
}

shinyApp(ui, server)
