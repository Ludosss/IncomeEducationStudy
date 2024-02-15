#### Preamble ####
# Purpose: Downloads and saves the data from dataverse.harvard.edu
# Author: Lexi Knight,
#         Xavier Ibanez-Padron
# Date: 12 February 2024
# Contact: xavier.ibanezpadron@mail.utoronto.ca,
#          lexi.knight@mail.utoronto.ca
# License: MIT
# Pre-requisites: N/A


#### Workspace setup ####
library(tidyverse)
#### Download+Save data ####

#-------------------------Income dataset from Bologna--------------------------#
# Open the link below to manually download the dataset
bologna_file <- "https://dataverse.harvard.edu/api/access/datafile/4169849?gbrecs=false"
bol_save_to <- "inputs/data/bologna_data.tab"
download.file(bologna_file, destfile = bol_save_to, method = "auto")
#-------------------------Income dataset from Bologna--------------------------#

# Steps to download ESS Round 10 Data:
# Visit this page: 
#   https://ess.sikt.no/en/datafile/f37d014a-6958-42d4-b03b-17c29e481d3d/259?tab=0
# Click the red 'Download' button in the top right
# Log in or create account (free, can use google account)
# Click the CSV download option
# Save file into repository as 'inputs/data/ESS10.csv'