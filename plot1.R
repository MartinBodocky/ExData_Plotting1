dat = read.csv("household_power_consumption.txt", header = TRUE, sep=";")
com_dat <- subset(dat, Date %in% c("1/2/2007", "2/2/2007"))
# this function will drop all values which cannot be converted
gl <- as.numeric(as.character(com_dat$Global_active_power))
hist(gl, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", width = 480, height = 480)
dev.off()

#plot(com_dat$Global_active_power , com_dat$Date)

within(com_dat, {
    TimeStamp = format(as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S") 
    })
par(mfcol=c(1,1))
com_dat$TimeStamp = strptime(paste(com_dat$Date, com_dat$Time), "%d/%m/%Y %H:%M:%S")


plot(y=gl ,x= com_dat$TimeStamp, col="black", 
     type="l", ylab="Global Active Power")
title()
abline(com_dat$Global_active_power ~ com_dat$TimeStamp)

set.seed(1234)
x <- 1:20
y1 <- rnorm(20, 5, 1)
y2 <- rnorm(20,20, 2)
y3 <- rnorm(20,5, 3)

plot(x,y1,type="l",col="red", ylab = "Y1/Y3")
points (x,y3, col = "green4", pch = 19)

