## Data file is placed in working directory
## read file
epc<-read.table('household_power_consumption.txt', header=TRUE, sep=";", na.strings="?")



DateTime <- strptime(paste(epc$Date, epc$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
epc <- cbind(epc, DateTime)

epc$Date <-as.Date(epc$Date, format="%d/%m/%Y")
epc$Time <-format(epc$Time, format="%H:%M:%S")
epc<- subset(epc, Date == "2007-02-01" | Date =="2007-02-02")

png("plot2.png", width=480, height=480)
with(epc, plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()