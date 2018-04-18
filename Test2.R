rm(list=ls())

# Read Datasets
companies.dataframe <- read.delim("companies.txt", stringsAsFactors = F, fileEncoding = "latin1")
rounds2.dataframe <- read.csv("rounds2.csv", stringsAsFactors = F, fileEncoding = "latin1")

# Clean Working Data
unique_company_rounds2_temp <- toupper(unique(rounds2.dataframe$company_permalink))
unique_company_companies_temp <- toupper(unique(companies.dataframe$permalink))
#unique_company_rounds2 <- iconv(unique_company_rounds2_temp, from = "UTF-32", to = "latin1")
#unique_company_companies <- iconv(unique_company_companies_temp, from = "UTF-32", to = "latin1")
unique_company_rounds2 <- unique_company_rounds2_temp
unique_company_companies <- unique_company_companies_temp
rm(unique_company_rounds2_temp, unique_company_companies_temp)

# Find Diff in two Company Vectors 
diff_company <- setdiff(unique_company_rounds2,unique_company_companies)
length(diff_company)
print(diff_company)
rm(unique_company_rounds2, unique_company_companies)

# Merging two datasets
company_rounds2_temp <- rounds2.dataframe$company_permalink
company_companies_temp <- companies.dataframe$permalink
#company_rounds2 <- iconv(company_rounds2_temp, from = "UTF-32", to = "latin1")
#company_companies <- iconv(company_companies_temp, from = "UTF-32", to = "latin1")
company_rounds2 <- company_rounds2_temp
company_companies <- company_companies_temp
companies.dataframe$permalink_temp <- toupper(company_companies)
rounds2.dataframe$permalink_temp <- toupper(company_rounds2)
rm(company_rounds2_temp, company_companies_temp)

summary(company_companies)
company_companies
str(companies.dataframe)

master_dataframe <- merge(rounds2.dataframe, companies.dataframe, by="permalink_temp")



#
aggregate(funding_round_type~raised_amount_usd, master_dataframe,sum)