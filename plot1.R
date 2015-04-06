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
allData$Date <- as.Date(allData$Date, '%d/%m/%Y')
data <- subset(allData, Date >= '2007-02-01' & Date <= '2007-02-02')
png('plot1.png', width=480, height=480)
hist(data$Global_active_power, col='red', xlab='Global Active Power (kilowatts)', main='Global Active Power')
dev.off()