##wd switch
setWd = 1
if (setWd == 1) {
        setwd("~/Documents/DataSci_Coursera_WorkingDir/Class4_exploratory_data_analysis/exploratory_analysis_ project2")
}

library(dplyr)
library(data.table)
library(ggplot2)
library(plyr)

SCC <- readRDS("./exdata%2Fdata%2FNEI_data/Source_Classification_Code.rds")
NEI <- readRDS("./exdata%2Fdata%2FNEI_data/summarySCC_PM25.rds")

nei <- subset(NEI, fips == "24510" | fips == "06037" & type == "ON-ROAD")

nei2 <- aggregate(nei["Emissions"], by = list(city = nei$fips, year = nei$year, type = nei$type), sum)
nei2$city <- as.factor(nei2$city)

qplot(x = year, y = Emissions, data = nei2, geom = "smooth", color = city) + 
        ggtitle("Emissions in Baltimore, VS. LA County")

        