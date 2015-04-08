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
png(filename="plot1.png", bg = "transparent")

# get column we need
global_active_power = as.numeric(as.character(data$Global_active_power))

# draw a plot
hist(global_active_power, main="Global Active Power", col="red",
     xlab="Global Active Power (kilowatts)")

# save
dev.off()
