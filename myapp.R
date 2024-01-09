#rm(list=setdiff(ls(), 'currentTab'))

# If current tab exists, restore to that tab. Otherwise, start at home screen
#if(!exists('currentTab')){
#  currentTab <- 'HOMEPAGE'
#}


credentials <- data.frame(
  user = c("shiny", "shinymanager"), # mandatory
  password = c("azerty", "12345"), # mandatory
  start = c("2019-04-15"), # optinal (all others)
  expire = c(NA, "2019-12-31"),
  admin = c(FALSE, TRUE),
  comment = "Simple and secure authentification mechanism 
  for single ‘Shiny’ applications.",
  stringsAsFactors = FALSE
)

library(shiny)
library(shinymanager)
library(htmlwidgets)
library(cookies)

#ui <- tagList(
  #tags$head(
    #tags$script(JS("setTimeout(function(){history.pushState({}, 'Page Title', '/github_app');},2000);"))),
    #--------------This section has to be conditioned on URL and login validation mechanism------------------)
    #tags$script(JS("setTimeout(function(){history.replaceState(null, '', '')},2000);"))),
   ui<- fluidPage(
  tags$h2("My secure application"),
  verbatimTextOutput("auth_output")
#)
   )

# Wrap your UI with secure_app
ui <- add_cookie_handlers(secure_app(ui))


server <- function(input, output, session=T) {
  
  # call the server part
  # check_credentials returns a function to authenticate users
  
  res_auth <- secure_server(
    check_credentials = check_credentials(credentials)
  )
  
  output$auth_output <- renderPrint({
    reactiveValuesToList(res_auth)
  })
  
  # your classic server logic
  observe({
    currentTab <<- input$navbar
  })
}

shinyApp(ui, server)