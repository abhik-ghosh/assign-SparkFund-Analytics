setwd("../OutputFiles")
ft_data <- read.csv("02-funding_type_analysis.csv")
plot1_data_avg <- subset(ft_data, ft_data$funding_round_type == 'venture' | 
                       ft_data$funding_round_type == 'private_equity' |
                       ft_data$funding_round_type == 'seed' )

#barplot(plot1_data[ ,2], names.arg = plot1_data[ ,1])
png(file = "PLOT1_Avg_Funding_FT.png")
barplot(plot1_data_avg$fund_amt, main="Average Funding Raised USD", xlab="Funding Round Types",  
        ylab="AVG USD", names.arg=c("PrivateEq", "Venture","Seed"), 
        border="blue", density=c(10,20,30))
dev.off()

ft_data <- total_funding_amount
plot1_data_total <- subset(ft_data, ft_data$funding_round_type == 'venture' | 
                             ft_data$funding_round_type == 'private_equity' |
                             ft_data$funding_round_type == 'seed' )

plot1_data_total <- arrange(plot1_data_total, -fund_amt)

png(file = "PLOT1_Total_Funding_FT.png")
barplot(plot1_data_total$fund_amt, main="Total Funding Raised USD", xlab="Funding Round Types",  
        ylab="Total USD", names.arg=c("Venture", "PrivateEq","Seed"), 
        border="blue", density=c(10,20,30))
dev.off()
setwd("../R_Scripts")