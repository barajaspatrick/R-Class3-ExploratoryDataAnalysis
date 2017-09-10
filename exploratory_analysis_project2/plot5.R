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

nei <- subset(NEI, fips == "24510" & type == "ON-ROAD")

emi <- ggplot(nei, aes(x = factor(year), y = Emissions, fill = fips, color = fips))
        emi + geom_bar(stat = "identity") + ggtitle("ppm 2.5 1999 - 2009")
