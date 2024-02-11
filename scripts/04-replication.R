library(tidyverse)
library(haven)
library(ggplot2)
library(dplyr)

#---------------------------- Main data fetching layer ------------------------#
raw_data <- read_dta("inputs/data/analysis_clean.dta")
data <- select(raw_data, c('voted', 'hh_income', 'year'))

# Order people into income deciles and quintiles
data <- data |>
  mutate(income_decile = ntile(data$hh_income, 10)) |>
  mutate(income_quintile = ntile(data$hh_income, 5))
#---------------------------- Main data fetching layer ------------------------#

#----------------------------- First Replication ------------------------------#

# Create table with deciles and average income/voter turnpout for that decile
new_data_1 <- data |>
  group_by(income_decile) |>
  summarize(
    average_income = mean(hh_income),
    average_turnout = mean(voted) * 100  # proportion to percentage
  )

status_turnout_plot <- ggplot(new_data_1, aes(x = average_income, y = average_turnout)) +
  geom_point() +
  geom_errorbar(aes(ymin = average_turnout - 5, ymax = average_turnout + 5), width = 1.6) +
  labs(
    title = "The Effects of Economic Status on Voter Turnout",
    x = "Pre-tax Household Income (2010E*1k)",
    y = "Voter Turnout (%)"
  )
#----------------------------- First Replication ------------------------------#

#----------------------------- Second Replication -----------------------------#
# Create table with average voter turnout for each year+quintile combo
average_turnout <- data |>
  group_by(year, income_quintile) |>
  summarize(voter_turnout = mean(voted) * 100)  # Convert proportion to percentage

# Plotting
quintile_turnout_plot <- ggplot(
  average_turnout, aes(
    x = year, 
    y = voter_turnout, 
    group = income_quintile, 
    color = as.factor(income_quintile))) +
  geom_line(aes(linetype = as.factor(income_quintile)), color = 'black') +
  geom_point(aes(shape = as.factor(income_quintile)), color = 'black') +
  scale_linetype_manual(values = 
                          c("solid", "dotted", "dashed", "longdash", "twodash"), 
                        name = 'Quintile') +
  scale_shape_manual(values = c(16, 17, 18, 19, 15), name = 'Quintile') +
  labs(
    title = "Voter Turnout by Income Quintile On Election Years",
    x = "Election Year",
    y = "Voter Turnout (%)"
  ) +
  scale_x_continuous(breaks = unique(average_turnout$year)) + # Adjust the x-axis
  theme_minimal() +
  theme(
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank(),
    panel.grid.major.y = element_blank(),
    panel.grid.minor.y = element_blank()
  )
#----------------------------- Second Replication -----------------------------#

# Presenting the graphs
status_turnout_plot

quintile_turnout_plot
