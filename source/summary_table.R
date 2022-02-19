# Load packages
library(dplyr)
library(tidyverse)

passengers_report <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-Covid-Air-Travels/main/data/International_Report_Passengers.csv")


# International Report Passengers Dataframe Manipulation 

# Calculate total passengers each year 
Passengers_Report <- passengers_report %>% 
  filter(Month <= 3) %>% 
  group_by(Year) %>% 
  summarize(total_passengers = sum(Total)) 

# Calculate percentage of passengers each year compared to total passengers of all years 
Passengers_Report <- Passengers_Report %>% 
  mutate(percent_total = round((total_passengers / sum(total_passengers) * 100), 2)) %>%   
  mutate(shift = lead(Passengers_Report$total_passengers, default = 0)) 

# Calculate percent increase in passengers from the previous year 
Passengers_Report <- Passengers_Report %>% 
  mutate(percent_increase = round(((shift - total_passengers) / total_passengers) * 100, 2)) 

Passengers_Report <- Passengers_Report %>% 
  mutate(percent_increase = lag(Passengers_Report$percent_increase, default = NA)) %>% 
  select(-shift) %>% 
  rename(janurary_to_march_each_year = Year)
