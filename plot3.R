## Plot 3 - remember to set your WD!
library(lubridate)

epc = read.table("household_power_consumption.txt", sep = ";", header = TRUE)
epc_feb = subset(epc, Date == "1/2/2007" | Date == "2/2/2007")
epc_feb$Date = as.character(epc_feb$Date)
epc_feb$Time = as.character(epc_feb$Time)
epc_feb$Date_Time = paste(epc_feb$Date, epc_feb$Time, sep = " ")
epc_feb$Date_Time = dmy_hms(epc_feb$Date_Time)

epc_feb$Sub_metering_1 = as.numeric(as.character(epc_feb$Sub_metering_1))
epc_feb$Sub_metering_2 = as.numeric(as.character(epc_feb$Sub_metering_2))

par(pin = c(5,5))
with(epc_feb, plot(Date_Time, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
lines(epc_feb$Date_Time, epc_feb$Sub_metering_1, col = "black")
lines(epc_feb$Date_Time, epc_feb$Sub_metering_2, col = "red")
lines(epc_feb$Date_Time, epc_feb$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lwd = 1, 
       col = c("black","red","blue"))


dev.copy(png, "plot3.png", width = 480, height = 480, units = "px")
dev.off()

