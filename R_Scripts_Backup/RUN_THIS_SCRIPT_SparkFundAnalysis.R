# Set Working Directory
# (set the PROJECT Directory as WD, NOT InputFiles path)
setwd("~/SparkFund/upgrad-assign1")

######Running Checklists#######
setwd("R_Scripts")
source("Checklist1.R")
source("Checklist2.R")
source("Checklist3.R")
source("Checklist4.R")
source("Checklist5.R")

###### Generating Output Files #####
source("Generate_OutputFiles.R")
#Please review OutputFiles directory for Results

###### Generating R Plots ##########
# Please note, this is only for revision of results purpose
# The plots used in Presentation are plotted in Tableau 
source("Plot1.R")
source("Plot2.R")
source("Plot3.R")

#Remove Global Variables
#rm(list=ls())
