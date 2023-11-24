library(shiny)
ui<-fluidPage(
  radioButtons("rd","Please choose file Type:",
               choiceNames = list(
                 HTML("<img src='image.png' width='50' height='50' alt=Cloud> <font color='red'>Normal</font>"), 
                 tags$span(tags$img(src='image.png',width=50,height=50),style = "color:blue", "Uniform"), 
                 "Log-normal", "Exponential"
               ),
               choiceValues = c("norm", "unif", "lnorm", "exp"),
               inline=T),
  uiOutput('u')
)
server<-function(input,output){
  output$u<-renderUI(if(input$rd=="norm"){
    fileInput("f1","select File",accept=".csv")
  }else if(input$rd=="unif"){
    selectInput("f2","Hello",choices = c("a","b"))
  } else{
    textInput("f3",'Write Something')
  }
  )
}
shinyApp(ui,server)