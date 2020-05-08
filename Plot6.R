#It is assumed that the file has been dwnloaded and unzipped.
#The path for the directory may vary.

setwd("C:/Users/Samyak/Desktop/Academics/Coursera/Data_Science_JHU_4/Week_4")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)
library(dplyr)

png(filename = "plot6.png")

baltla_car_data <- subset(NEI, (NEI$fips=="24510" |NEI$fips=="06037") &
                            NEI$type=="ON-ROAD")
baltla_car_year <- aggregate(baltla_car_data$Emissions, 
                             by=list(baltla_car_data$fips, baltla_car_data$year),
                             sum)
colnames(baltla_car_year) <- c("City", "Year", "Emissions")


png(filename = "plot6.png")

qplot(Year, Emissions, data = baltla_car_year, color = City, geom = "line") +
  ggtitle(expression("Emissions of PM"[2.5]*" in Baltimore (24510) and Los Angeles (06037)")) + 
  ylab("Total Emissions from motor vehicles (in tons)") + 
  xlab("Year") 

dev.off()