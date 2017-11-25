#######################################################################
# Question 3

# remove loaded data
#rm(list=ls())

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# load ggplot2
require(ggplot2)

Baltimoredata<-NEI[NEI$fips=="24510",]

Baltimoretype<-aggregate(Emissions~year+type,Baltimoredata,sum)

# Create png file
png("plot3.png", width=480, height=480)
typeplot <- ggplot(Baltimoretype, aes(year, Emissions, color = type))+geom_line()
print(typeplot)

# Close png file
dev.off()

