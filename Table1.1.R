# install.packages("tidyr")
# install.packages("dplyr")
library(tidyr)
library(dplyr)

# Clear Workspace - remove all global environments
rm(list=ls())

# Read Data from the sources
rounds2_data <- read.csv('rounds2.csv')
companies_data <- read.delim('companies.txt')

no_of_unique_companies_in_companies <- unique(companies_data$permalink)
no_of_unique_companies_in_rounds2 <- unique(rounds2_data$company_permalink)