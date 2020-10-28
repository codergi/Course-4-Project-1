library(lubridate)
png("plot2.png", width = 480, height = 480)
data <- read.csv("./household_power_consumption.txt", sep = ";", na.strings = "?")
power <- subset(data, data$Date == "2/1/2007" | data$Date == "2/2/2007")

#combine the strings of "date" and "time" and create columns that will generate the days in the plot
power$DateTime <- strptime(paste(power$Date, power$Time), "%m/%d/%Y %H:%M:%S")

plot(power$DateTime, power$Global_active_power, xlab = "", ylab = "Global Active Power (Kilowatts)", type = "l")
dev.off()