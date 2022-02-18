# Load packages
library(dplyr)
library(tidyverse)

# Set Working Directory
setwd("~/Documents/INFO_201/final-project-Covid_Airtravel-/source")

# Import Data 
International_Report_Passengers <- read.csv(
  "../Data/International_Report_Passengers.csv",
  header = TRUE,
  stringsAsFactors = FALSE
)

# International Report Passengers Dataframe Manipulation 
Passengers_Report <- International_Report_Passengers %>% 
  filter(Month <= 3) %>% 
  group_by(Year) %>% 
  summarize(total_passengers = sum(Total)) %>% 
  mutate(percent_total = round((total_passengers / sum(total_passengers) * 100), 2)) %>% 
  mutate(shift = lead(Passengers_Report$total_passengers, default = 0)) %>% 
  mutate(percent_increase = round(((shift - total_passengers) / total_passengers) * 100, 2)) %>% 
  mutate(percent_increase = lag(Passengers_Report$percent_increase, default = NA)) %>% 
  select(-shift) %>% 
  rename(janurary_to_march_each_year = Year)




