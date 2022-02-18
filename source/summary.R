# A file that calculates summary information to be included in your report
library(dplyr)
                 
setwd("~/Documents/INFO_201/final-project-Covid_Airtravel-/source")

passengers_report <- read.csv(
  "../Data/International_Report_Passengers.csv",
  header = TRUE,
  stringsAsFactors = FALSE
)
View(passengers_report)


# 1. What was the most popular airline?
popular_airline <- passengers_report %>%
  group_by(carrier) %>%
  summarise(count = n()) %>%
  arrange(desc(count)) %>%
  filter(row_number() == 1) %>%
  pull(carrier)
  
View(popular_airline) #'AA' = Alaska Airlines

# 2. What was the difference in percentage between the total number of 
# passengers in the years before and after COVID hit (2019-2020)?
# (data from 2020 only goes from jan-march, so only those months are counted)
passengers_report$data_dte <-as.Date(passengers_report$data_dte,"%m/%d/%Y")
passengers_19 <- passengers_report %>%
  filter(data_dte >= "2019-1-1" & data_dte <= "2019-3-1") %>%
  summarise(num = sum(Total)) %>%
  pull(num)

passengers_20 <- passengers_report %>%
  filter(data_dte >= "2020-1-1" & data_dte <= "2020-3-1") %>%
  summarise(num = sum(Total)) %>%
  pull(num)

percent_diff <- (passengers_20 - passengers_19) / passengers_19 * 100 # 21.43% 

# 3. Which year had the most passengers?
# (excludes 2020 b/c of COVID and we know there's been a decline)
most_passengers_year <- passengers_report %>%
  filter(data_dte < "2020-1-1") %>%
  group_by(Year) %>%
  summarise(num = sum(Total)) %>%
  arrange(desc(num)) %>%
  filter(row_number() == 1) %>%
  pull(Year)
  
View(most_passengers_year) # 2019 

# 4. Which months out of all the years had the most passengers?
least_passengers_month <- passengers_report %>%
  mutate(data_dte = as.Date(passengers_report$data_dte, "%m/%d/%Y")) %>%  
  group_by(data_dte) %>% 
  filter(Total == max(passengers_report$Total, na.rm = TRUE)) %>% 
  pull(data_dte)
  
View(least_passengers_month) # 1990-03

# 5.Which month had the lowest average number of passengers?
lowest_avg_passenger <- passengers_report %>%
  mutate(data_dte = as.Date(passengers_report$data_dte, "%m/%d/%Y")) %>%  
  group_by(data_dte) %>%
  summarize(avg_passengers = mean(Total, na.rm = TRUE)) 
  
lowest_avg_passenger <- filter(lowest_avg_passenger, avg_passengers == min(avg_passengers)) %>%
  pull(data_dte) # 1991-02-01
  
View(lowest_avg_passenger)
  







