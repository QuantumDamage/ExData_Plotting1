# Reading from file:
dataFromFile <- read.csv("household_power_consumption.txt", header = TRUE, 
                         sep = ";", na.strings = "?")

# Conversion to date:
dataFromFile$Date <- as.Date(dataFromFile$Date, format = "%d/%m/%Y")

# Selecting interesting period of time:
dataFromFile <- (dataFromFile[
  dataFromFile$Date %in% as.Date(c('2007-02-01', '2007-02-02')), ])

# Combining date and time into new column:
dataFromFile$Timestamps <- paste(dataFromFile$Date, dataFromFile$Time, 
                                 sep = "/")

# Converting combined date and time into timestamps:
dataFromFile$Timestamps <- strptime(dataFromFile$Timestamps,
                                    format = "%Y-%m-%d/%H:%M:%S")

# Optional settings for english days names:
Sys.setlocale(category = "LC_TIME", locale = "C")

# Prepairing file:
png(filename="plot3.png")

# Actual plot:
plot(x = dataFromFile$Timestamps, dataFromFile$Sub_metering_1, type = "n", 
     xlab = "", ylab = "Energy sub metering")
lines(dataFromFile$Timestamps, dataFromFile$Sub_metering_1, col = "black")
lines(dataFromFile$Timestamps, dataFromFile$Sub_metering_2, col = "red")
lines(dataFromFile$Timestamps, dataFromFile$Sub_metering_3, col = "blue")

legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1)

# Closing writting to file:
dev.off()