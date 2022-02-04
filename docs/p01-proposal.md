# The Coronavirus’s Effect on Air Travels and the Implications
### # Covid Air-Travels

<p align="center">
INFO-201: Technical Foundations of Informatics - The Information School - University of Washington
WINTER 2022<br/>

By: Monica Dao (xmtdx@uw.edu), John Oh (jho12@uw.edu), Garima Thapa (gt35@uw.edu), Linda Giang (linda71@uw.edu)

Keywords: #Covid #Airlines #Health #Traveling

## Abstract
Our main question is how covid has affected air travel and this impacts the lives of the people that travel. This question is important because covid has pretty much become a part of daily life. Many businesses, especially airlines have suffered losses with the arrival of covid with many people opting for other options to connect with others. To help answer this question, we will find details on the changes in passengers that the airlines receive.

We are concerned with how covid has affected air travel because many people at the University of Washington come from many places around the world. But with covid, traveling long distances will put people at risk to themselves and the people they will be visiting. So would air travel regain its former popularity even with covid around? To address this we will be analyzing the airport traffic, the places that people travel to, and the dates of these trips to compare the changes and trends of how the planes are used.

Consider that the data we get is limited to what is provided by the airlines. This is important as different airlines may collect data differently meaning that the analysis might be slightly inaccurate. Accordingly, we plan to give a range on the changes to account for the slight differences.

