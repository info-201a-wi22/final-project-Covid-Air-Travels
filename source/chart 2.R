library(ggplot2)
library(tidyverse)

setwd("~/Documents/final-project-Covid-Air-Travels/source")

airlines <- read.csv(
  file = "../data/International_Report_Passengers.csv", 
  header = TRUE, 
  stringsAsFactors = FALSE
)

three_months <- airlines %>%
  select(Year, Month, Total, carrier) %>%
  filter(Month >= 1 & Month <= 3) 

unique_carrier <- unique(three_months$carrier)

random_carrier_sample <- sample(unique_carrier, 15)

random_sample <- three_months %>%
  filter(carrier %in% random_carrier_sample) %>%
  group_by(Year, carrier) %>%
  summarise(Total = mean(Total))

ggplot(data = random_sample) +
  geom_boxplot(mapping = aes(
    x = log(Total), y = carrier, color = carrier), alpha = 0.5)

