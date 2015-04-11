d <- read.table("household_power_consumption.txt", sep=";", nrows=2880, skip=66637)
names(d) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity",
  "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

d$datetime <- strptime(paste(d$Date, d$Time), format="%e/%m/%Y %H:%M:%S")
names(d)[length(names(d))] <- "datetime"

# 2
png(filename="plot2.png", width=480, height=480)
plot(d$datetime, d$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
