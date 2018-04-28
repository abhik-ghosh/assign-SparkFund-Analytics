

# Pre-Requisite : need 'master_frame' from Table 1.1 and 
# 'suitable_investment_type' from Table 2.1

filtered_data <- master_frame[which(master_frame$funding_round_type == suitable_investment_type$funding_round_type),]


country_groups <- group_by(master_frame, country_code)
country_funding_amount <- summarise(country_groups, fund_amt=mean(raised_amount_usd, na.rm = T))

