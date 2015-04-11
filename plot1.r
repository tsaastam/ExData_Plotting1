d <- read.table("household_power_consumption.txt", sep=";", nrows=2880, skip=66637)
names(d) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity",
  "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# 1
hist(d$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
