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

NEI <- filter(NEI, fips == "24510")

nei <- aggregate(NEI["Emissions"], by = list(type = NEI$type, year = NEI$year), sum)


NEI$type <- as.factor(NEI$type)

baltimore <- ggplot(nei, aes(x = year, y = Emissions, group = type, color = type))+ 
        geom_line() + facet_wrap(~type)



