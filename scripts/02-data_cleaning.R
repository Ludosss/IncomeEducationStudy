#### Preamble ####
# Purpose: Cleans the raw plane ESS Round 10 data
# Author: Xavier Ibanez-Padron
#         Lexi Knight
# Date: 14 February 2024
# Contact: xavier.ibanezpadron@mail.utoronto.ca,
#          lexi.knight@mail.utoronto.ca
# License: MIT
# Pre-requisites: Run the file 01-download_data.R and follow all instructions
#                 Install the package 'data.table' via
#                 install.packages("data.table")
# Any other information needed? N/A

#### Workspace setup ####
library(tidyverse)
library(data.table)
#### Clean data ####

# Fetch data with only necessary columns
columns = c("edlvdfr", "edlvmdfr", "edlvfdfr", "hinctnta")
raw_data <- fread("inputs/data/ESS10.csv", select = columns)

# Remove NA rows (non-French data points)
semi_clean_data <- na.omit(raw_data)

# Remove unusable data points (no answer, refuse, unsure, etc.)
bad_values <- c(77, 88, 99, 5555, 7777, 8888, 9999)

cleaned_data <- semi_clean_data |>
  filter(!if_any(everything(), ~ .x %in% bad_values))

# Rename columns
new_cols <- c("Highest level of education",
              "Mother's highest level of education",
              "Father's highest level of education",
              "Households Total Income")

setnames(cleaned_data, old = columns, new = new_cols)

# Save data to new file
write_csv(cleaned_data, "outputs/data/ESS10_Clean.csv")