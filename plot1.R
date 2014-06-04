dat = read.csv("household_power_consumption.txt", header = TRUE, sep=";")
com_dat <- subset(dat, Date %in% c("1/2/2007", "2/2/2007"))
# this function will drop all values which cannot be converted
gl <- as.numeric(as.character(com_dat$Global_active_power))
hist(gl, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", width = 480, height = 480)
dev.off()