#Script to create plot1

#set working dir to where current data is stored
setwd("C:/Users/Rob/Documents/exdata_data_household_power_consumption")

#read in full dataset
epc <- read.csv("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?")

#create filtered data set for specific dates
fepc <- subset(epc, Date == "1/2/2007" | Date == "2/2/2007")

#create png file device
png(filename="plot1.png", width=480, height=480)
#create the plot
hist(fepc$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
#close the file device
dev.off()