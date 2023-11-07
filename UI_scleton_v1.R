library(shiny)
library(shinyWidgets)
library(bslib)
library(bsicons)

ui <- navbarPage(setBackgroundColor(
    color = c("#F7FBFF", "#2171B5"),
    gradient = "linear",
    direction = "bottom"
  ),
tabPanel("Dashboard",
   
  fluidRow(column(4,value_box(
    "KPI Title",
    h1(HTML("$1 <i>Billion</i> Dollars")),
    span(
      bsicons::bs_icon("arrow-up"),
      " 30% VS PREVIOUS 30 DAYS"
    ),
    showcase = bsicons::bs_icon("piggy-bank"),
    class = "bg-success")),column(4,value_box(
    "KPI Title",
    h1(HTML("$1 <i>Billion</i> Dollars")),
    span(
      bsicons::bs_icon("arrow-up"),
      " 30% VS PREVIOUS 30 DAYS"
    ),
    showcase = bsicons::bs_icon("piggy-bank"),
    class = "bg-success")),
column(4,value_box(
    "KPI Title",
    h1(HTML("$1 <i>Billion</i> Dollars")),
    span(
      bsicons::bs_icon("arrow-up"),
      " 30% VS PREVIOUS 30 DAYS"
    ),
    showcase = bsicons::bs_icon("piggy-bank"),
    class = "bg-success"))
),
    mainPanel(
      plotOutput("distPlot")
    )),
tabPanel("Plot")
  )


server <- function(input, output) {}
shinyApp(ui,server)

