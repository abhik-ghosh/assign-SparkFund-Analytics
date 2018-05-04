#################################################################
# Objective: Funding Type(FT) Analysis
# Input 1 : 'master_frame' from Checklist 1
#################################################################

library(tidyr)
library(dplyr)
library(stringr)

round_type_groups <- group_by(master_frame, funding_round_type)
avg_funding_amount <- summarise(round_type_groups, fund_amt=mean(raised_amount_usd, na.rm = T))
avg_funding_amount <- arrange(avg_funding_amount,-fund_amt)
total_funding_amount <- summarise(round_type_groups, fund_amt=sum(raised_amount_usd, na.rm = T))



# Average funding amount of Venture type
venture_type_avg_funding <- subset(avg_funding_amount, funding_round_type == 'venture')
venture_type_total_funding <- subset(total_funding_amount, funding_round_type == 'venture')
#paste('Average funding amount of Venture type: ', venture_type_avg_funding$fund_amt)

# Average funding amount of Angel type
angel_type_avg_funding <- subset(avg_funding_amount, funding_round_type == 'angel')
angel_type_total_funding <- subset(total_funding_amount, funding_round_type == 'angel')
#paste('Average funding amount of Angel type: ', angel_type_avg_funding$fund_amt)

# Average funding amount of Seed type
seed_type_avg_funding <- subset(avg_funding_amount, funding_round_type == 'seed')
seed_type_total_funding <- subset(total_funding_amount, funding_round_type == 'seed')
#paste('Average funding amount of Seed type: ', seed_type_avg_funding$fund_amt)

# Average funding amount of Private equity type
prv_equity_type_avg_funding <- subset(avg_funding_amount, funding_round_type == 'private_equity')
prv_equity_type_total_funding <- subset(total_funding_amount, funding_round_type == 'private_equity')
#paste('Average funding amount of Private Equity type: ', prv_equity_type_avg_funding$fund_amt)

# Considering that Spark Funds wants to invest between 5 to 15 million USD 
# per investment round, which investment type is the most suitable for it?
suitable_investment_type <- subset(avg_funding_amount, fund_amt > 5000000 & fund_amt < 15000000)
suitable_investment_type <- arrange(suitable_investment_type, -fund_amt)
#print('Investment type is the most suitable for Spark Fund: ')
#print(suitable_investment_type$funding_round_type)

# Workspace Clean-Up
#rm(round_type_groups, avg_funding_amount)

# Solution

# Average funding amount of venture type
venture_type_avg_funding$fund_amt

# Average funding amount of angel type
angel_type_avg_funding$fund_amt

# Average funding amount of seed type
seed_type_avg_funding$fund_amt

# Average funding amount of private equity type
prv_equity_type_avg_funding$fund_amt

# Considering that Spark Funds wants to invest 
# between 5 to 15 million USD per investment round, 
# which investment type is the most suitable for it?
suitable_investment_type$funding_round_type

setwd("../R_Scripts")