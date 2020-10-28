library(lubridate)
png("plot4.png", width = 480, height = 480)
data <- read.csv("./household_power_consumption.txt", sep = ";", na.strings = "?")
power <- subset(data, data$Date == "2/1/2007" | data$Date == "2/2/2007")
power$DateTime <- strptime(paste(power$Date, power$Time), "%m/%d/%Y %H:%M:%S")
par(mfcol = c(2, 2))
par(mar = c(4, 6, 4, 2))
plot(power$DateTime, power$Global_active_power, xlab = "", ylab = "Global Active Power (Kilowatts)", type = "l")

plot(power$DateTime, power$Sub_metering_3, col = "blue", type = "l", xlab = "", ylab = "Energy sub metering")
lines(power$DateTime, power$Sub_metering_2, col = "red", type = "l")
lines(power$DateTime, power$Sub_metering_1, col = "black", type = "l")
legend("topright",  pch = 4, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(power$DateTime, power$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")

plot(power$DateTime, power$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power",type = "l")
dev.off()