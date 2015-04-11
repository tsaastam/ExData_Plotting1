d <- read.table("household_power_consumption.txt", sep=";", nrows=2880, skip=66637)
names(d) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity",
  "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

d$datetime <- strptime(paste(d$Date, d$Time), format="%e/%m/%Y %H:%M:%S")
names(d)[length(names(d))] <- "datetime"

# 4
png(filename="plot4.png", width=480, height=480)
par(mfrow=c(2,2))
# (1,1)
plot(d$datetime, d$Global_active_power, type="l", xlab="", ylab="Global Active Power")
# (1,2)
with(d, plot(datetime, Voltage, type="l"))
# (2,1)
plot(d$datetime, d$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(d$datetime, d$Sub_metering_2, type="l", col="red")
lines(d$datetime, d$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, bty="n", col=c("black", "blue", "red"), legend=c("Sub_metering_1",
  "Sub_metering_2", "Sub_metering_3"))
# (2,2)
with(d, plot(datetime, Global_reactive_power, type="l"))

dev.off()
