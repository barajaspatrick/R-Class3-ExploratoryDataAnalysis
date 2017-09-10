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

## take rows containing "coal" in short,name column
SCC_coal <- SCC[grepl("coal", SCC$Short.Name), ] ## returns TRUE values then subsets

## we can now find SCC values that intersect both dataframes
## returns rows in 'NEI' with 
nei <- NEI[NEI$SCC %in% SCC_coal$SCC, ]

nei <- aggregate(nei["Emissions"], by = list(year = nei$year, type = nei$type), sum)

qplot(x = year, y = Emissions, data = nei, color = type, geom = "line") +
        ggtitle("Coal Realated Emissions")

        
        
        
        
        
        
        