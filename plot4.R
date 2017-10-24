#Script to create plot4

#set working dir to where current data is stored
setwd("C:/Users/Rob/Documents/exdata_data_household_power_consumption")
#read in full dataset
epc <- read.csv("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?")
#create filtered data set for specific dates
fepc <- subset(epc, Date == "1/2/2007" | Date == "2/2/2007")
#Add a combined datetime column to table
fepc$dtime <- as.POSIXct(paste(fepc$Date, fepc$Time), format="%d/%m/%Y %H:%M:%S")
#create png file device
png(filename="plot4.png", width=480, height=480)
#Set out plotting area to be 2 x 2
par(mfrow=c(2,2))
#Add the 4 plots to the plot
with(fepc, plot(dtime, Global_active_power, type="l", xlab="",ylab="Global Active Power (kilowatts)"))
with(fepc, plot(dtime, Voltage, type="l", xlab="",ylab="Voltage"))
with(fepc, plot(dtime, Sub_metering_1, type="l", xlab="",ylab="Energy sub metering"))
lines(fepc$dtime, y=fepc$Sub_metering_2, col="red")
lines(fepc$dtime, y=fepc$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lwd=c(1,1,1), cex=(0.75))
with(fepc, plot(dtime, Global_reactive_power, type="l", xlab="datetime"))
#close the file device
dev.off()