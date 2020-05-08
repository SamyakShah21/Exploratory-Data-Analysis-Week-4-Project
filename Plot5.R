#It is assumed that the file has been dwnloaded and unzipped.
#The path for the directory may vary.

setwd("C:/Users/Samyak/Desktop/Academics/Coursera/Data_Science_JHU_4/Week_4")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png(filename = "plot5.png")

balt_car_data <- subset(NEI, NEI$fips=="24510" 
                             & NEI$type=="ON-ROAD")
balt_car_year <- aggregate(balt_car_data$Emissions, 
                                by=list(balt_car_data$year), sum)
colnames(balt_car_year) <- c("Year", "Emissions")

plot(balt_car_year$Year, balt_car_year$Emissions,
     type = "l",
     xlab = "year",
     ylab = expression('Total Emission of PM'[2.5]*' in Baltimore'),
     main = expression('Total Emission PM'[2.5]*' in Baltimore due to motor vehicles'),
     col='red'
     )

dev.off()