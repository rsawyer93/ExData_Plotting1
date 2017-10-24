#Script to create plot2

#set working dir to where current data is stored
setwd("C:/Users/Rob/Documents/exdata_data_household_power_consumption")

#read in full dataset
epc <- read.csv("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?")

#create filtered data set for specific dates
fepc <- subset(epc, Date == "1/2/2007" | Date == "2/2/2007")

#Add a combined datetime column to table
fepc$dtime <- as.POSIXct(paste(fepc$Date, fepc$Time), format="%d/%m/%Y %H:%M:%S")

#create png file device
png(filename="plot2.png", width=480, height=480)
#create the plot
with(fepc, plot(dtime, Global_active_power, type="l", xlab="",ylab="Global Active Power (kilowatts)"))
#close the file device
dev.off()