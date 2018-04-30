print("*********This is our Test File**********")
rm(list=ls())

#companies.dataframe <- read.delim("companies.txt", stringsAsFactors = F, fileEncoding="UTF-8")
#rounds2.dataframe <- read.csv("rounds2.csv", stringsAsFactors = F, fileEncoding="UTF-8")
companies.dataframe <- read.delim("companies.txt", stringsAsFactors = F)
rounds2.dataframe <- read.csv("rounds2.csv", stringsAsFactors = F)

#head(companies.dataframe)
#head(rounds2.dataframe)

unique_company_rounds2 <- toupper(unique(rounds2.dataframe$company_permalink))
unique_company_companies <- toupper(unique(companies.dataframe$permalink))

#unique_company_rounds2
#unique_company_companies

#unique_company_rounds2_updated <- vector()
#i = 1
#length(unique_company_rounds2)
#repeat {
#    str_val <- as.character(unique_company_rounds2[i])
#    cat("String Length : ", nchar(str_val))
#    unique_company_rounds2_updated <- c(
#    unique_company_rounds2_updated,
#    substring(str_val, 15,nchar(str_val))
#    )
#  print(str_val)
#  i = i + 1
#  if(i > length(unique_company_rounds2))  {
#      rm(unique_company_rounds2, i, str_val)
#      break
#  }
#}

#length(unique_company_rounds2_updated)
#unique_company_rounds2_updated

additional_companies <- setdiff(
  unique_company_rounds2, 
  unique_company_companies
  )

#length(additional_companies)
#additional_companies
