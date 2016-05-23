data <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", header=TRUE)
## or this one:
## data <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?")

data$Date <- as.Date(data$Date, "%d/%m/%Y")
dataSel <- subset (data, Date=="2007-02-01" | Date == "2007-02-02")
with(dataSel, barplot(Global_active_power), col="white")


## read in date/time info in format 'm/d/y h:m:s'
x <- paste(dataSel$Date, dataSel$Time)
dataSel$DateTime <- strptime(x, "%Y-%m-%d %H:%M:%S")
with(dataSel, plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power (killowatts)"))

dev.copy(png, file="plot2.png")
dev.off()