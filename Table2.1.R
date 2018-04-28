library(tidyr)
library(dplyr)
library(stringr)

# Pre-Requisite : need 'master_frame' from Table 1.1

round_type_groups <- group_by(master_frame, funding_round_type)
avg_funding_amount <- summarise(round_type_groups, fund_amt=mean(raised_amount_usd, na.rm = T))

# Average funding amount of Venture type
venture_type_avg_funding <- subset(avg_funding_amount, funding_round_type == 'venture')
paste('Average funding amount of Venture type: ', venture_type_avg_funding$fund_amt)

# Average funding amount of Angel type
angel_type_avg_funding <- subset(avg_funding_amount, funding_round_type == 'angel')
paste('Average funding amount of Angel type: ', angel_type_avg_funding$fund_amt)

# Average funding amount of Seed type
seed_type_avg_funding <- subset(avg_funding_amount, funding_round_type == 'seed')
paste('Average funding amount of Seed type: ', seed_type_avg_funding$fund_amt)

# Average funding amount of Private equity type
prv_equity_type_avg_funding <- subset(avg_funding_amount, funding_round_type == 'private_equity')
paste('Average funding amount of Private Equity type: ', prv_equity_type_avg_funding$fund_amt)

# Considering that Spark Funds wants to invest between 5 to 15 million USD 
# per investment round, which investment type is the most suitable for it?
suitable_investment_type <- subset(avg_funding_amount, fund_amt > 500000 & fund_amt > 1500000)
print('Investment type is the most suitable for Spark Fund: ')
print(suitable_investment_type$funding_round_type)
