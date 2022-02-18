# A file that calculates summary information to be included in your report
install.packages("dplyr")
library(dplyr)

passengers_report <- read.csv("~/INFO201/final-project-Covid-Air-Travels/data/International_Report_Passengers.csv")
View(passengers_report)


# 1. What was the most popular airline?
popular_airline <- passengers_report %>%
  group_by(carrier) %>%
  summarise(count = n()) %>%
  arrange(desc(count)) %>%
  filter(row_number() == 1) %>%
  pull(carrier)
  
View(popular_airline) #'AA' = Alaska Airlines

# 2. How much percent of the total number of passengers decline when covid hit (2019 - 2020)?
# (data from 2020 only goes from jan-march, so only those months counted)
passengers_report$data_dte <-as.Date(passengers_report$data_dte,"%m/%d/%Y")
passengers_19 <- passengers_report %>%
  filter(data_dte >= "2019-1-1" & data_dte <= "2019-3-1") %>%
  summarise(num = sum(Total)) %>%
  pull(num)

passengers_20 <- passengers_report %>%
  filter(data_dte >= "2020-1-1" & data_dte <= "2020-3-1") %>%
  summarise(num = sum(Total)) %>%
  pull(num)

percent_diff <- (passengers_20 - passengers_19) / passengers_19 * 100

# 3. What year had the most passengers?
# (excludes 2020 b/c of covid and we know there's been a decline)
most_passengers_year <- passengers_report %>%
  filter(data_dte < "2020-1-1") %>%
  group_by(Year) %>%
  summarise(num = sum(Total)) %>%
  arrange(desc(num)) %>%
  filter(row_number() == 1) %>%
  pull(Year)
  
View(most_passengers_year)

# 4.


# 5.