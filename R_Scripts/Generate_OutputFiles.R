checklist1_table_question <- c(
  "How many unique companies are present in rounds2?",
  "How many unique companies are present in companies?",
  "In the companies data frame, which column can be used as the unique key for each company? Write the name of the column.",
  "Are there any companies in the rounds2 file which are not present in companies? Answer yes or no: Y/N",
  "Merge the two data frames so that all variables (columns) in the companies frame are added to the rounds2 data frame. Name the merged frame master_frame. How many observations are present in master_frame?"
)
setwd("../OutputFiles")
write.csv(master_frame, "01-master_frame.csv", row.names = F)
checklist1_table_answers <- c(
  rounds2_unique, companies_unique, colnames(unique_key_col),missing_name_YN, 
  "Please refer to 'master_frame.csv'"
)
checklist1_write_data <- data.frame(checklist1_table_question,checklist1_table_answers)


write.csv(checklist1_write_data, "checklist1.csv",row.names = F)
#################################################################
checklist2_table_question <- c(
  "Average funding amount of venture type",
  "Average funding amount of angel type",
  "Average funding amount of seed type",
  "Average funding amount of private equity type",
  "Considering that Spark Funds wants to invest between 5 to 15 million USD per investment round, which investment type is the most suitable for it?"
)

checklist2_table_answers <- c(
  venture_type_avg_funding$fund_amt, 
  angel_type_avg_funding$fund_amt,
  seed_type_avg_funding$fund_amt,
  prv_equity_type_avg_funding$fund_amt,
  suitable_investment_type$funding_round_type
)
write.csv(avg_funding_amount,"02-funding_type_analysis.csv", row.names = F)
checklist2_write_data <- data.frame(checklist2_table_question,checklist2_table_answers)
write.csv(checklist2_write_data, "checklist2.csv", row.names = F)
##################################################################
checklist3_table_question <- c(
  "Country List from Analysis",
  "Top English-speaking country",
  "Second English-speaking country",
  "Third English-speaking country"
)
write.csv(top9,"03-country_analysis.csv", row.names = F)
checklist3_table_answers <- c(
  toString(top9),"USA", "GBR", "IND"
)
checklist3_write_data <- data.frame(checklist3_table_question,checklist3_table_answers)
write.csv(checklist3_write_data, "checklist3.csv", row.names = F)
##################################################################
checklist4_table_question <- c(
  "Code for a merged data frame with each primary sector mapped to its main sector "
)
write.csv(master_data_sector,"04-sector_analysis.csv", row.names = F)
checklist4_table_answers <- c(
  "Please refer to 'sector_analysis.csv'"
)
checklist4_write_data <- data.frame(checklist4_table_question,checklist4_table_answers)
write.csv(checklist4_write_data, "checklist4.csv", row.names = F)
##################################################################
checklist5_table_question <- c(
  "1. Total number of investments (count)",
  "2. Total amount of investment (USD)",
  "3. Top sector (based on count of investments)",
  "4. Second-best sector (based on count of investments)",
  "5. Third-best sector (based on count of investments)",
  "6. Number of investments in the top sector (refer to point 3)",
  "7. Number of investments in the second-best sector (refer to point 4)",
  "8. Number of investments in the third-best sector (refer to point 5)",
  "9. For the top sector count-wise (point 3), which company received the highest investment?",
  "10. For the second-best sector count-wise (point 4), which company received the highest investment?"
)

checklist5_table_answers_col1 <- c(
  D1_total_no_of_investment,
  D1_total_amt_of_investment,
  D1_top_sector_count_based$main_sector[1],
  D1_top_sector_count_based$main_sector[2],
  D1_top_sector_count_based$main_sector[3],
  D1_top_sector_count_based$count_of_Investment[1],
  D1_top_sector_count_based$count_of_Investment[2],
  D1_top_sector_count_based$count_of_Investment[3],
  D1_highest_investment_company$name,
  toString(D1_2nd_highest_investment_company$name)
)
checklist5_table_answers_col2 <- c(
  D2_total_no_of_investment,
  D2_total_amt_of_investment,
  D2_top_sector_count_based$main_sector[1],
  D2_top_sector_count_based$main_sector[2], 
  D2_top_sector_count_based$main_sector[3],
  D2_top_sector_count_based$count_of_Investment[1],
  D2_top_sector_count_based$count_of_Investment[2],
  D2_top_sector_count_based$count_of_Investment[3],
  D2_highest_investment_company$name,
  D2_2nd_highest_investment_company$name
)
checklist5_table_answers_col3 <- c(
  D3_total_no_of_investment,
  D3_total_amt_of_investment,
  D3_top_sector_count_based$main_sector[1],
  D3_top_sector_count_based$main_sector[2],
  toString(c(D3_top_sector_count_based$main_sector[3],D3_top_sector_count_based$main_sector[4])),
  D3_top_sector_count_based$count_of_Investment[1],
  D3_top_sector_count_based$count_of_Investment[2],
  D3_top_sector_count_based$count_of_Investment[3],
  toString(D3_highest_investment_company$name),
  D3_2nd_highest_investment_company$name
)
checklist5_write_data <- data.frame(checklist5_table_question,D1=checklist5_table_answers_col1, D2=checklist5_table_answers_col2, D3=checklist5_table_answers_col3)
write.csv(checklist5_write_data, "checklist5.csv", row.names = F)
setwd("../R_Scripts")