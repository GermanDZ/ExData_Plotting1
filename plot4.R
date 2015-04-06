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
allData$datetime <- strptime(paste(allData$Date, allData$Time), '%d/%m/%Y %H:%M:%S')
data <- subset(allData, datetime >= '2007-02-01' & datetime < '2007-02-03')
png('plot4.png', width=480, height=480)
par(mfrow=c(2,2))
with(data, plot(datetime, Global_active_power, type='l', ylab='Global Active Power', xlab='', main=''))
with(data, plot(datetime, Voltage, type='l', ylab='Voltage', xlab='', main=''))
with(data, plot(datetime, Sub_metering_1, type='l', ylab='Energy sub metering', xlab='', main=''))
with(data, lines(datetime, Sub_metering_2, type='l', col='red'))
with(data, lines(datetime, Sub_metering_3, type='l', col='blue'))
legend("topright", box.lty=0, lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
with(data, plot(datetime, Global_reactive_power, type='l', main=''))
dev.off()