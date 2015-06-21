NEI <- readRDS("summarySCC_PM25.rds")
NEI<- transform(NEI, year = factor(NEI$year))
bmi <- subset(NEI, fips == "24510", select = c(Emissions, type, year))
bmiSub <- aggregate(bmi$Emissions, list(Year = bmi$year, type = bmi$type), sum)
colnames(bmiSub)[3] <- "Total_Emissions"
a<-ggplot(bmiSub, aes(x = Year, y = Total_Emissions, color = type) ) + geom_line(aes(group = type)) +   ggtitle("Total Emissions of Different Types by Years")
a
dev.copy(png, file = "plot3")
dev.off()