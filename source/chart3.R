library(ggplot2)
library(tidyverse)

passengers_report <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-Covid-Air-Travels/main/data/International_Report_Passengers.csv")


three_months <- passengers_report %>%
  select(Year, Month, Total) %>%
  filter(Month > 0 & Month < 4) 

avg_passengers_year <- three_months %>%
  group_by(Year) %>%
  summarize(avg_passengers = mean(Total, na.rm = TRUE)) 

chart3 <- ggplot(data = avg_passengers_year, aes(x = Year, y = avg_passengers)) +
  geom_bar(stat = "identity", fill = "orange") +
  labs(y = "Average number of passengers", x = "Year")
  
