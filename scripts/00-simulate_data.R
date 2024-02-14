#### Preamble ####
# Purpose: Simulates... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? Install the readstata13 package via
#                               install.packages("readstata13")


#### Workspace setup ####
library(tidyverse)
library(data.table)
#### Simulate data ####
column = c("smegbli", "smegbhw")
data <- fread("inputs/data/ESS7e02_3.csv", select = column)


