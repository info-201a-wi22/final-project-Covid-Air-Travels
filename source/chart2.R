library(ggplot2)
library(tidyverse)

passengers_report <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-Covid-Air-Travels/main/data/International_Report_Passengers.csv")


three_months <- passengers_report %>%
  select(Year, Month, Total, carrier) %>%
  filter(Month >= 1 & Month <= 3) 

unique_carrier <- unique(three_months$carrier)

random_carrier_sample <- sample(unique_carrier, 10)

random_sample <- three_months %>%
  filter(carrier %in% random_carrier_sample) %>%
  group_by(Year, carrier) %>%
  summarise(Total = mean(Total))

chart2 <- ggplot(data = random_sample) +
  geom_boxplot(mapping = aes(x = log(Total), y = carrier, 
                             color = carrier), alpha = 0.5) +
  ggtitle("Passengers by Carriers") +
  xlab("Total Passengers (log scale)") + 
  ylab("Carriers")
