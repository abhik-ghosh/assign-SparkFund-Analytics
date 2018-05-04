#################################################################
# Objective : Analysis based on countries, main sectors and FT
# Input 1: 'main_sectors' mapped for each company - 
#            master_data_sector(from checklist 4)
# Input 2: Top 3 English Speaking Country - USA, GBR, IND
#           (from checklist 3)
# Input 3: Most Suitable Funding Type - 
#           suitable_investment_type(from checklist 2)
#################################################################

# Select Only Suitable investment types from master data
filtered_data <- master_data_sector[
      which(master_data_sector$funding_round_type == suitable_investment_type$funding_round_type),]

# Function Definition for aggregation and filtering data
getTotalFundingAmtPerSector <- function(input_data_frame) {
  sector_groups <- group_by(input_data_frame, main_sector)
  input_data_frame_total_funding_amount <- summarise(sector_groups, total_amt=sum(raised_amount_usd))
  input_data_frame_total_funding_amount <- arrange(input_data_frame_total_funding_amount, -total_amt)
  return(input_data_frame_total_funding_amount)
}

getInvestmentCountPerSector <- function(input_data_frame) {
  sector_groups <- group_by(input_data_frame, main_sector)
  input_data_frame_count_funding <- summarise(sector_groups, count_of_Investment=sum(!is.na(raised_amount_usd)))
  input_data_frame_count_funding <- arrange(input_data_frame_count_funding, -count_of_Investment)
  return(input_data_frame_count_funding)
}

getFilteredDataPerCountry <- function(input_data_frame, input_country_code) {
  return(subset(input_data_frame, 
                input_data_frame$country_code == input_country_code & 
                input_data_frame$raised_amount_usd > 5000000 & 
                input_data_frame$raised_amount_usd < 15000000)
  )
}

# Creating required Data frames for analysis
D1 <- getFilteredDataPerCountry(filtered_data, 'USA')
D1_count_funding <- getInvestmentCountPerSector(D1)
D1_total_funding_amount <- getTotalFundingAmtPerSector(D1)
D1_merged <- merge(D1_count_funding, D1_total_funding_amount)

D2 <- getFilteredDataPerCountry(filtered_data, 'GBR')
D2_count_funding <- getInvestmentCountPerSector(D2)
D2_total_funding_amount <- getTotalFundingAmtPerSector(D2)
D2_merged <- merge(D2_count_funding, D2_total_funding_amount)

D3 <- getFilteredDataPerCountry(filtered_data, 'IND')
D3_count_funding <- getInvestmentCountPerSector(D3)
D3_total_funding_amount <- getTotalFundingAmtPerSector(D3)
D3_merged <- merge(D3_count_funding, D3_total_funding_amount)


D1_total_no_of_investment <- sum(D1_count_funding$count_of_Investment)
D2_total_no_of_investment <- sum(D2_count_funding$count_of_Investment)
D3_total_no_of_investment <- sum(D3_count_funding$count_of_Investment)

D1_total_amt_of_investment <- sum(D1_total_funding_amount$total_amt)
D2_total_amt_of_investment <- sum(D2_total_funding_amount$total_amt)
D3_total_amt_of_investment <- sum(D3_total_funding_amount$total_amt)

D1_top_sector_count_based <- head(D1_count_funding,3)
D2_top_sector_count_based <- head(D2_count_funding,3)
D3_top_sector_count_based <- head(D3_count_funding,4)

D1_top_sector_count_based[1,1]$main_sector
temp_df <- subset(D1, D1$main_sector == D1_top_sector_count_based[1,1]$main_sector)
D1_highest_investment <- arrange(temp_df, -temp_df$raised_amount_usd)
D1_highest_investment_company <- D1_highest_investment[
  which(
    D1_highest_investment$raised_amount_usd == 
      max(D1_highest_investment$raised_amount_usd)),] 

temp_df <- subset(D1, D1$main_sector == D1_top_sector_count_based[2,1]$main_sector)
D1_2nd_highest_investment <- arrange(temp_df, -temp_df$raised_amount_usd)
D1_2nd_highest_investment_company <- D1_2nd_highest_investment[
  which(
    D1_2nd_highest_investment$raised_amount_usd == 
      max(D1_2nd_highest_investment$raised_amount_usd)),]
#---------
temp_df <- subset(D2, D2$main_sector == D2_top_sector_count_based[1,1]$main_sector)
D2_highest_investment <- arrange(temp_df, -temp_df$raised_amount_usd)
D2_highest_investment_company <- D2_highest_investment[
  which(
    D2_highest_investment$raised_amount_usd == 
      max(D2_highest_investment$raised_amount_usd)),] 

temp_df <- subset(D2, D2$main_sector == D2_top_sector_count_based[2,1]$main_sector)
D2_2nd_highest_investment <- arrange(temp_df, -temp_df$raised_amount_usd)
D2_2nd_highest_investment_company <- D2_2nd_highest_investment[
  which(
    D2_2nd_highest_investment$raised_amount_usd == 
      max(D2_2nd_highest_investment$raised_amount_usd)),]

temp_df <- subset(D3, D3$main_sector == D3_top_sector_count_based[1,1]$main_sector)
D3_highest_investment <- arrange(temp_df, -temp_df$raised_amount_usd)
D3_highest_investment_company <- D3_highest_investment[
  which(
    D3_highest_investment$raised_amount_usd == 
      max(D3_highest_investment$raised_amount_usd)),] 

temp_df <- subset(D3, D3$main_sector == D3_top_sector_count_based[2,1]$main_sector)
D3_2nd_highest_investment <- arrange(temp_df, -temp_df$raised_amount_usd)
D3_2nd_highest_investment_company <- D3_2nd_highest_investment[
  which(
    D3_2nd_highest_investment$raised_amount_usd == 
      max(D3_2nd_highest_investment$raised_amount_usd)),]
  

# Workspace clean-up
#rm(temp_df,filtered_data, master_data_sector)

# Solution Data Frames ----
# 1. Total number of investments(Count)
D1_total_no_of_investment
D2_total_no_of_investment
D3_total_no_of_investment

# 2. Total amount of investment(USD) 
D1_total_amt_of_investment
D2_total_amt_of_investment
D3_total_amt_of_investment

# 3. Country Top sector (based on count of investments)
# 4. Second-best sector (based on count of investments)
# 5. Third-best sector (based on count of investments)
# 6. Number of investments in the top sector 
# 7. Number of investments in the second-best sector
# 8. Number of investments in the third-best sector
D1_top_sector_count_based
D2_top_sector_count_based
D3_top_sector_count_based

# 9. For the top sector count-wise (point 3), 
# which company received the highest investment?
D1_highest_investment_company$name
D2_highest_investment_company$name
D3_highest_investment_company$name

# 10. For the second-best sector count-wise (point 4), 
# which company received the highest investment?
D1_2nd_highest_investment_company$name
D2_2nd_highest_investment_company$name
D3_2nd_highest_investment_company$name

setwd("../R_Scripts")


