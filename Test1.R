print("*********This is our Test File**********")

companies.dataframe <- read.delim("companies.txt")
rounds2.dataframe <- read.csv("rounds2.csv")

head(companies.dataframe)
head(rounds2.dataframe)

unique_company_rounds2 <- unique(rounds2.dataframe$company_permalink)
unique_company_companies <- unique(companies.dataframe$name)
