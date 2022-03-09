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

report_main_content <- mainPanel(
  h4("Author: By: Monica Dao (xmtdx@uw.edu), John Oh (jho12@uw.edu), 
     Garima Thapa (gt35@uw.edu), Linda Giang (linda71@uw.edu)"),
  h4(strong("INFO-201: Technical Foundations of Informatics - 
        The Information School - University of Washington WINTER 2022")),
  h4(strong("Abstract")),
  p("Our main question is how air travel has changed over the years and how 
    covid has impacted the lives of the people that travel. This question is 
    important because covid has caused many losses for airlines and changed the 
    way people interact with one another. To help answer this question, we will 
    find details on the changes in passengers that the airlines receive."),
  h4(strong("Introduction")),
  p("The coronavirus that has rapidly spread since early 2020 caused many to be 
    apprehensive towards crowds of people. Airplanes are examples of this, 
    being an enclosed space that seats many people for an average of 3 hours. 
    Due to such concerns, airlines have been seeing a decline in business since 
    March of 2020, with many countries adding travel bans and restrictions. 
    With the introduction of vaccines and safety practices, many are starting 
    to travel by air again. An initial study conducted by the Harvard T.H. Chan 
    School of Public Health concluded that “there is a low risk of COVID-19 
    transmission on aircraft” (Barnes, 2020) as of October 2020. However, with 
    the new covid Omicron variant, the recovery of airline businesses may 
    continue to see limited passengers. There are articles where an airline 
    medical advisor predicted that Omicron will make it “twice or even three 
    times more likely to catch Covid-19 during a flight” (Whitley, 2021). The 
    trends of passengers may inversely follow the number of cases, but with the 
    effectiveness of the vaccines and the addition of the booster, this may not 
    have to be the case."), 
  h4(strong("Design Situation")), 
  h5("Framing the topic of concern"), 
  p("Air travel is one of the most prevalent ways of traveling, and it has 
    impacted the way people plan long-term and short-term travel in the United 
    States. But in 2020, Covid-19 has changed the behaviors of people that 
    existed since airlines have become commercialized, which shows the severity 
    Covid-19 had on people’s lives. Not only did it change the behavior of 
    people on using commercial airlines, but it also changed the behavior of 
    airlines, “reducing Domestic departures declined 71.5% in May 2020 as 
    compared to the previous year” (Hotle, 2020)."),
  h5("Human Values"),
  p("There are many reasons behind deciding to opt-out of airline traveling, 
    which one may argue is due to safety concerns. However, this decision goes 
    beyond just safety and is related to unemployment, uncertainty, and 
    psychological hindrance due to Covid-19. For example, in 2020 unemployment 
    in the U.S. rose about 100% from the previous year (Bureau of Labor 
    Statistics, 2021). Such data shows the priority of the people and their 
    values in safety, which originates from deaths and over-hospitalization 
    due to Covid-19."),
  h5("Stakeholders"),
  p("The direct stakeholders are airports and airlines. Airlines worldwide 
    suffered a -$137.7 billion in net loss post covid during 2020, showing the 
    significant impact Covid had on airline profits (Mazareanu, 2021). Any 
    workers of airports and airlines can suffer financial damage from traveling 
    decline, making our data an important part of their operation. Indirect 
    stakeholders are those who wish to travel either for business or personal 
    reasons, as rising in Covid-19 would limit them from using air traveling as 
    an option"),
  h5("Benefits and Harms"),
  p("A benefit of having Covid-19 and Airtravel history data is its sensitivity 
    to trends. Both data can be generally analyzed before significant 
    outbreaks, which means actions can be taken based on an increasing trend 
    in Covid-19 and decreasing trend in air travel, limiting the chance of 
    compromising people’s safety when traveling. Airline workers are able to 
    avoid being in a dangerous situation. However, these data often change 
    drastically throughout periods, creating unpredictability when actions are 
    needed. This could create confusion amongst decision-makers in the airline 
    industry regarding air travel operations, which may contradict policy 
    makers’ decisions."),
  h4(strong("Research questions")),
  p("- How has passenger density changed in the various airlines? 
    Has covid added to this change?"),
  p("- Are the shifts in passenger density applicable across the airlines?"),
  p("- What does the average passengers show in these airlines?"),
  p("Many adjustments had to be made in the daily lives of people including how 
    they interact with people who live far away with them. With airplanes being 
    an enclosed space and passengers seated in close proximity, the risks of 
    covid is increased. Therefore these questions seek to find out how people 
    have been using the various airlines even before covid, to see how much it 
    has impacted the lives of the general public. Whether the usage of airlines 
    are common and necessary enough to take on the increased risks of covid or 
    if staying connected without being physically present is a decent 
    replacement to using airlines. The changes in usage of these various 
    airlines can also seek to optimize the usage of planes and decrease the 
    greenhouse gas produced. In 2019, it was seen that 29% of carbon pollution 
    came from the transportation sector (Sources of Greenhouse Gas Emissions, 
    2021)."),
  h4(strong("The Dataset")), 
  p("The dataset is U.S. International Air Traffic data(1990-2020) from Kaggle 
    on airport and airline traffic by US and international carriers. The data, 
    held in the U.S. Department of Transportation website, is from the U.S. 
    International Air Passenger and Freight Statistics Report page. This 
    particular dataset is on passengers and holds information on the number of 
    passengers each month and year between two airports serviced by a specific 
    airline. This report is part of the T-100 program and it was developed to 
    allow the public to have access to data on flights internationally. The 
    dataset reports are updated quarterly, and the site has multiple datasets 
    around Passenger, Freight, Departures, Seats. The effect of the pandemic on 
    traffic can be analyzed in the 2020 report."),
  p("The T-100 program by the USDOT began on January 1, 1990. It produces 
    reports of foreign airlines operating to and from the United States and 
    traffic reports of both domestic and international operations of U.S. 
    airlines. The reports are submitted by airlines to the Department’s 
    Office of Airline Information of the Bureau of Transportation Statistics. 
    There is a rule that states that data must be confidential for 6 months 
    before reporting."),
  p("This dataset is very large and has over 680k rows and 16 columns. Columns 
    are labeled as: data_dte (data date), Year (data year), Month (Data month), 
    usg_apt_id (US Gateway airport ID), usg_apt (US Gateway airport code), 
    usg_wac (US Gateway World area code, to represent a geographic territory), 
    fg_apt_id (Foreign Gateway Airport ID), fg_apt (Foreign Gateway Airport 
    code), fg_wac (Foreign Gateway world area code), airlineid (Airline ID), 
    carrier (IATA assigned air carrier code), carriergroup (Carrier Group Code 
    – 1 denotes US domestic air carrier, 0 is foreign), type (Passengers), 
    Scheduled (metric flown by scheduled service operations), Charter (metric 
    flown by charter operations), and Total (total metric flown by scheduled 
    service and charter operations)."),
  p("This dataset contains all nonstop commercial passenger traffic traveling 
    between international points and U.S. airports. The data covers the 
    timeline between January 1, 1990 to March 1, 2020. This dataset does not 
    cover all aspects of international travel as nonstop traffic to and from 
    U.S. cities that serve as international gateway will have high numbers."),
  p("It should be noted that some traffic continues on a connecting flight due 
    to most international passengers having at least one connecting flight 
    before reaching their final destination. U.S. carriers also serve some 
    international points through an international connection only. Although 
    the data can seem to show that no U.S. carrier serves an international 
    point, the carrier traffic is first moving through a connecting city. 
    There are influences of code-share agreements on this data, and this 
    agreement makes it common for passengers to fly on an aircraft operated by an airline different from the one they bought their ticket from."),
)
  

report_panel <- tabPanel(
  "Report",
  titlePanel("The Coronavirus’s Effect on Air Travels and the Implications"), 
  sidebarLayout(
    NULL,
    report_main_content
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

pass_data <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-Covid-Air-Travels/main/data/International_Report_Passengers.csv", 
                              stringsAsFactors = FALSE)
date_filter <- pass_data %>%
  filter(Month > 0 & Month < 4 & Year > 2009)

time_range <- range(date_filter$Year)

chart2_main_content <- mainPanel(
  plotlyOutput("chart2")
)

chart2_sidebar_content <- sidebarPanel(
  selectInput("search", label = "carrier", 
              choice = list("American Airlines Inc." = "AA",
                            "United Airlines" = "UA",
                            "Delta Air Lines, Inc." = "DL",
                            "British Airways" = "BA",
                            "Jetblue Airways Corporation" = "B6",
                            "Lufthansa" = "LH",
                            "Air Canada" = "AC",
                            "WestJet" = "WS",
                            "US Airways" = "US",
                            "Société Air France" = "AF"), 
              selected = "American Airlines Inc."
  ), 
  sliderInput(
    inputId = "time_range",
    label = "Year",
    min = time_range[1],
    max = time_range[2],
    value = time_range
  )
)

chart2_panel <- tabPanel(
  "Chart 2",
  titlePanel("Total Passengers by Carrier"),
  sidebarLayout(
    chart2_sidebar_content,
    chart2_main_content
  )
)

chart3_main_content <- mainPanel(
   #plotOutput("chart3")
)

chart3_sidebar_content <- sidebarPanel(
  selectInput(
    "vis3",
    label = "Carrier",
    choices = list(
      "All carriers", 
      "American Airlines", 
      "Delta Airlines",
      "Southwest Airlines",
      "United Airlines",
      "China Southern Airlines"
    )
  )
)

chart3_panel <- tabPanel(
  "Chart 3",
  titlePanel("Average Number of Passengers by Year (2015 - 2020)"),
  sidebarLayout(
    chart3_sidebar_content,
    chart3_main_content
  )
)

conclusion_panel <- tabPanel(
  "Conclusion",
  h1("Findings"),
  p("Covid-19 Impacted many lives and changed the dynamics of global interpretation of standards. 
  Causing monetary damage to many industries, the airline industry was also targeted due to its nature of traveling in confined spaces. 
  To analyze and scrutinize the impact Covid-19 had on air travel, our group posed significant questions that interpret a global phenomenon of declining air travel.
    The first question we tackled was the most popular airline industry with the most flights. To see the true impact of Covid-19 on air travel, 
  it was appropriate to gather large amounts of data that proposes a correlation between various variables. Therefore, examining the impact of the most 
  popular airline would provide enough information for our analysis. The most popular international airline was American Airlines. 
	  The second question was the overall difference between traveling passengers from 2019 to 2020. In March of 2020, Covid-19 became prevalent, 
	causing various impacts on global economical sectors. Because the dataset only consisted of January to March data in 2020, the percentage decrease
	in passengers from the first three months of 2019 and 2020 was found. The decrease was about 21.4%, a significant change from the previous year.
	  The final question addressed the year with the most passengers to determine which year the airline industry was most booming. 
	The year was 2019, just a year before the Covid-19 pandemic, proving that the decrease in passengers in 2020 was not a mere impact of downwards trending of airline travel, 
	but a true impact of Covid-19.
	  These three questions, which were designed to see the overall impact of Covid-19 on airline industries, provided data that directly correlates two respective variables. 
	The importance of these data is that it showcases a significant change in the scope of the world’s economical industries and the threat it posed to too many companies r
	anging from small businesses to large scale corporations. However, directly experiencing countries and people working together to uplift each other from this global suffering, 
	it was pleasing to acknowledge the power of technology and empathy of the people mobilizing our society out of the pandemic."),
  
  h2("Discussion"),
  p("The data on air travel in the decades pre-covid and post-covid and our 
  investigation of the data tell us a lot about the change in total passengers, 
  the types of airlines, and the fluctuations in passengers through the years. 
  We can use our findings to understand the effect of coronavirus on airlines 
  and international travel when it began in 2019. Our data only goes up till 
  March 2020, so we opted to only use three months worth of data each year in 
  our analysis and calculations for accurate findings.
    The airline with the most flights was American Airlines, which shows that 
  American Airlines is not only popular in domestic flights, but in international 
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
  p("Overall, we found that the Covid-19 pandemic has caused the air 
  transportation sector to a major decline in traffic in 2020 and left a toll
  on many airline carriers. With the spread of the life-threatening virus, 
  we see the major negative impacts in both American and non-American flight 
  carrier, despite how the trend from previous years anticipated an increase
  in the years coming.
  
  Together with curiosity and the eagerness to learn, were able to compile 
  data and perform analyses to answer our questions at the start of this project.
  Our data visualizations helped us understand and navigate data easily so that we
  can see information in appropriate perspectives for different factors. We are 
  thrilled to share with you our findings and creations, and hope you they are 
  helpful to you!")
)

ui <- navbarPage(
  "Info 201",
  home_panel,
  report_panel,
  chart1_panel, 
  chart2_panel,
  chart3_panel,
  conclusion_panel
)