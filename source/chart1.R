library(ggplot2)
library(dplyr)

passengers_report <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-Covid-Air-Travels/main/data/International_Report_Passengers.csv")

options(dplyr.summarise.inform = FALSE)

jan_total <- passengers_report %>%
  select(Year, Month, Total) %>%
  filter(Month == 1) %>%
  group_by(Year, Month) %>%
  summarise(Total = mean(Total))

feb_total <- passengers_report %>%
  select(Year, Month, Total) %>%
  filter(Month == 2) %>%
  group_by(Year, Month) %>%
  summarise(Total = mean(Total))

mar_total <- passengers_report %>%
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
