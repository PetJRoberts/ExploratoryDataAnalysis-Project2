#######################################################################
# Question 5

# remove loaded data
#rm(list=ls())

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# load ggplot2
require(ggplot2)

# Assume all onroad sources are motor vehicles
Baltimoredata<-NEI[NEI$fips=="24510",]

Baltimorevehicle<-Baltimoredata[Baltimoredata$type=="ON-ROAD",]

Baltimoreannualvehic<-aggregate(Emissions~year,Baltimorevehicle,sum)

# Create png file
png("plot5.png", width=480, height=480)

vehicplot <- ggplot(Baltimoreannualvehic, aes(year, Emissions))+geom_line()
print(vehicplot)

# Close png file
dev.off()

