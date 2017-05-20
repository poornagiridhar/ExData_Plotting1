png(filename = "plot4.png", width = 480, height = 480, units = "px")
power_data<-read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
power <-subset(power_data,Date=="1/2/2007"| Date=="2/2/2007")
power$Global_active_power <-as.numeric(power$Global_active_power)
power$Time<-strptime(paste(power$Date,power$Time), format = "%d/%m/%Y %H:%M:%S")
par(mfrow = c(2,2))

# 1,1
plot(y=power$Global_active_power,x = power$Time, type = "l", xlab = "",ylab = "Global Active Power (Kilowatts)")
# 1,2
plot(y=power$Voltage ,x = power$Time, type = "l", xlab = "datetime",ylab = "Voltage")
#2,1
plot(y=power$Sub_metering_1,x = power$Time, type = "l", xlab = "",ylab = "Global Active Power (Kilowatts)", col = "black")
lines(y=power$Sub_metering_2,x = power$Time, col = "red")
lines(y=power$Sub_metering_3,x = power$Time, col = "blue")
legend(x = "topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1), col = c("black","red","blue"))
#2,2
plot(y=power$Global_reactive_power ,x = power$Time, type = "l", xlab = "datetime",ylab = "Global_reactive_power")
dev.off(which = dev.cur())
