#It is assumed that the file has been dwnloaded and unzipped.
#The path for the directory may vary.

setwd("C:/Users/Samyak/Desktop/Academics/Coursera/Data_Science_JHU_4/Week_4")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)
library(dplyr)
png(filename = "plot4.png")

coal_SCC <- SCC[grep("[Cc][Oo][Aa][Ll]", SCC$EI.Sector), "SCC"]
coal_NEI <- filter(NEI,SCC %in% coal_SCC)
coal_summary <- coal_NEI %>% group_by(year) %>% summarise(Emissions = sum(Emissions))

plot_4 <- ggplot(coal_summary, aes(x=year, y=round(Emissions/1000,2), fill=year)) +
  ylab(expression('PM'[2.5]*' Emissions in Kilotons')) + xlab("Year") +
  ggtitle("Coal Combustion Emissions, 1999 to 2008.")+
  geom_bar(stat="identity") 

print(plot_4)

dev.off()