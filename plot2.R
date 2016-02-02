# read in the data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

# take a susbset of the data according to date
d1 <- as.Date("2007-02-01")
d2 <- as.Date("2007-02-02")
df <- data[as.Date(data$Date, "%d/%m/%Y") %in% d1:d2, ]

# create variable 'datetime'
dt <- paste(df$Date, df$Time)
df$datetime <- strptime(dt, "%d/%m/%Y %H:%M:%S")

# create plot 2
png(filename = "plot2.png", width = 480, height = 480, units = "px")
Sys.setlocale(category = "LC_ALL", locale = "english")
plot(df$datetime, df$Global_active_power, type="l",  xlab= " ", ylab="Global Active Power (kilowatts)")
dev.off()