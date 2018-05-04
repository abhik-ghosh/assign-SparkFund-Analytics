setwd("../OutputFiles")
plot2_data <- top9

png(file = "PLOT2_Top9_Countries_FT.png")
barplot(plot2_data$fund_amt,names.arg=plot2_data$country_code,xlab="Country Code",ylab="Total Funding",col="blue",
        main="Top 9 Investment Funding Country",border="black")
dev.off()
setwd("../R_Scripts")