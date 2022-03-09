library(ggplot2)
library(dplyr)

passengers_report <- read.csv("https://raw.githubusercontent.com/info-201a-wi22/final-project-Covid-Air-Travels/main/data/International_Report_Passengers.csv")

three_months <- passengers_report %>%
  select(Year, Month, Total, carrier) %>%
  filter(Month > 0 & Month < 4) 

aa_avg <- three_months %>%
  filter(carrier == "AA") %>%
  group_by(Year) %>%
  summarize(aa = mean(Total, na.rm = TRUE)) %>%
  select(Year, aa)
dl_avg <- three_months %>%
  filter(carrier == "DL") %>%
  group_by(Year) %>%
  summarize(dl = mean(Total, na.rm = TRUE)) %>%
  select(Year, dl)
wn_avg <- three_months %>%
  filter(carrier == "WN") %>%
  group_by(Year) %>%
  summarize(wn = mean(Total, na.rm = TRUE)) %>%
  select(Year, wn)
ua_avg <- three_months %>%
  filter(carrier == "UA") %>%
  group_by(Year) %>%
  summarize(ua = mean(Total, na.rm = TRUE)) %>%
  select(Year, ua)
all_avg <- three_months %>%
  group_by(Year) %>%
  summarize(all = mean(Total, na.rm = TRUE)) %>%
  select(Year, all)

avg_passengers <- inner_join(aa_avg, dl_avg, by = "Year") %>% inner_join(wn_avg, by = "Year") %>%
  inner_join(ua_avg, by = "Year") %>% inner_join(cz_avg, by = "Year") %>% inner_join(all_avg, by = "Year")

chart3 <- ggplot(data = avg_passengers, aes(x = Year, y = all)) +
  geom_bar(stat = "identity", fill = "blue") +
  labs(y = "Average number of passengers", x = "Year") +
  ggtitle("Average number of passengers by airline by year")
 
