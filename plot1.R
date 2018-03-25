## Data file is placed in working directory
## read file
epc<-read.table('household_power_consumption.txt', header=TRUE, sep=";", na.strings="?")

epc$Date <-as.Date(epc$Date, format="%d/%m/%Y")
epc$Time <-format(epc$Time, format="%H:%M:%S")
epc<- subset(epc, Date == "2007-02-01" | Date =="2007-02-02")

png("plot1.png", width=480, height=480)
hist(epc$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main = "Global Active Power")
dev.off()