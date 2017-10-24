#Script to create plot3

#set working dir to where current data is stored
setwd("C:/Users/Rob/Documents/exdata_data_household_power_consumption")
#read in full dataset
epc <- read.csv("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?")
#create filtered data set for specific dates
fepc <- subset(epc, Date == "1/2/2007" | Date == "2/2/2007")
#Add a combined datetime column to table
fepc$dtime <- as.POSIXct(paste(fepc$Date, fepc$Time), format="%d/%m/%Y %H:%M:%S")
#create png file device
png(filename="plot3.png", width=480, height=480)
#create the initial plot
with(fepc, plot(dtime, Sub_metering_1, type="l", xlab="",ylab="Energy sub metering"))
#Add the other lines and legend
lines(fepc$dtime, y=fepc$Sub_metering_2, col="red")
lines(fepc$dtime, y=fepc$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lwd=c(2,2,2))
#close the file device
dev.off()