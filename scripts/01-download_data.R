#### Preamble ####
# Purpose: Downloads and saves the data from dataverse.harvard.edu
# Author: Xavier Ibanez-Padron, Lexi Knight
# Date: 12 February 2024
# Contact: xavier.ibanezpadron@mail.utoronto.ca
# License: MIT
# Pre-requisites: Install the "dataverse" package via
#                 'install.packages("dataverse")' in console


#### Workspace setup ####
library(tidyverse)
#### Download+Save data ####

#-------------------------Income dataset from Bologna--------------------------#
file <- "https://dataverse.harvard.edu/api/access/datafile/4169849?gbrecs=false"
save_to <- "inputs/data/bologna_data.tab"
download.file(file, destfile = save_to, method = "auto")
#-------------------------Income dataset from Bologna--------------------------#