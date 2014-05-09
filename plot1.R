# Reading from file:
dataFromFile <- read.csv("household_power_consumption.txt", header = TRUE, 
                         sep = ";", na.strings = "?")

# Conversion to date:
dataFromFile$Date <- as.Date(dataFromFile$Date, format = "%d/%m/%Y")

# Selecting interesting period of time:
dataFromFile <- (dataFromFile[
  dataFromFile$Date %in% as.Date(c('2007-02-01', '2007-02-02')), ])

# Prepairing file:
png(filename="plot1.png")

# Actual plot:
hist(dataFromFile$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "red")

# Closing writting to file:
dev.off()