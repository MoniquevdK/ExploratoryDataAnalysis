# read in the data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

# take a susbset of the data according to date
d1 <- as.Date("2007-02-01")
d2 <- as.Date("2007-02-02")
df <- data[as.Date(data$Date, "%d/%m/%Y") %in% d1:d2, ]

# create variable 'datetime'
dt <- paste(df$Date, df$Time)
df$datetime <- strptime(dt, "%d/%m/%Y %H:%M:%S")

# create plot 3
png(filename = "plot3.png", width = 480, height = 480, units = "px")
df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))
plot(df$datetime, df$Sub_metering_1, type="l",  xlab= " ", ylab="Energy sub metering")
lines(df$datetime, df$Sub_metering_2, col="red")
lines(df$datetime, df$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1, cex = 1, col=c("black", "red", "blue"))
dev.off()