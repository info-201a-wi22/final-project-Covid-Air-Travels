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
  titlePanel("COVID-19's Effect on Air Travels"),
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

chart3_panel <- tabPanel(
  "Chart 3",
  titlePanel(""),
  
)

conclusion_panel <- tabPanel(
  "Conclusion",
  h1("Findings"),
  
  h2("Discussion"),
  p("The data on air travel in the decades pre-covid and post-covid and our 
  investigation of the data tell us a lot about the change in total passengers, 
  the types of airlines, and the fluctuations in passengers through the years. 
  We can use our findings to understand the effect of coronavirus on airlines 
  and international travel when it began in 2019. Our data only goes up till 
  March 2020, so we opted to only use three months worth of data each year in 
  our analysis and calculations for accurate findings.
    The airline with the most flights was Alaska Airlines, which shows that 
  Alaska Airlines is not only popular in domestic flights, but in international 
  flights as well. In our second visual, we break down the distribution of total 
  passengers in 10 airlines and scale it by log. This visual reads into a sample 
  set of airlines and can imply that the number of passengers are generally 
  consistent in individual airlines. 
    Our report also focused on analyzing the number of passengers over time and 
  compared it in regards to months, years, and the percentage change between 
  months. Our findings show that international travel on average in each year has 
  been increasing between 1990 to 2020, however there is a major dip from 2019 to 
  2020. The dip is much more pronounced in the first visual where it breaks down 
  each month and displays the trend of number of passengers. In January and 
  February, there is a bit of decline, then in March there is a large decrease in 
  the number of passengers. There is a sharp decline, which demonstrates how large 
  of an impact covid had on international travel due to airport closures and 
  restrictions. This had a huge hit on international flights and how the United 
  States changed airport policies in reaction to a pandemic. 
    Based on the importance of years 2019 and 2020, we also looked into how much 
  change there was in passenger numbers between these two years, which came out to 
  be -21.4%. This is the largest decline between any two years, which further 
  points to the negative impact of covid on international flights. Also, our 
  findings show that 2019 was the year with most passengers, and this can imply 
  that if not for covid, 2020 could have easily been the following year with the 
  most passengers."),
  
  h1("Conclusion"),

)

ui <- navbarPage(
  
  "Info 201",
  home_panel,
  
  chart1_panel, 
  chart2_panel,
  chart3_panel,
  conclusion_panel
)
