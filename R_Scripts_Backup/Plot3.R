setwd("../OutputFiles")
png(file = "PLOT3_USA_Investment_Count.png")
barplot(D1_top_sector_count_based$count_of_Investment,names.arg=D1_top_sector_count_based$main_sector,xlab="Sector",ylab="# of Investment",col="green",
        main="USA Investment Count",border="black")
dev.off()
png(file = "PLOT3_GBR_Investment_Count.png")
barplot(D2_top_sector_count_based$count_of_Investment,names.arg=D2_top_sector_count_based$main_sector,xlab="Sector",ylab="# of Investment",col="yellow",
        main="GBR Investment Count",border="black")
dev.off()
png(file = "PLOT3_IND_Investment_Count.png")
barplot(D3_top_sector_count_based$count_of_Investment,names.arg=D3_top_sector_count_based$main_sector,xlab="Sector",ylab="# of Investment",col="blue",
        main="IND Investment Count",border="black")
dev.off()
setwd("../R_Scripts")