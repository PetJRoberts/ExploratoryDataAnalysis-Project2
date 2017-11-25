#######################################################################
# Question 6

# remove loaded data
#rm(list=ls())

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# load ggplot2
require(ggplot2)

Vehicdata<-subset(NEI,fips=="24510"|fips=="06037"& type=="ON-ROAD")

Annualvehic<-aggregate(Emissions~year+fips,Vehicdata,sum)

# Add location data
Annualvehic$location[Annualvehic$fips=="24510"]<-"Baltimore, MD"
Annualvehic$location[Annualvehic$fips=="06037"]<-"Los Angeles, CA"

# Create png file
png("plot6.png", width=480, height=480)

locplot <- ggplot(Annualvehic, aes(year, Emissions,color = location))+geom_line()
print(locplot)

# Close png file
dev.off()

