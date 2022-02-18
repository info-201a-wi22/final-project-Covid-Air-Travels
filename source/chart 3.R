library(ggplot2)
library(tidyverse)

setwd("~/Documents/final-project-Covid-Air-Travels/source")

airlines <- read.csv(
  file = "../data/International_Report_Passengers.csv", 
  header = TRUE, 
  stringsAsFactors = FALSE
)

three_months <- airlines %>%
  select(Year, Month, Total) %>%
  filter(Month > 0 & Month < 4) 

avg_passengers_year <- three_months %>%
  group_by(Year) %>%
  summarize(avg_passengers = mean(Total, na.rm = TRUE)) 

ggplot(data = avg_passengers_year, aes(x = Year, y = avg_passengers)) +
  geom_bar(stat = "identity", fill = "orange") +
  labs(y = "Average number of passengers", x = "Year")
  
