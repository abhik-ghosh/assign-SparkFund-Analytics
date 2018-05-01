# Need 'master_frame' from Checkilist 1 and 
# 'suitable_investment_type' from Checklist 2

# filtering data based on the suitable funding types
filtered_data <- master_frame[
  which(master_frame$funding_round_type == 
          suitable_investment_type$funding_round_type),]


country_groups <- group_by(filtered_data, country_code)
country_funding_amount <- summarise(
                            country_groups, 
                            fund_amt=sum(raised_amount_usd, na.rm = T))

country_funding_amount <- arrange(country_funding_amount, -fund_amt)

top9 <- head(country_funding_amount, 9)

# Workspace Clean-Up
rm(filtered_data, country_groups, country_funding_amount)

# Solution(Manually check country list - 
# http://www.emmir.org/fileadmin/user_upload/admission/Countries_where_English_is_an_official_language.pdf)
# 1. Top English-speaking country
# ---> USA
# 2. Second English-speaking country
# ---> GBR
# 3. Third English-speaking country
# ---> IND


setwd("../R_Scripts")