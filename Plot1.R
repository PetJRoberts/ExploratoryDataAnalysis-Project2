#######################################################################
# Question 1

# remove loaded data
#rm(list=ls())

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

annualtotal<-aggregate(Emissions~year,NEI,sum)

# Create png file
png("plot1.png", width=480, height=480)

plot(annualtotal)

# Close png file
dev.off()

