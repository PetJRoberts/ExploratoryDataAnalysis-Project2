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

annualcoal<-aggregate(Emissions~year+type,Baltimoredata,sum)

# Create png file
png("plot4.png", width=480, height=480)
coalplot <- ggplot(annualcoal, aes(year, Emissions))+geom_line()
print(coalplot)

# Close png file
dev.off()

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

Annualvehic<-aggregate(Emissions~year&fips,Vehicdata,sum)

# Add location data
Annualvehic$location[Annualvehic$fips=="24510"]<-"Baltimore, MD"
Annualvehic$location[Annualvehic$fips=="06037"]<-"Los Angeles, CA"

# Create png file
png("plot6.png", width=480, height=480)

locplot <- ggplot(Annualvehic, aes(year, Emissions,color = location))+geom_line()
print(locplot)

# Close png file
dev.off()

