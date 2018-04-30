
round_type_groups <- group_by(master_frame, funding_round_type)
avg_funding_amount <- summarise(round_type_groups, fund_amt=mean(raised_amount_usd, na.rm = T))
total_funding_amount <- summarise(round_type_groups, fund_amt=sum(raised_amount_usd, na.rm = T))


merged_funding <- merge(avg_funding_amount, total_funding_amount, by='funding_round_type')
merged_funding
venture_avg_funding_amount <- avg_funding_amount[which(
  avg_funding_amount$funding_round_type == 'venture'
),]

venture_total_funding_amount <- total_funding_amount[which(
  total_funding_amount$funding_round_type == 'venture'
),]

barplot(avg_funding_amount$fund_amt, names.arg = avg_funding_amount$funding_round_type,
        border="blue", density=c(10,20,30,40,50)
        )


colors = c("green","orange")
investment_type <- c("venture", "seed", "private equity")
sub_type <- c("Total","Average")

values <- matrix(c(merged_funding$funding_round_type, merged_funding$fund_amt.x,
                   merged_funding$fund_amt.y), nrow = 3, byrow = T)
values
barplot(values)
