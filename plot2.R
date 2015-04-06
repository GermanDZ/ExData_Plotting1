classes <- c(
  Date="character",
  Time="character",
  Global_active_power="numeric",
  Global_reactive_power="numeric",
  Voltage="numeric",
  Global_intensity="numeric",
  Sub_metering_1="numeric",
  Sub_metering_2="numeric",
  Sub_metering_3="numeric"
)
allData <- read.csv('household_power_consumption.txt', sep=";", colClasses=classes, na.strings=c("?"))
allData$DateTime <- strptime(paste(allData$Date, allData$Time), '%d/%m/%Y %H:%M:%S')
data <- subset(allData, DateTime >= '2007-02-01' & DateTime < '2007-02-03')
png('plot2.png', width=480, height=480)
plot(data$DateTime, data$Global_active_power, type='l', ylab='Global Active Power (kilowatts)', xlab='', main='')
dev.off()