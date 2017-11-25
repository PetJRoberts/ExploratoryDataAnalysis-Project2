#######################################################################
# Question 4

# remove loaded data
#rm(list=ls())

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# load ggplot2
require(ggplot2)

# Find sources with coal in them
coalsources <- grepl("coal", SCC$SCC.Level.Three, ignore.case=TRUE)

# List of SCCs that are coal
coalSCC<-SCC[coalsources,"SCC"]

coalSCC<-data.frame(coalSCC)
colnames(coalSCC)[1]<-"SCC"

coalNEI<-merge(NEI,coalSCC)

annualcoal<-aggregate(Emissions~year,coalNEI,sum)

# Create png file
png("plot4.png", width=480, height=480)
coalplot <- ggplot(annualcoal, aes(year, Emissions))+geom_line()
print(coalplot)

# Close png file
dev.off()

