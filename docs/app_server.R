library(dplyr) 
library(plotly)
library(stringr)

source("../source/summary.R")
source("../source/summary_table.R")
source("../source/chart1.R")
source("../source/chart2.R")
source("../source/chart3.R")



server <- function(input, output) { 
  output$report <- renderText({
    abstract <- "Our main question is how COVID has affected air travel and how 
    this impacts the lives of the people that travel. This question is 
    important because COVID has caused many losses for airlines with many 
    people opting for other options to connect with others. To help answer this 
    question, we will find details on the changes in passengers that the 
    airlines receive."
  })
  
  output$chart1 <- renderPlot({
    return(chart1)
  })
}

