library(shiny)
library(shinyWidgets)
library(bslib)
library(bsicons)

ui <- navbarPage(
    title = "Custom navbar",
    header = use_theme(
      create_theme(
        theme = "default",
        bs_vars_navbar(
          default_bg = "#75b8d1",
          default_color = "#FFFFFF",
          default_link_color = "#FFFFFF",
          default_link_active_color = "#75b8d1",
          default_link_active_bg = "#FFFFFF",
          default_link_hover_color = "firebrick"

        ),
        output_file = NULL
      )
  ),
setBackgroundColor(
    color = c("#F7FBFF", "#2171B5"),
    gradient = "linear",
    direction = "bottom"
  ),

    tabPanel("Tab 1",
column(3,value_box(
    "KPI Title",
h1(HTML("$1 <i>Billion</i> Dollars")),
    span(
      bsicons::bs_icon("arrow-up"),
      " 30% VS PREVIOUS 30 DAYS"
    ),
    showcase = bsicons::bs_icon("piggy-bank"),
    class = "bg-success")),column(3,value_box(
    "KPI Title",
    h1(HTML("$1 <i>Billion</i> Dollars")),
    span(
      bsicons::bs_icon("arrow-up"),
      " 30% VS PREVIOUS 30 DAYS"
    ),
    showcase = bsicons::bs_icon("piggy-bank"),
    class = "bg-success")),
column(3,value_box(
    "KPI Title",
    h1(HTML("$1 <i>Billion</i> Dollars")),
    span(
      bsicons::bs_icon("arrow-up"),
      " 30% VS PREVIOUS 30 DAYS"
    ),
    showcase = bsicons::bs_icon("piggy-bank"),
    class = "bg-success")),
column(3,value_box(
    "KPI Title",
    h1(HTML("$1 <i>Billion</i> Dollars")),
    span(
      bsicons::bs_icon("arrow-up"),
      " 30% VS PREVIOUS 30 DAYS"
    ),
    showcase = bsicons::bs_icon("piggy-bank"),
    class = "bg-success"))),
    tabPanel("Tab 2")
  )

server <- function(input, output) {}
shinyApp(ui,server)

