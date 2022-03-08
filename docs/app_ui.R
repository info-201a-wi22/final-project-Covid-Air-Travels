library(shiny)
library(ggplot2) 
library(plotly) 

home_main_content <- mainPanel(
  imageOutput("imgTix"),
  img("side plane", 
      src="https://flyingmag.sfo3.digitaloceanspaces.com/flyingma/wp-content/uploads/2021/08/27203109/httpswww.flyingmag.comsitesflyingmag.comfilesimport2013sitesallfiles_images201309flw0913_gulfstream_02.jpg"),
  br(),
  
  textOutput("report"), 
  br(),
)

home_panel <- tabPanel(
  "Introduction",
  titlePanel("Covid Air Travels"),
  sidebarLayout(
    NULL,
    home_main_content
  )
)



chart1_main_content <- mainPanel(
  plotOutput("chart1")
)

chart1_sidebar_content <- sidebarPanel(
  selectInput(
    "vis1",
    label = "Months",
    choices = list(
      "All",
      "January", 
      "February", 
      "March"
    )
  )
)

chart1_panel <- tabPanel(
  "Chart 1",
  titlePanel("Passenger by Month"),
  sidebarLayout(
    chart1_sidebar_content,
    chart1_main_content
  )
)

chart2_main_content <- mainPanel(
  plotOutput("chart2")
)

chart2_sidebar_content <- sidebarPanel(
  selectInput(
    "vis2",
    label = "Carriers",
    choices = list(
      
    )
  )
)

chart2_panel <- tabPanel(
  "Chart 2",
  titlePanel("Passenger by Carrier"),
  sidebarLayout(
    chart2_sidebar_content,
    chart2_main_content
  )
)



ui <- navbarPage(
  "Info 201",
  home_panel,
  
  chart1_panel, 
  chart2_panel
)
