dataFromFile <- read.csv("household_power_consumption.txt", header = TRUE, 
                         sep = ";", na.strings = "?")

dataFromFile$Date <- as.Date(dataFromFile$Date, format = "%d/%m/%Y")

dataFromFile <- (dataFromFile[
  dataFromFile$Date %in% as.Date(c('2007-02-01', '2007-02-02')), ])

hist(dataFromFile$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "red")