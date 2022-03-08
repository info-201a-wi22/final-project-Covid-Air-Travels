library(shiny)
library(ggplot2) 
library(plotly) 

home_main_content <- mainPanel(
  textOutput("report"), 
  br(),
)

home_panel <- tabPanel(
  "Home",
  titlePanel("Covid Air Travels"),
  sidebarLayout(
    NULL,
    home_main_content
  )
)

chart1_main_content <- mainPanel(
  plotOutput("chart1")
)

chart1_panel <- tabPanel(
  "chart1",
  titlePanel("Passenger by Month"),
  sidebarLayout(
    NULL,
    chart1_main_content
  )
)



ui <- navbarPage(
  "Air Data",
  home_panel,
  
  chart1_panel
)
