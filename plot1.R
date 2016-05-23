data <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", header=TRUE)
## or this one:
## data <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?")

data$Date <- as.Date(data$Date, "%d/%m/%Y")
dataSel <- subset (data, Date=="2007-02-01" | Date == "2007-02-02")
par(mfrow= c(1,1))
with(dataSel, hist(Global_active_power, col="red", xlab= "Global Active Power (killowatts)", main = "Global Active Power"))

dev.copy(png, file="plot1.png")
dev.off()