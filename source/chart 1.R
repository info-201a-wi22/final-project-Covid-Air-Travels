library(ggplot2)
library(tidyverse)

setwd("~/Documents/final-project-Covid-Air-Travels/source")

airlines <- read.csv(
  file = "../data/International_Report_Passengers.csv", 
  header = TRUE, 
  stringsAsFactors = FALSE
  )

jan_total <- airlines %>%
  select(Year, Month, Total) %>%
  filter(Month == 1) %>%
  group_by(Year, Month) %>%
  summarise(Total = mean(Total))

feb_total <- airlines %>%
  select(Year, Month, Total) %>%
  filter(Month == 2) %>%
  group_by(Year, Month) %>%
  summarise(Total = mean(Total))

mar_total <- airlines %>%
  select(Year, Month, Total) %>%
  filter(Month == 3) %>%
  group_by(Year, Month) %>% 
  summarise(Total = mean(Total))

chart1 <- ggplot(data = NULL, 
                 aes(x = Year, y = Total,color = factor(Month))) +
  geom_line(data = jan_total) + 
  geom_line(data = feb_total) + 
  geom_line(data = mar_total) +
  ggtitle("Total Passengers by Months") +
  ylab("Total Passenger") +
  scale_color_discrete(name = "Months", 
                       label = c("January", "February", "March"))
