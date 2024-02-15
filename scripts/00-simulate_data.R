#### Preamble ####
# Purpose: Simulates households net income decile, highest education level,
#          mothers highest education level, and fathers highest education level
# Author: Xavier Ibanez-Padron
#         Lexi Knight
# Date: 14 February 2024
# Contact: xavier.ibanezpadron@mail.utoronto.ca,
#          lexi.knight@mail.utoronto.ca
# License: MIT
# Pre-requisites: N/A
# Any other information needed? N/A

#### Workspace setup ####
library(tidyverse)
#### Simulate data ####

# For reproducibility
set.seed(616)

# Inspired by code from: https://tellingstorieswithdata.com/02-drinking_from_a_fire_hose.html#simulate

# We will simulate 100 data points
sim_data <- 
  tibble(
    # Randomly pick education level (1-26)
    "Highest Education" = sample(1:26, 100, replace = TRUE),
    
    # Randomly pick mothers education level (1-26)
    "Highest Education - Mother" = sample(1:26, 100, replace = TRUE),
    
    # Randomly pick fathers education level (1-26)
    "Highest Education - Father" = sample(1:26, 100, replace = TRUE),
    
    # Randomly pick household income decile (1-10)
    "Household Income Decile" = sample(1:10, 100, replace = TRUE),
  )

#---------Graphing education level vs parents education level (average)--------#
avg_edu_parents <- sim_data |>
  group_by(`Highest Education`) |>
  summarize(Average_Education_Mother = mean(`Highest Education - Mother`),
            Average_Education_Father = mean(`Highest Education - Father`)) |>
  ungroup()

ggplot(avg_edu_parents, aes(x = `Highest Education`)) +
  geom_line(aes(y = Average_Education_Mother, color = "Mother")) +
  geom_line(aes(y = Average_Education_Father, color = "Father")) +
  labs(title = "Average Parental Education by Individual's Education Level",
       x = "Individual's Education Level",
       y = "Average Education Level") +
  scale_color_manual(values = c("Mother" = "blue", "Father" = "red"),
                     name = "Parent",
                     labels = c("Mother", "Father")) +
  theme_minimal()
#---------Graphing education level vs parents education level (average)--------#

#--------------Graphing education level vs income decile (average)-------------#
avg_income_decile <- sim_data |>
  group_by(`Highest Education`) |>
  summarize(Average_Income_Decile = mean(`Household Income Decile`)) |>
  ungroup()

# Plot
ggplot(avg_income_decile, aes(x = `Highest Education`, y = Average_Income_Decile)) +
  geom_line(color = "purple") +
  labs(title = "Average Household Income Decile by Education Level",
       x = "Education Level",
       y = "Average Income Decile") +
  theme_minimal()
#--------------Graphing education level vs income decile (average)-------------#

# ----------------------------------TESTS! :D----------------------------------#
if(any(sim_data$`Household Income Decile` < 0)) {
  stop("Household Income Decile contains negative values")
}

if(any(sim_data$`Household Income Decile` > 10)) {
  stop("Household Income Decile contains nonsense values")
}

expected_education <- 1:26
if(!all(levels(sim_data$`Highest Education`) %in% expected_education)) {
  stop("Highest Education contains unexpected levels")
}

if(!all(levels(sim_data$`Highest Education - Mother`) %in% expected_education)) {
  stop("Highest Education contains unexpected levels")
}

if(!all(levels(sim_data$`Highest Education - Father`) %in% expected_education)) {
  stop("Highest Education contains unexpected levels")
}
# ----------------------------------TESTS! :D----------------------------------#