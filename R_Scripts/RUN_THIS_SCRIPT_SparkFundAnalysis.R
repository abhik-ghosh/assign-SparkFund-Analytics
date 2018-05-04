# Set Working Directory
# (set the PROJECT Directory as WD, NOT InputFiles path)
setwd("~/SparkFund/upgrad-assign1")

###### Run Checklists #######
setwd("R_Scripts")
source("Checklist1.R")
source("Checklist2.R")
source("Checklist3.R")
source("Checklist4.R")
source("Checklist5.R")

###### Generate Output Files #####
source("Generate_OutputFiles.R")
#Please review OutputFiles directory for Results

###### Generate R Plots ##########
# Please note, these are only to cross check results
# The plots used in Presentation are plotted in Tableau 
source("Plot1.R")
source("Plot2.R")
source("Plot3.R")

# Remove Global Variables. 
# Please comment next line to retain the global variables
rm(list=ls())
