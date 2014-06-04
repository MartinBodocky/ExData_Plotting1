dat = read.csv("household_power_consumption.txt", header = TRUE, sep=";")
com_dat <- subset(dat, Date %in% c("1/2/2007", "2/2/2007"))

par(mar=c(4,4,2,2))
par(mfcol=c(2,2))

#Glogal Active Power
# this function will drop all values which cannot be converted
gl <- as.numeric(as.character(com_dat$Global_active_power))
com_dat$TimeStamp = strptime(paste(com_dat$Date, com_dat$Time), "%d/%m/%Y %H:%M:%S")
plot(y=gl ,x= com_dat$TimeStamp, type="l", ylab="Global Active Power (kilowatts)", xlab="")

#Energy sub metering
# this function will drop all values which cannot be converted
Sub_metering_1 <- as.numeric(as.character(com_dat$Sub_metering_1))
Sub_metering_2 <- as.numeric(as.character(com_dat$Sub_metering_2))
Sub_metering_3 <- as.numeric(as.character(com_dat$Sub_metering_3))
com_dat$TimeStamp = strptime(paste(com_dat$Date, com_dat$Time), "%d/%m/%Y %H:%M:%S")
plot(x= com_dat$TimeStamp, y= Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
points(x=com_dat$TimeStamp, y = Sub_metering_1, col='black', type='l')
points(x=com_dat$TimeStamp, y = Sub_metering_2, col='red', type='l')
points(x=com_dat$TimeStamp, y = Sub_metering_3, col='blue', type='l')
legend("topright",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lwd=c(2.5,2.5),
       inset=c(0.07,0), bty = 'n',
       lty=c(1,1), col = c("black","red", "blue"))

#Voltage
voltage <- as.numeric(as.character(com_dat$Voltage))
plot(y=voltage ,x= com_dat$TimeStamp, type="l", ylab="Voltage", xlab="datetime")

# Global Reactive power
reactive_power <- as.numeric(as.character(com_dat$Global_reactive_power))
plot(y=reactive_power ,x= com_dat$TimeStamp, type="l", ylab="Global_reactive_power", xlab="datetime")

dev.copy(png, file="plot4.png", width = 480, height = 480)
dev.off()