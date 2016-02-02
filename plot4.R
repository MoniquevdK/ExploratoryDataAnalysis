# read in the data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

# take a susbset of the data according to date
d1 <- as.Date("2007-02-01")
d2 <- as.Date("2007-02-02")
df <- data[as.Date(data$Date, "%d/%m/%Y") %in% d1:d2, ]

# create variable 'datetime'
dt <- paste(df$Date, df$Time)
df$datetime <- strptime(dt, "%d/%m/%Y %H:%M:%S")

# create plot 4
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfcol=c(2,2))

# upper left plot
plot(df$datetime, df$Global_active_power, type="l",  xlab= " ", ylab="Global Active Power (kilowatts)")

# lower left plot
plot(df$datetime, df$Sub_metering_1, type="l",  xlab= " ", ylab="Energy sub metering")
lines(df$datetime, df$Sub_metering_2, col="red")
lines(df$datetime, df$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", cex = 0.8, lwd=1, col=c("black", "red", "blue"))

# upper right plot
df$Voltage <- as.numeric(as.character(df$Voltage))
plot(df$datetime, df$Voltage, type="l",  xlab= "datetime", ylab="Voltage")

# lower right plot
df$Global_reactive_power <- as.numeric(as.character(df$Global_reactive_power))
plot(df$datetime, df$Global_reactive_power, type="l",  xlab= "datetime", ylab="Global_reactive_power")

dev.off()
par(mfcol=c(1,1))