## Data file is placed in working directory
## read file
epc<-read.table('household_power_consumption.txt', header=TRUE, sep=";", na.strings="?")



DateTime <- strptime(paste(epc$Date, epc$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
epc <- cbind(epc, DateTime)

epc$Date <-as.Date(epc$Date, format="%d/%m/%Y")
epc$Time <-format(epc$Time, format="%H:%M:%S")
epc<- subset(epc, Date == "2007-02-01" | Date =="2007-02-02")

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
with(epc, plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power"))
with(epc, plot(DateTime, Voltage, type = "l", xlab="datetime", ylab="Voltage"))
with(epc, plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
lines(epc$DateTime, epc$Sub_metering_2,type="l", col= "red")
lines(epc$DateTime, epc$Sub_metering_3,type="l", col= "blue")
legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))
with(epc, plot(DateTime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))
dev.off()