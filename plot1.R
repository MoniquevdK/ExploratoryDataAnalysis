# read in the data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

# take a susbset of the data according to date
d1 <- as.Date("2007-02-01")
d2 <- as.Date("2007-02-02")
df <- data[as.Date(data$Date, "%d/%m/%Y") %in% d1:d2, ]

# create plot 1
png(filename = "plot1.png", width = 480, height = 480, units = "px")
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
hist(df$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()