data <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", header=TRUE)
## or this one:
## data <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?")

data$Date <- as.Date(data$Date, "%d/%m/%Y")
dataSel <- subset (data, Date=="2007-02-01" | Date == "2007-02-02")
with(dataSel, barplot(Global_active_power), col="white")



## read in date/time info in format 'm/d/y h:m:s'
x <- paste(dataSel$Date, dataSel$Time)
dataSel$DateTime <- strptime(x, "%Y-%m-%d %H:%M:%S")

par(mfrow= c(2,2))

## Graph 1, same as part 1
with(dataSel, plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power"))

## Graph 2, 
with(dataSel, plot(DateTime, Voltage, type="l", xlab="datetime", ylab="Voltage"))

## Graph 3: same as part 3
with(dataSel, plot(DateTime, Sub_metering_1 , type="l", xlab="", ylab="Energy sub metering"))
with(dataSel, lines(DateTime, Sub_metering_2 , col="red"))
with(dataSel, lines(DateTime, Sub_metering_3 , col="blue"))
legend("topright", lty=1, border="white", col=c("black", "red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))  

## Graph 4, 
with(dataSel, plot(DateTime, Global_reactive_power , type="l", xlab="datetime"))

dev.copy(png, file="plot4.png")
dev.off()


