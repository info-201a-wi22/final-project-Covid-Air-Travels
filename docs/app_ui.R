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
  p("Covid-19 Impacted many lives and changed the dynamics of global interpretation of standards. 
  Causing monetary damage to many industries, the airline industry was also targeted due to its nature of traveling in confined spaces. 
  To analyze and scrutinize the impact Covid-19 had on air travel, our group posed significant questions that interpret a global phenomenon of declining air travel.
    The first question we tackled was the most popular airline industry with the most flights. To see the true impact of Covid-19 on air travel, 
  it was appropriate to gather large amounts of data that proposes a correlation between various variables. Therefore, examining the impact of the most 
  popular airline would provide enough information for our analysis. The most popular international airline was Alaska Airlines. 
	  The second question was the overall difference between traveling passengers from 2019 to 2020. In March of 2020, Covid-19 became prevalent, 
	causing various impacts on global economical sectors. Because the dataset only consisted of January to March data in 2020, the percentage decrease
	in passengers from the first three months of 2019 and 2020 was found. The decrease was about 21.4%, a significant change from the previous year.
	  The final question addressed the year with the most passengers to determine which year the airline industry was most booming. 
	The year was 2019, just a year before the Covid-19 pandemic, proving that the decrease in passengers in 2020 was not a mere impact of downwards trending of airline travel, 
	but a true impact of Covid-19.
	  These three questions, which were designed to see the overall impact of Covid-19 on airline industries, provided data that directly correlates two respective variables. 
	The importance of these data is that it showcases a significant change in the scope of the world’s economical industries and the threat it posed to too many companies r
	anging from small businesses to large scale corporations. However, directly experiencing countries and people working together to uplift each other from this global suffering, 
	it was pleasing to acknowledge the power of technology and empathy of the people mobilizing our society out of the pandemic. 
")
  
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
