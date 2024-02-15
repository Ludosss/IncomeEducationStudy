#### Preamble ####
# Purpose: Tests the cleaned datasets to be used for analysis
# Author: Xavier Ibanez-Padron
#         Lexi Knight
# Date: 14 February 2024
# Contact: xavier.ibanezpadron@mail.utoronto.ca,
#          lexi.knight@mail.utoronto.ca
# License: MIT
# Pre-requisites: Run the file 02-data_cleaning.R
# Any other information needed? Data tests from 00-simulate_data.R


#### Workspace setup ####
library(tidyverse)

#### Test data ####
cleaned__data <- read_csv(here::here("outputs", "data", "ESS10_Clean.csv"))

if(any(cleaned__data$`Households Total Income` < 0)) {
  stop("Household Income Decile contains negative values")
}

if(any(cleaned__data$`Households Total Income` > 10)) {
  stop("Household Income Decile contains nonsense values")
}

expected_education <- 1:26
if(!all(levels(cleaned__data$`Highest level of education`) %in% expected_education)) {
  stop("Highest Education contains unexpected levels")
}

if(!all(levels(cleaned__data$`Mother's highest level of education`) %in% expected_education)) {
  stop("Mothers Highest Education contains unexpected levels")
}

if(!all(levels(cleaned__data$`Father's highest level of education`) %in% expected_education)) {
  stop("Fathers Highest Education contains unexpected levels")
}

print("No Error Message? No Problem!")