## Plot 4 - remember to set your WD!
library(lubridate)

epc = read.table("household_power_consumption.txt", sep = ";", header = TRUE)
epc_feb = subset(epc, Date == "1/2/2007" | Date == "2/2/2007")
epc_feb$Date = as.character(epc_feb$Date)
epc_feb$Time = as.character(epc_feb$Time)
epc_feb$Date_Time = paste(epc_feb$Date, epc_feb$Time, sep = " ")
epc_feb$Date_Time = dmy_hms(epc_feb$Date_Time)

epc_feb$Global_active_power = as.numeric(as.character(epc_feb$Global_active_power))

epc_feb$Sub_metering_1 = as.numeric(as.character(epc_feb$Sub_metering_1))
epc_feb$Sub_metering_2 = as.numeric(as.character(epc_feb$Sub_metering_2))

par(mfrow = c(2,2), mar = c(4,4,2,2), oma = c(1,1,0,0))

with(epc_feb, plot(Date_Time, Global_active_power, type = "n", 
                   xlab = "", 
                   ylab = "Global Active Power"))
lines(epc_feb$Date_Time, epc_feb$Global_active_power, lty = 1)

epc_feb$Voltage = as.numeric(as.character(epc_feb$Voltage))
with(epc_feb, plot(Date_Time, Voltage, type = "n", xlab = "datetime", ylab = "Voltage"))
lines(epc_feb$Date_Time, epc_feb$Voltage)

with(epc_feb, plot(Date_Time, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
lines(epc_feb$Date_Time, epc_feb$Sub_metering_1, col = "black")
lines(epc_feb$Date_Time, epc_feb$Sub_metering_2, col = "red")
lines(epc_feb$Date_Time, epc_feb$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lwd = 1, 
       col = c("black","red","blue"))

epc_feb$Global_reactive_power = as.numeric(as.character(epc_feb$Global_reactive_power))
with(epc_feb, plot(Date_Time, Global_reactive_power, type = "n", xlab = "datetime"))
lines(epc_feb$Date_Time, epc_feb$Global_reactive_power)

dev.copy(png, "plot4.png", width = 800, height = 480, units = "px")
dev.off()