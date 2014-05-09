data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";",
                 na.strings = "?")

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

data <- (data[data$Date %in% as.Date(c('2007-02-01','2007-02-02')), ])