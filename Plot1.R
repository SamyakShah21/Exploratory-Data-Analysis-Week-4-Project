#It is assumed that the file has been dwnloaded and unzipped.
#The path for the directory may vary.
library(RColorBrewer)

setwd("C:/Users/Samyak/Desktop/Academics/Coursera/Data_Science_JHU_4/Week_4")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png(filename = "plot1.png")
tot_annual_emis <- aggregate(Emissions ~ year, NEI, sum)

with(tot_annual_emis, 
     barplot(height=Emissions/1000, names.arg = year,
             col=brewer.pal(4,"Set1"),xlab = "Year", 
             ylab = expression('PM'[2.5]*' in Kilotons'),
             main = expression('Annual Emission PM'[2.5]*' from 1999 to 2008')))
dev.off()
