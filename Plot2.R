#######################################################################
# Question 2

# remove loaded data
#rm(list=ls())

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

Baltimoredata<-NEI[NEI$fips=="24510",]

Baltimoreannual<-aggregate(Emissions~year,Baltimoredata,sum)

# Create png file
png("plot2.png", width=480, height=480)

plot(Baltimoreannual)

# Close png file
dev.off()

