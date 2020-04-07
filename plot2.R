## Plot 2 - remember to set your WD!
library(lubridate)

epc = read.table("household_power_consumption.txt", sep = ";", header = TRUE)
epc_feb = subset(epc, Date == "1/2/2007" | Date == "2/2/2007")
epc_feb$Date = as.character(epc_feb$Date)
epc_feb$Time = as.character(epc_feb$Time)
epc_feb$Date_Time = paste(epc_feb$Date, epc_feb$Time, sep = " ")
epc_feb$Date_Time = dmy_hms(epc_feb$Date_Time)
epc_feb$Global_active_power = as.numeric(as.character(epc_feb$Global_active_power))

with(epc_feb, plot(Date_Time, Global_active_power, type = "n", 
                   xlab = "", 
                   ylab = "Global Active Power(kilowatts)"))
lines(epc_feb$Date_Time, epc_feb$Global_active_power, lty = 1)

dev.copy(png, "plot2.png", width = 480, height = 480, units = "px")
dev.off()