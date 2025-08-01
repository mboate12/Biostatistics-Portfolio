
# COVID-19 Trend Analysis in the US, India, and Brazil
# Author: Mary Boateng 
   
# Data set from: https://covid.ourworldindata.org/data/owid-covid-data.csv

#Step 1: Set Working Directory
setwd("C:/Users/mboat/OneDrive/covid_trend_Project")
list.files()


#Step 2: Load Required Packages
library(tidyverse)

#Step 3: Import the COVID-19 Dataset
covid_data <- read.csv("owid-covid-data.csv.csv")

#Step 4: Preview and Understand the Data
head(covid_data)
colnames(covid_data)

# Step 5: Filter Data for US, India, and Brazil (2022 and beyond)
covid_selected <- covid_data %>%
  filter(location %in% c("United States", "India", "Brazil"),
         date >= "2022-01-01") %>%
  select(date, location, new_cases)

#cleaning data; removing all 0 and missing values 

covid_clean <- covid_selected %>%
  filter(!is.na(new_cases), new_cases != 0)

#converting date column from a character to a proper Date format,
covid_clean$date <- as.Date(covid_clean$date)


# Step 6: Create Line Graph of Daily New Cases with ggplot2

ggplot(covid_clean, aes(x = date, y = new_cases, color = location)) +
  geom_line(size = 1) +
  labs(title = "COVID-19 New Cases Over Time after 2022",
       x = "Date",
       y = "New Cases",
       color = "Country") +
  theme_minimal()






  

