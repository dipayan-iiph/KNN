library(shinyjs)
library(shiny)
ui <- fluidPage(
  useShinyjs(),
  fileInput("f","File"),
  actionButton("go", "Go"),
  uiOutput('u')
)


server <- function(input, output, session){
clk<-reactive(input$ad)
print(clk)
observeEvent(input$go,{
output$u<-renderUI(
     tagList(actionButton("mdbtn", "Open Window"), 
    actionButton("ad","ADD"),uiOutput('u1')
   ))

     })
observeEvent(input$mdbtn,{
  showModal(modalDialog(
    textInput("cdtxt","Write your Code:")
  ))
})

}


shinyApp(ui=ui,server=server) 
