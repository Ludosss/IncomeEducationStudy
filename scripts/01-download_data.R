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
bologna_file <- "https://dataverse.harvard.edu/api/access/datafile/4169849?gbrecs=false"
bol_save_to <- "inputs/data/bologna_data.tab"
download.file(bologna_file, destfile = bol_save_to, method = "auto")
#-------------------------Income dataset from Bologna--------------------------#

# Steps to download ESS Round 7 Data:
# Visit this page: 
#   https://ess.sikt.no/en/datafile/9c96a1b2-b027-43c1-8c74-e883f892d0bb/86?tab=0
# Click the red 'Download' button in the top right
# Log in or create account (free, can use google account)
# Click the CSV download option
# Save file into repository as 'inputs/data/ESS7e02_3.csv'