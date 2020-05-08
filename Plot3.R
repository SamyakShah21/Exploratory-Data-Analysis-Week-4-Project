#It is assumed that the file has been dwnloaded and unzipped.
#The path for the directory may vary.

setwd("C:/Users/Samyak/Desktop/Academics/Coursera/Data_Science_JHU_4/Week_4")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)
png(filename = "plot3.png")

balt_data <- subset(NEI, NEI$fips=="24510")
balt_type_year <- aggregate(balt_data$Emissions, 
                                 by=list(balt_data$type, balt_data$year), 
                                 sum)
colnames(balt_type_year) <- c("Type", "Year", "Emissions")

qplot(Year, Emissions, data = balt_type_year, color = Type, geom = "line") +
  ggtitle(expression("Total Emissions of PM"[2.5]*" in Baltimore by pollutant type")) + 
  ylab("Total Emissions (in tons)") + 
  xlab("Year") 

dev.off()