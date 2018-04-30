rm(list=ls())
#reading of companies and round2 into dataframe.
#-----------------------------------------------------------------
companies <- read.delim("companies.txt", sep="\t",stringsAsFactors = FALSE, fileEncoding = "latin1")

rounds2 <- read.csv("rounds2.csv",stringsAsFactors = FALSE, fileEncoding = "latin1")

#no of uniques companies in round2
#--------------------------------------------------------------
library(dplyr)

n_distinct(distinct(rounds2, company_permalink))

#no of unique companies in companies
#------------------------------------------------------------
n_distinct(distinct(companies,permalink))

#companies dataframe column for unique key
#------------------------------------------------
nrow(companies)                        


npermalink<-n_distinct(distinct(companies,permalink),na.rm = FALSE)
nname<-n_distinct(distinct(companies,name),na.rm = FALSE)
nhomepage_url<- n_distinct(distinct(companies,homepage_url),na.rm=FALSE)
ncategory_list<- n_distinct(distinct(companies,category_list),na.rm=FALSE)
nstatus<- n_distinct(distinct(companies,status),na.rm=FALSE)
ncountrycode<- n_distinct(distinct(companies,country_code),na.rm=FALSE)
nstatecode<- n_distinct(distinct(companies,state_code),na.rm=FALSE)
nregion<- n_distinct(distinct(companies,region),na.rm=FALSE)
ncity<- n_distinct(distinct(companies,city),na.rm=FALSE)
nfoundedat<- n_distinct(distinct(companies,founded_at),na.rm=FALSE)

unique_key <- data.frame(npermalink,nname,nhomepage_url,ncategory_list,nstatus,
                         ncountrycode,nstatecode,nregion,ncity,nfoundedat)       
unique_key
max(unique_key)
 if(nrow(companies) == max(unique_key))
   print(which.max(unique_key))

#companies in round2 not present in companies
#-----------------------------------------------------
#?sqldf

library(sqldf)
notInComp <- sqldf('SELECT company_permalink FROM rounds2  EXCEPT SELECT permalink FROM companies')



#merging companies in rounds2 database
#-------------------------------------------------

#?merge
#?mutate_all()

#companies <- mutate_all(companies, funs(toupper))
#rounds2<- mutate_all(rounds2, funs(toupper))

companies$permalink <- toupper(companies$permalink)
rounds2$company_permalink <- toupper(rounds2$company_permalink)

master_frame <-merge(rounds2,companies, by.x="company_permalink",
                     by.y="permalink",all=TRUE)


















