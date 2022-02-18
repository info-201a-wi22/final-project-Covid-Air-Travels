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
  group_by(Year)

feb_total <- airlines %>%
  select(Year, Month, Total) %>%
  filter(Month == 2) %>%
  group_by(Year)

mar_total <- airlines %>%
  select(Year, Month, Total) %>%
  filter(Month == 3) %>%
  group_by(Year)

ggplot(data = NULL, aes(x = Year, y = Total)) +
  geom_line(data = jan_total, color = "green") + 
  geom_line(data = feb_total, color = "purple") + 
  geom_line(data = mar_total, color = "orange")

