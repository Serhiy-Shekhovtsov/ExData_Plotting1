# Exploratory Data Analysis. Course Project 1

### LOAD DATA ###

# check if we have truncated data
if (file.exists("data\\household_power_consumption_truncated.txt")) {
    # load truncated data
    data = read.csv("data\\household_power_consumption_truncated.txt")
} else {
    # load full file
    data = read.csv("data\\household_power_consumption.txt", sep=";")
    
    # we need only data from the dates 2007-02-01 and 2007-02-02
    dates = as.Date(data$Date, "%d/%m/%Y")
    
    from_date = as.Date("2007-02-01", "%Y-%m-%d")
    to_date = as.Date("2007-02-02", "%Y-%m-%d")
    
    # truncate and save
    data = data[dates >= from_date & dates <= to_date, ]
    write.csv(data, file = "data\\household_power_consumption_truncated.txt", row.names=FALSE)
}


### LET'S ROCK ###

# drawing to a file
png(filename="plot3.png", bg = "transparent")


n = length(data$Sub_metering_1)

# draw a plot
plot(data$Sub_metering_1, type="n",  xlab = " ", ylab="Energy sub metering", xaxt="n")
lines(data$Sub_metering_1)
lines(data$Sub_metering_2, col="red")
lines(data$Sub_metering_3, col="blue")
legend("topright", lty = 1, col = c("black", "blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

axis(1, at=c(1, n / 2, n-1), lab=c("Thu", "Fri", "Sat"))
# save
dev.off()
