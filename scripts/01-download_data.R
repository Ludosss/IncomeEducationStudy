#### Preamble ####
# Purpose: Downloads and saves the data from dataverse.harvard.edu
# Author: Lexi Knight,
#         Xavier Ibanez-Padron
# Date: 12 February 2024
# Contact: xavier.ibanezpadron@mail.utoronto.ca,
#          lexi.knight@mail.utoronto.ca
# License: MIT
# Pre-requisites:


#### Workspace setup ####
library(tidyverse)
#### Download+Save data ####

#-------------------------Income dataset from Bologna--------------------------#
bologna_file <- "https://dataverse.harvard.edu/api/access/datafile/4169849?gbrecs=false"
bol_save_to <- "inputs/data/bologna_data.tab"
download.file(bologna_file, destfile = bol_save_to, method = "auto")
#-------------------------Income dataset from Bologna--------------------------#

#------------------------Raw ESS data from rounds 1-8--------------------------#
raw_data_18 <- "https://dataverse.harvard.edu/api/access/datafile/4171832?gbrecs=false"
raw18_save_to <- "inputs/data/raw18.dta"
download.file(raw_data_18, destfile = raw18_save_to, method = "auto")
#------------------------Raw ESS data from rounds 1-8--------------------------#