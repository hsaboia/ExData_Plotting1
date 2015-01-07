#File Import
data1 <- read.table("Week 1/Data/household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?")

##Setting Time and Date to the Date/Time Classes
str(data1)
class(data1$Date)
data1$Date <- as.Date(data1$Date, "%d/%m/%Y")
data3 <- filter(data1, Date == "2007-02-01" |Date == "2007-02-02")
str(data3)
data3$DateTime <- paste(data3$Date, data3$Time)
data3$DateTime <- strptime(data3$DateTime, format = "%Y-%m-%d %H:%M:%S")

#Plot 4
par(mfcol = c(2,2)) 

with(data3, plot(DateTime, Global_active_power,xlab = " ", ylab = "Global Active Power (killowatts)",type = "n"))
lines(data3$DateTime, data3$Global_active_power, lwd=1)

with(data3,plot(DateTime, Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = " "))
with(data3, lines(DateTime, Sub_metering_1, lwd = 1))
with(data3, lines(DateTime, Sub_metering_2, lwd = 1, col = "red"))
with(data3, lines(DateTime, Sub_metering_3, lwd = 1, col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1,1,1), box.col = "white")

with(data3, plot(DateTime, Voltage,xlab = "datetime", ylab = "Voltage",type = "n"))
lines(data3$DateTime, data3$Voltage, lwd=1)

with(data3, plot(DateTime, Global_reactive_power,xlab = "datetime", ylab = "Global_reactive_power",type = "n"))
lines(data3$DateTime, data3$Global_reactive_power, lwd=1)