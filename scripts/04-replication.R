library(tidyverse)
library(haven)
library(ggplot2)
library(dplyr)

raw_data <- read_dta("inputs/data/analysis_clean.dta")
data <- select(raw_data, c('voted', 'hh_income'))

# Order people into income deciles
data <- data |>
  mutate(income_decile = ntile(data$hh_income, 10))

# Create table with deciles and average income/voter turnpout for that decile
new_data <- data |>
  group_by(income_decile) |>
  summarize(
    average_income = mean(hh_income),
    average_turnout = mean(voted)  # This calculates the proportion of individuals who voted in each decile
  )

len <- 0.05

# Plotting data 1

plot <- ggplot(new_data, aes(x = average_income, y = average_turnout)) +
  geom_point() +
  geom_errorbar(aes(ymin = average_turnout - len, ymax = average_turnout + len), width = 1.6) +
  labs(
    title = "The Effects of Economic Status on Voter Turnout",
    x = "Pre-tax Household Income (2010E*1k)",
    y = "Voter Turnout Ratio"
  )

# Presenting the graphs
plot

