dataFromFile <- read.csv("household_power_consumption.txt", header = TRUE, 
                         sep = ";", na.strings = "?")

dataFromFile$Date <- as.Date(dataFromFile$Date, format = "%d/%m/%Y")

dataFromFile <- (dataFromFile[
  dataFromFile$Date %in% as.Date(c('2007-02-01', '2007-02-02')), ])

dataFromFile$Timestamps <- paste(dataFromFile$Date, dataFromFile$Time, 
                                 sep = "/")

dataFromFile$Timestamps <- strptime(dataFromFile$Timestamps,
                                    format = "%Y-%m-%d/%H:%M:%S")

Sys.setlocale(category = "LC_TIME", locale = "C")

par(mfrow = c(2, 2))
#first plot:
plot(dataFromFile$Timestamps, dataFromFile$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power")
#second plot:
plot(dataFromFile$Timestamps, dataFromFile$Voltage, type = "l", 
     ylab = "Voltage", xlab = "datetime")
#third plot:
plot(x = dataFromFile$Timestamps, dataFromFile$Sub_metering_1, type = "n", 
     xlab = "", ylab = "Energy sub metering")
lines(dataFromFile$Timestamps, dataFromFile$Sub_metering_1, col = "black")
lines(dataFromFile$Timestamps, dataFromFile$Sub_metering_2, col = "red")
# I'm not sure what color was used in assessment, so I'm using "violet"
lines(dataFromFile$Timestamps, dataFromFile$Sub_metering_3, col = "violet")

legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col = c("black", "red", "violet"), lty = 1, bty = "n")

#fourth plot:
plot(dataFromFile$Timestamps, dataFromFile$Global_reactive_power, type = "l", 
     ylab = "Global_rective_power", xlab = "datetime")