## 1. Introduction
The coronavirus that has rapidly spread since early 2020 caused many to be apprehensive towards crowds of people. Airplanes are examples of this, being an enclosed space that seats many people for an average of 3 hours. Due to such concerns, airlines have been seeing a decline in business since March of 2020, with many countries adding travel bans and restrictions. With the introduction of vaccines and safety practices, many are starting to travel by air again. An initial study conducted by the Harvard T.H. Chan School of Public Health concluded that “there is a low risk of COVID-19 transmission on aircraft” [(Barnes, 2020)](https://www.ustravel.org/news/harvard-study-low-risk-covid-19-transmission-when-flying)[^2] as of October 2020. However, with the new covid Omicron variant, the recovery of airline businesses may continue to see limited passengers. There are articles where an airline medical advisor predicted that Omicron will make it “twice or even three times more likely to catch Covid-19 during a flight” [(Whitley, 2021)](https://www.bloomberg.com/news/articles/2021-12-22/omicron-at-least-doubles-risk-of-getting-infected-on-a-plane)[^11].
The trends of passengers may inversely follow the number of cases, but with the effectiveness of the vaccines and the addition of the booster, this may not have to be the case.


## 2. Design Situation
### Framing the topic of concern
Air travel is one of the most prevalent ways of traveling, and it has impacted the way people plan long-term and short-term travel in the United States. But in 2020, Covid-19 has changed the behaviors of people that existed since airlines have become commercialized, which shows the severity Covid-19 had on people’s lives. Not only did it change the behavior of people on using commercial airlines, but it also changed the behavior of airlines, “reducing Domestic departures declined 71.5% in May 2020 as compared to the previous year” [(Hotle, 2020)](https://www.sciencedirect.com/science/article/pii/S2590198220301883)[^4]. Our topic, using air travel data, will present how impactful Covid-19 was to this society by analyzing the behavioral changes of people and airlines during 2020.


### Human Values
There are many reasons behind deciding to opt-out of airline traveling, which one may argue is due to safety concerns. However, this decision goes beyond just safety and is related to unemployment, uncertainty, and psychological hindrance due to Covid-19. For example, in 2020 unemployment in the U.S. rose about 100% from the previous year [(Bureau of Labor Statistics, 2021)](https://www.bls.gov/opub/mlr/2021/article/unemployment-rises-in-2020-as-the-country-battles-the-covid-19-pandemic.htm#:~:text=June%202021-,Unemployment%20rises%20in%202020%2C%20as%20the,battles%20the%20COVID%2D19%20pandemic&text=Total%20civilian%20employment%2C%20as%20measured,3.6%20percent%20to%2013.0%20percent.)[^8]. Such data shows the priority of the people and their values in safety, which originates from deaths and over-hospitalization due to Covid-19.

### Stakeholders
The direct stakeholders are airports and airlines. Airlines worldwide suffered a -$137.7 billion in net loss post covid during 2020, showing the significant impact Covid had on airline profits [(Mazareanu, 2021)](https://www.statista.com/statistics/232513/net-profit-of-commercial-airlines-worldwide/#:~:text=In%202020%2C%20the%20U.S.%20airline,only%20130.85%20billion%20U.S.%20dollars.)[^5]. Any workers of airports and airlines can suffer financial damage from traveling decline, making our data an important part of their operation. Indirect stakeholders are those who wish to travel either for business or personal reasons, as rising in Covid-19 would limit them from using air traveling as an option.

### Benefits and Harms
A benefit of having Covid-19 and Airtravel history data is its sensitivity to trends. Both data can be generally analyzed before significant outbreaks, which means actions can be taken based on an increasing trend in Covid-19 and decreasing trend in air travel, limiting the chance of compromising people’s safety when traveling. Airline workers are able to avoid being in a dangerous situation. However, these data often change drastically throughout periods, creating unpredictability when actions are needed. This could create confusion amongst decision-makers in the airline industry regarding air travel operations, which may contradict policy makers’ decisions.

## 3. Research questions
* How have covid impacted the density of passengers in the various airlines? Are the effects applicable across the airlines? If not, why is that the case?
* What are the general passenger’s reasons for traveling and how has such purposes shifted during the pandemic?
* How has the destination frequency of the airlines shifted throughout the pandemic? What seems to be the reason for such shifts?
* How have the airlines operated to minimize losses and retain customers?
* What does the data being an international report of passengers say about covid’s impact on international travels? How would this affect people living abroad?

Many adjustments had to be made in the daily lives of people including how they interact with people who live far away with them. With airplanes being an enclosed space and passengers seated in close proximity, the risks of covid is increased. Therefore these questions seek to find out how people have been using the various airlines while lessening their risk of covid. We would like to find out whether the airline businesses will stay limited or if people have decided that it’s safer to travel now that vaccines, masks, and disinfections have become more common. The changes in usage of these various airlines can also seek to optimize the usage of planes and decrease the greenhouse gas produced. In 2019, it was seen that 29% of carbon pollution came from the transportation sector [(Sources of Greenhouse Gas Emissions, 2021)](https://www.epa.gov/ghgemissions/sources-greenhouse-gas-emissions#transportation)[^7].



## 4. The Dataset

The dataset is U.S. International Air Traffic data(1990-2020) from Kaggle[^6] on airport and airline traffic by US and international carriers. The data, held in the U.S. Department of Transportation[^3] website, is from the [U.S. International Air Passenger and Freight Statistics Report](https://www.transportation.gov/policy/aviation-policy/us-international-air-passenger-and-freight-statistics-report)[^9] page. This particular dataset is on passengers and holds information on the number of passengers each month and year between two airports serviced by a specific airline. This report is part of the T-100 program and it was developed to allow the public to have access to data on flights internationally. The dataset reports are updated quarterly, and the site has multiple datasets around Passenger, Freight, Departures, Seats. The effect of the pandemic on traffic can be analyzed in the 2020 report.

The T-100 program by the USDOT began on January 1, 1990. It produces reports of foreign airlines operating to and from the United States and traffic reports of both domestic and international operations of U.S. airlines. The reports are submitted by airlines to the Department’s Office of Airline Information of the Bureau of Transportation Statistics. There is a rule that states that data must be confidential for 6 months before reporting.

This dataset is very large and has over 680k rows and 16 columns. Columns are labeled as: data_dte (data date), Year (data year), Month (Data month), usg_apt_id (US Gateway airport ID), usg_apt (US Gateway airport code), usg_wac (US Gateway World area code, to represent a geographic territory), fg_apt_id (Foreign Gateway Airport ID), fg_apt (Foreign Gateway Airport code), fg_wac (Foreign Gateway world area code), airlineid (Airline ID), carrier (IATA assigned air carrier code), carriergroup (Carrier Group Code – 1 denotes US domestic air carrier, 2 is foreign), type (Passengers), Scheduled (metric flown by scheduled service operations), Charter (metric flown by charter operations), and Total (total metric flown by scheduled service and charter operations).

This dataset contains all nonstop commercial passenger traffic traveling between international points and U.S. airports. The data covers the timeline between January 1, 1990 to March 1, 2020. This dataset does not cover all aspects of international travel as nonstop traffic to and from U.S. cities that serve as international gateway will have high numbers.

It should be noted that some traffic continues on a connecting flight due to most international passengers having at least one connecting flight before reaching their final destination. U.S. carriers also serve some international points through an international connection only. Although the data can seem to show that no U.S. carrier serves an international point, the carrier traffic is first moving through a connecting city. There are influences of code-share agreements on this data, and this agreement makes it common for passengers to fly on an aircraft operated by an airline different from the one they bought their ticket from.


## 5. Expected implications
A possible implication for policymakers would be the level of enforcement or lift on travel restrictions. As of right now, different states have different travel policies regarding Covid-19, which are in place by the decision of the policymaker in each state. For technologists, it is expected that they will develop more technology in recording the effects of Covid on air travel as our analysis elaborates on how covid has drastically affected our lives. Another possible implication for technologists would be creating more cost-friendly travel services to minimize losses since fewer people have been traveling. Additionally, we can expect designers to design better ways to make it easier to connect with distanced friends and family without requiring travel by air. Since people are missing out on the in-person experience because of the spread of Covid, designers may improve activities so that people can still enjoy each other from afar.

## 6. Limitations
The database we will be using, Covid-19 Daily Data Updated [(Affan, n.d.)](https://www.kaggle.com/affanazhar/covid19-daily-data-updated/version/6?select=Covid_19_data_version_6.csv)[^1], has updates up to January 30, 2022. Although this information is recent, the latest data records numbers at the peak of reported Covid-19 cases, which may not be an accurate representation of the present-day situation. The statistics provided by the New York Times show that the seven-day average of covid cases reported on January 30, 2022, is 522,965 cases whereas, on February 3, 2022, it is 356,849 cases [(Washington Coronavirus Map and Case Count, 2022)](https://www.nytimes.com/interactive/2021/us/washington-covid-cases.html)[^10]. Because the numbers are changing drastically as each day passes, our data and research may not be as predictive of the future as we hope. In addition to that, the dataset may not be as accurate since we only have the number of Covid cases reported and not the true number of Covid cases throughout the United States.



## Acknowledgement
Thanks to the people who took the time to collect the data that allowed us to do an insightful research for our project. Also thanks to T.A. Samuel for giving us clear instructions and guidance that helped us initiate the proejct.

## Reference
[^1]: Affan, M. (2022, January 30). _covid-19 Daily data Updated._ https://www.kaggle.com/affanazhar/covid19-daily-data-updated/version/6?select=Covid_19_data_version_6.csv

[^2]: Barnes, T. E. (2020, October 29). _Harvard Study: 'Low Risk' of COVID-19 Transmission When Flying._ US Travel Association. Retrieved February 4, 2022, from https://www.ustravel.org/news/harvard-study-low-risk-covid-19-transmission-when-flying

[^3]: Department of Transportation Office of the Assistant Secretary for Aviation and International Affairs. (2022, January 7). _International_Report_Passengers_. data.transportation.gov. Retrieved February 4, 2022, from https://data.transportation.gov/Aviation/International_Report_Passengers/xgub-n9bw

[^4]: Hotle, S., & Mumbower, S. (2020, December 9). _The impact of covid-19 on domestic U.S. Air Travel Operations and commercial airport service._ Transportation Research Interdisciplinary Perspectives. Retrieved February 4, 2022, from https://www.sciencedirect.com/science/article/pii/S2590198220301883

[^5]: Mazareanu, E. (2021, October 5). _Net profit of airlines worldwide 2006-2022._ Statista. Retrieved February 4, 2022, from https://www.statista.com/statistics/232513/net-profit-of-commercial-airlines-worldwide/#:~:text=In%202020%2C%20the%20U.S.%20airline,only%20130.85%20billion%20U.S.%20dollars.

[^6]: Pandey, P. (2021, July 16). _U.S. International Air Traffic Data(1990-2020)_. Kaggle. Retrieved February 4, 2022, from https://www.kaggle.com/parulpandey/us-international-air-traffic-data?select=International_Report_Passengers.csv

[^7]: “Sources of Greenhouse Gas Emissions.” _EPA_, Environmental Protection Agency, 27 July 2021, https://www.epa.gov/ghgemissions/sources-greenhouse-gas-emissions#transportation.

[^8]: U.S. Bureau of Labor Statistics. (n.d.). _Unemployment rises in 2020, as the country battles the COVID-19 pandemic : Monthly Labor Review._ U.S. Bureau of Labor Statistics. Retrieved February 4, 2022, from https://www.bls.gov/opub/mlr/2021/article/unemployment-rises-in-2020-as-the-country-battles-the-covid-19-pandemic.htm#:~:text=June%202021-,Unemployment%20rises%20in%202020%2C%20as%20the,battles%20the%20COVID%2D19%20pandemic&text=Total%20civilian%20employment%2C%20as%20measured,3.6%20percent%20to%2013.0%20percent.

[^9]: U.S. International Air Passenger and Freight Statistics Report. U.S. Department of Transportation. (2022, January 7). Retrieved February 4, 2022, from https://www.transportation.gov/policy/aviation-policy/us-international-air-passenger-and-freight-statistics-report

[^10]: _Washington Coronavirus Map and Case Count._ (2022, February). The New York Times. Retrieved February 4, 2022, from https://www.nytimes.com/interactive/2021/us/washington-covid-cases.html

[^11]: Whitley, A. (2021, December 22). _Is It Safe to Fly Right Now? Omicron May Double Infection Risk on Planes: IATA._ Bloomberg.com. Retrieved February 4, 2022, from https://www.bloomberg.com/news/articles/2021-12-22/omicron-at-least-doubles-risk-of-getting-infected-on-a-plane

## Appendix A: Questions
Up to how many datasets would you recommend us to utilize? How many are too little and how many are too much?
