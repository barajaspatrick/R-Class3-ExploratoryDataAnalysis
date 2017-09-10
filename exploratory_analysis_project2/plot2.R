##wd switch
setWd = 1
if (setWd == 1) {
        setwd("~/Documents/DataSci_Coursera_WorkingDir/Class4_exploratory_data_analysis/exploratory_analysis_ project2")
}

library(dplyr)
library(data.table)

SCC <- readRDS("./exdata%2Fdata%2FNEI_data/Source_Classification_Code.rds")
NEI <- readRDS("./exdata%2Fdata%2FNEI_data/summarySCC_PM25.rds")

## sep baltimore data 
NEI <- filter(NEI, fips == "24510")

nei <- aggregate(NEI["Emissions"], by = list(year = NEI$year), sum)

attach(nei)
plot(Emissions~year, data = nei, type = "l")
title(main = "Baltimore ppm from 1999 - 2008")

## there seems to be a slight decrease in pm from 1999 - 2008













