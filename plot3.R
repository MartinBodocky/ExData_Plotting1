dat = read.csv("household_power_consumption.txt", header = TRUE, sep=";")
com_dat <- subset(dat, Date %in% c("1/2/2007", "2/2/2007"))

# this function will drop all values which cannot be converted
Sub_metering_1 <- as.numeric(as.character(com_dat$Sub_metering_1))
Sub_metering_2 <- as.numeric(as.character(com_dat$Sub_metering_2))
Sub_metering_3 <- as.numeric(as.character(com_dat$Sub_metering_3))
com_dat$TimeStamp = strptime(paste(com_dat$Date, com_dat$Time), "%d/%m/%Y %H:%M:%S")
par(mar=c(3,6,2,2))
plot(x= com_dat$TimeStamp, y= Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
points(x=com_dat$TimeStamp, y = Sub_metering_1, col='black', type='l')
points(x=com_dat$TimeStamp, y = Sub_metering_2, col='red', type='l')
points(x=com_dat$TimeStamp, y = Sub_metering_3, col='blue', type='l')
legend("topright",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lwd=c(2.5,2.5),
       inset=c(0.07,0), bty = 'n',
       lty=c(1,1), col = c("black","red", "blue"))

dev.copy(png, file="plot3.png", width = 480, height = 480)
dev.off()