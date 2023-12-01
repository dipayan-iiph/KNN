library(shiny)
library(dplyr)

ui <- fluidPage(
  mainPanel(
    h3("Data (mtcars): "), verbatimTextOutput("displayData"),
    textInput("testcode", "Try filtering the dataset in different ways: ", 
              "mtcars %>% filter(cyl>6)", width="600px"), 
    h3("Results: "), verbatimTextOutput("codeResults"))
)

server <- function(input, output) {
  shinyEnv <- environment() 
  output$displayData <- renderPrint({ head(mtcars) })  # prepare head(mtcars) for display on the UI
  
  # create codeInput variable to capture what the user entered; store results to codeResults
  codeInput <- reactive({ input$testcode })
  output$codeResults <- renderPrint({
    eval(parse(text=codeInput()), envir=shinyEnv)
  })
}

shinyApp(ui, server)