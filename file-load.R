library(shiny)
options(shiny.maxRequestSize = 30 * 1024^2)
ui <- fluidPage(
  fileInput("upload", NULL, buttonLabel = "Upload...", multiple = TRUE),
  tableOutput("files"),
  actionButton("sb","Submit"),
  uiOutput("iu"),
  numericInput("nm","Select Table",value=1,min=1,max=5,step=1),
  tableOutput("tb"),
  textOutput("tb1")
  
)

server <- function(input, output, session) {
  observeEvent(input$sb,{
  #observe({
  output$files <- renderTable(input$upload)
  #output$tb<-renderTable(read.csv(input$upload$datapath[1],sep=";",header=T))
  output$iu<-renderUI({
    tags<-tagList()
    for(i in 1:length(input$upload$datapath)){
      
       tags[[i]]<-selectInput(paste("a",i,sep=""),"Select Df",choices = c(input$upload$datapath))
      
    }
    tags
    })
  })
  observe({
    output$tb1<-renderText(input$upload$datapath[as.numeric(input$nm)])
  })
 
}
shinyApp(ui, server)


