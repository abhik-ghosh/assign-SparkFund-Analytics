library(tidyr)
library(dplyr)
library(stringr)
# Read mapping data----
mapping_data <- read.csv("mapping.csv",stringsAsFactors = FALSE)
str(mapping_data)
names(mapping_data)

# Gather(Cleanup) Data------
mapping_data_long <- gather(mapping_data, main_sector, val, Automotive...Sports : Social..Finance..Analytics..Advertising)
mapping_data_long <- mapping_data_long[!(mapping_data_long$val == 0),]
mapping_data_long <- mapping_data_long[,-3]
###Test Result----
subset(mapping_data_long, mapping_data_long$category_list == 'Software')

# Cleanup Master Dataframe
master_data <- master_frame
master_data$category_list
master_data$category_list <- sub("\\|.*", "", master_data$category_list)
###Test Result----
master_data$category_list

# Merging Main Sector to the Masterframe
rm(master_data1)
master_data1 <- merge(master_data,mapping_data_long, 
                      by = "category_list")
tail(master_data1)

